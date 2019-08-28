Class {
	#name : #PulseLogParser,
	#superclass : #PulseParser,
	#instVars : [
		'model'
	],
	#classInstVars : [
		'model'
	],
	#category : #'Pulse-Parser'
}

{ #category : #parsing }
PulseLogParser >> initializeContents: aJSonFilePath [

| json ws |
json := (aJSonFilePath asFileReference) contents.

json := json copyReplaceAll: '}', String lf, '{' with: '},', String lf, '{'.
json := json copyReplaceAll: '}{' with: '},{'.
json := json copyReplaceAll: '} {' with: '},{'.

json first = $[ 
	ifFalse: [ 
		
		ws := WriteStream with:'['.
		ws nextPutAll: json.
		ws nextPutAll: ']'. 
		json := ws contents.
	].
^json
]

{ #category : #parsing }
PulseLogParser >> parse: aJSonFilePath [
	|  json |
	json := self initializeContents: aJSonFilePath.
	model := PulseModel new.
	model name: aJSonFilePath asFileReference basenameWithoutExtension.
	self sourceName: aJSonFilePath.
	self populate: model withJson: json
]

{ #category : #parsing }
PulseLogParser >> populate: aModel withJson: aString [
	| parser rmqObjects exchangeName |
	model := aModel.
	rmqObjects := STONJSON fromString: aString.
	rmqObjects
		do: [ :aRMQObject | 
			| message connection queue user node exchange vhost channel routingKeys binding payload delivMode routedQueues messageType exchangeFormat publisherComponent consumerComponent tenantId queueName consumerComponentName |
			node := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'node')
				withType: PulseNode
				sourceName: self sourceName.
			vhost := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'vhost')
				withType: PulseVHost
				sourceName: self sourceName.
			vhost node
				ifNil: [ node vhosts add: vhost.
					vhost node: node ].
			payload := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'payload')
				withType: PulsePayload
				sourceName: self sourceName.

			" search the message by its ID "
			"message := self populateMessage: aRMQObject payload: payload."
			"message := self populateMessage: aRMQObject messageId:  ((aRMQObject at: 'properties') at: 'message_id')."
			message := aModel
				selectOrAddEntityNamed: ((aRMQObject at: 'properties') at: 'message_id')
				withType: PulseMessage
				sourceName: self sourceName.
			message payload: payload.
			payload messages add: message.
			message timestamp: (aRMQObject at: 'timestamp').
			connection := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'connection')
				withType: PulseConnection
				sourceName: self sourceName.
			(vhost connections anySatisfy: [ :e | e = connection ])
				ifFalse: [ vhost connections add: connection.
					connection vhost: vhost ].
			user := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'user')
				withType: PulseUser
				sourceName: self sourceName.
			user usedConnections
				detect: [ :conn | conn = connection ]
				ifNone: [ connection user: user.
					user usedConnections add: connection ].
			user vhosts
				detect: [ :vh | vh = vhost ]
				ifNone: [ vhost users add: user.
					user vhosts add: vhost ].
			exchangeName := aRMQObject at: 'exchange'.
			exchange := aModel
				selectOrAddEntityNamed: exchangeName
				withType: PulseExchange
				sourceName: self sourceName.
			exchange publishedMessages add: message.
			message publishedToExchange: exchange.
			"set topicId"
			((exchangeName substrings: '.') at: 1) = 'pubsub'
				ifTrue: [ exchange topicID: ((exchangeName substrings: '.') at: 3) ].
			exchange vhost
				ifNil: [ vhost exchanges add: exchange.
					exchange vhost: vhost ].
			channel := aModel
				selectOrAddEntityNamed:
					((aRMQObject at: 'connection') , ' ('
						, (aRMQObject at: 'channel') asStringWithCommas , ')') asString
				withType: PulseChannel
				sourceName: self sourceName.
			channel vhost
				ifNil: [ vhost channels add: channel.
					channel vhost: vhost ].
			channel connection
				ifNil: [ connection channels add: channel.
					channel connection: connection ].
			user usedChannels
				detect: [ :ch | ch = channel ]
				ifNone: [ channel user: user.
					user usedChannels add: channel ].

			"update see traceParser "
			delivMode := self populateDeliveryMode: aRMQObject.
			message deliveryMode: delivMode.
			delivMode messages add: message.

			"ne pas peupler le message type, à récupérer depuis les references dans deliveredFromQueue"
			"messageType := self populateType: aRMQObject.
			message messageType: messageType.
			messageType messages add: message."

			"messages can be : published or  receiv"

			"consumer or publisher : tow cases according to trace type"
			(aRMQObject at: 'type') = 'published'
				ifTrue: [ "case message published"
					"set the publisher"
					(aRMQObject at: 'properties')
						at: 'app_id'
						ifPresent: [ publisherComponent := aModel
								selectOrAddEntityNamed: ((aRMQObject at: 'properties') at: 'app_id')
								withType: PulsePublisherComponent
								sourceName: self sourceName.
							publisherComponent
								appId: ((aRMQObject at: 'properties') at: 'app_id').
							publisherComponent messagesFromPublisher add: message.
							message publisherComponent: publisherComponent.
							tenantId := aModel
								selectOrAddEntityNamed: (((aRMQObject at: 'properties') at: 'headers') at: 'X-TenantId')
								withType: PulseTenant
								sourceName: self sourceName.
							publisherComponent tenantId: tenantId.
							publisherComponent usedChannels
								detect: [ :ch | ch = channel ]
								ifNone: [ publisherComponent usedChannels add: channel.
									channel publisherComponent: publisherComponent ].
							publisherComponent exchanges
								detect: [ :exch | exch = exchange ]
								ifNone: [ publisherComponent exchanges add: exchange.
									exchange publisherComponents add: publisherComponent ] ]

					"if routed_queues is present and not null : message published and routed 
	         if routed_queues is present and  null : message published and not routed  "
					"vérifier d'abord si'il y a plus d'un element dans la liste "
					"aDictionnary at: 'routed_queues' ifPresent: 
			    [ 	
              routedQueues := (aDictionnary at: 'routed_queues'). 
              
              ( routedQueues size = 1) 
              ifTrue: [  routedQueue := aModel selectOrAddEntityNamed: routedQueues withType: RMQQueue.				
				      ""link with messages""
				      routedQueue routedMessages add: messageObject.
				      messageObject routedToQueues add: routedQueue.	  
					
					   ""set vhost""		
						routedQueue vhost: vhost. 
						vhost queues add: routedQueue.  ]. 
				  ( routedQueues size >= 1) 
              ifTrue: [  routedQueues do: [ :aRoutedQueue |
				      routedQueue := aModel selectOrAddEntityNamed: aRoutedQueue withType: RMQQueue.				
				      ""link with messages""
				      routedQueue routedMessages add: messageObject.
				      messageObject routedToQueues add: routedQueue.	  
					
					   ""set vhost""		
						routedQueue vhost: vhost. 
						vhost queues add: routedQueue. 
				    ].		
					].	
				 ]." ]
				ifFalse: [ "case message delivered"
					"set the consumer"
					" if routed_queues is not present and trace type deliver : message delivered to consumer"
					"get the module id to create the consumerComponent, the moduleId is part of the resource (here queue),  set subscribedChannel of consumerComponent, link channel to related queue, and queue to the message "
					"set the queue from which the message was delivered "
					queueName := aRMQObject at: 'queue'.
					queue := aModel
						selectOrAddEntityNamed: queueName
						withType: PulseQueue
						sourceName: self sourceName.
					queue deliveredMessages add: message.
					message deliveredFromQueues add: queue.
					queue vhost
						ifNil: [ vhost queues add: queue.
							queue vhost: vhost ].


					"set the consumer"	" link with message ?"
					" get the consumer component id from the 4 th part of the queue name !!  "
					((queueName substrings: '.') at: 1) = 'pubsub'
						ifTrue: [ consumerComponentName := (queueName substrings: '.') at: 4.
							consumerComponent := aModel
								selectOrAddEntityNamed: consumerComponentName
								withType: PulseConsumerComponent
								sourceName: self sourceName.
							consumerComponent appId: ((queueName substrings: '.') at: 4).
							consumerComponent subscribedChannels
								detect: [ :ch | ch = channel ]
								ifNone: [ consumerComponent subscribedChannels add: channel.
									channel consumerComponent: consumerComponent ] ].
					channel consumedQueues add: queue.
					queue consumerChannels add: channel ].
			routingKeys := self populateRoutingKeys: aRMQObject.
			routedQueues := self populateRoutedQueues: aRMQObject.
			routedQueues
				do: [ :aQueue | 
					"link with channels"
					aQueue consumerChannels add: channel.
					channel consumedQueues add: aQueue.

					"link with messages"
					aQueue routedMessages add: message.
					message routedToQueues add: aQueue.

					"add the bindings"
					routingKeys
						do: [ :aRoutingKey | 
							binding := PulseBindingWithQueue new.
							binding destination: aQueue.
							aQueue destinationBindings add: binding.
							binding source: exchange.
							exchange sourceBindings add: binding.
							binding routingKey: aRoutingKey.
							aRoutingKey bindings add: binding.
							aModel allPulseBindings
								detect: [ :el | 
									el source = binding source
										and: [ el destination = binding destination
												and: [ el routingKey = binding routingKey ] ] ]
								ifFound: [ :elementFound |  ]
								ifNone: [ aModel add: binding ] ] ].


			"set the exchange format"
			exchangeFormat := aModel
				selectOrAddEntityNamed:
					(((aRMQObject at: 'properties') at: 'headers')
						at: 'X-ExchangeFormatSchema')
				withType: PulseExchangeFormat
				sourceName: self sourceName.
			"aModel allRMQExchangeFormats
		   detect: [ :el | el exchangeFormatSchema  = (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema') ]
		   ifFound: [ :elementFound | 
			exchangeFormat := elementFound. ]
		   ifNone: [ 
			  exchangeFormat := RMQExchangeFormat new. 
			  exchangeFormat exchangeFormatSchema: (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema'). 
			  exchangeFormat mooseModel: aModel.
		     aModel add: exchangeFormat]."
			exchangeFormat
				exchangeFormatType:
					(((aRMQObject at: 'properties') at: 'headers')
						at: 'X-ExchangeFormatId').

			"aModel allRMQExchangeFormats
		   detect: [ :el | el exchangeFormatSchema  = (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema') ]
		   ifFound: [ :elementFound | 
			exchangeFormat := elementFound. ]
		   ifNone: [ 
			  exchangeFormat := RMQExchangeFormat new. 
			  exchangeFormat exchangeFormatSchema: (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema'). 
			  exchangeFormat exchangeFormatType: (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatId').
			  exchangeFormat mooseModel: aModel.
		     aModel add: exchangeFormat]."
			message exchangeFormat: exchangeFormat.
			exchangeFormat messages add: message ].
	MooseModel root add: aModel
]

{ #category : #parsing }
PulseLogParser >> populateDeliveryMode: aRMQObject [
	| newType |
	newType := PulseDeliveryMode perform: (((aRMQObject at: 'properties') at: 'delivery_mode') = 2 ifTrue:[#persistent] ifFalse:[#nonPersistent]).
	model allPulseDeliveryModes
		detect: [ :el | el pulseState = newType pulseState ]
		ifFound: [ :elementFound | 
			^elementFound]
		ifNone: [ model add: newType.
			^newType ]
]

{ #category : #parsing }
PulseLogParser >> populateMessage: aRMQObject messageId: id [
	| message |
	
	model allPulseMessages
		detect: [ :el | el messageID  = id  ]
		ifFound: [ :elementFound | 
			^elementFound. ]
		ifNone: [ 
			  message := PulseMessage new. 
			  message messageID: id.
			  message mooseModel: model. 
			  model add: message.
			^message ].
]

{ #category : #parsing }
PulseLogParser >> populateMessage: aRMQObject payload: payload [
	|message|
	message := PulseMessage new 
				payload: payload.
	
	model allPulseMessages
		detect: [ :el | el payload pulseName = message payload pulseName ]
		ifFound: [ :elementFound | 
			elementFound payload messages add: message.
			^elementFound. ]
		ifNone: [ model add: message.
			payload messages add: message.
			^message. ].
]

{ #category : #parsing }
PulseLogParser >> populateRoutedQueues: aRMQObject [
	| newRoutedQueue routedQueues  |
	routedQueues := OrderedCollection new.
	(aRMQObject at: 'routed_queues') = 'none'
		ifTrue: [ 
			|routed_queue|
			routed_queue := PulseQueue new
				pulseName: (aRMQObject at: 'routed_queues').
			model allPulseQueues
				detect: [ :el | el pulseName = routed_queue pulseName ]
				ifFound: [ :elementFound | ]
				ifNone: [ routed_queue mooseModel: model.
					routedQueues add: routed_queue ] ]
		ifFalse: [ (aRMQObject at: 'routed_queues')
				do: [ :aRoutedQueue | 
					newRoutedQueue := PulseQueue new
						pulseName: aRoutedQueue.
					model allPulseQueues
						detect: [ :el | el pulseName = newRoutedQueue pulseName ]
						ifFound: [ :elementFound | 
							routedQueues add: elementFound.]
						ifNone: [ newRoutedQueue mooseModel: model.
							routedQueues add: newRoutedQueue ].
					] .
				].
			
		^ routedQueues
]

{ #category : #parsing }
PulseLogParser >> populateRoutingKeys: aRMQObject [
	| newRoutingKey routingKeys|
	routingKeys := OrderedCollection new.
	(aRMQObject at: 'routing_keys')
		do: [ :aRoutingKey | 
			newRoutingKey := PulseRoutingKey new
				pulseName: aRoutingKey.
			model allPulseRoutingKeys
				detect: [ :el | el pulseName = newRoutingKey pulseName ]
				ifFound: [ :elementFound | 
					routingKeys add: elementFound.]
				ifNone: [ newRoutingKey mooseModel: model.
					routingKeys add: newRoutingKey ].
			].
	^ routingKeys 
]

{ #category : #parsing }
PulseLogParser >> populateType: aRMQObject [
	| newType |
	newType := PulseMessageType perform: ((aRMQObject at: 'type') asSymbol).
	model allPulseMessageTypes
		detect: [ :el | el pulseState = newType pulseState ]
		ifFound: [ :elementFound | 
			^elementFound]
		ifNone: [ model add: newType.
			^newType ]
]
