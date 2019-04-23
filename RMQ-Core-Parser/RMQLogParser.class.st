Class {
	#name : #RMQLogParser,
	#superclass : #RMQParser,
	#classInstVars : [
		'model'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQLogParser class >> initializeContents: aJSonFilePath [

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
RMQLogParser class >> parse: aJSonFilePath [
	|  json |
	json := self initializeContents: aJSonFilePath.
	model := PulseModel new.
	model name: aJSonFilePath asFileReference basenameWithoutExtension.
	
	self populate: model withJson: json
]

{ #category : #parsing }
RMQLogParser class >> populate: aModel withJson: aString [
	| parser rmqObjects |
	parser := PPParserResource current parserAt: PPJsonParser.
	rmqObjects := parser parse: aString.
	rmqObjects
		do: [ :aRMQObject | 
			| message connection queue user node exchange vhost channel routingKeys binding payload component delivMode routedQueues messageType exchangeFormat |
			payload := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'payload')
				withType: RMQPayload
				sourceName: nil.
			message := self populateMessage: aRMQObject payload: payload.
			message timestamp: (aRMQObject at: 'timestamp').
			connection := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'connection')
				withType: RMQConnection
				sourceName: nil.
			queue := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'queue')
				withType: RMQQueue
				sourceName: nil.
			message queue
				ifNil: [ queue sendedMessages add: message.
					message queue: queue ].
			user := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'user')
				withType: RMQUser
				sourceName: nil.
			user usedConnections
				detect: [ :conn | conn = connection ]
				ifNone: [ connection user: user.
					user usedConnections add: connection ].
			node := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'node')
				withType: RMQNode
				sourceName: nil.
			exchange := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'exchange')
				withType: RMQExchange
				sourceName: nil.
			exchange messages add: message.
			message exchange: exchange.
			vhost := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'vhost')
				withType: RMQVHost
				sourceName: nil.
			user vhosts
				detect: [ :vh | vh = vhost ]
				ifNone: [ vhost users add: user.
					user vhosts add: vhost ].
			connection vhost
				ifNil: [ vhost connections add: connection.
					connection vhost: vhost ].
			queue vhost
				ifNil: [ vhost queues add: queue.
					queue vhost: vhost ].
			exchange vhost
				ifNil: [ vhost exchanges add: exchange.
					exchange vhost: vhost ].
			vhost node
				ifNil: [ node vhosts add: vhost.
					vhost node: node ].
			channel := aModel
				selectOrAddEntityNamed: (aRMQObject at: 'channel') asString
				withType: RMQChannel
				sourceName: nil.
			channel vhost
				ifNil: [ vhost channels add: channel.
					channel vhost: vhost ].
			channel connection
				ifNil: [ connection channels add: connection.
					channel connection: connection ].
			user usedChannels
				detect: [ :ch | ch = channel ]
				ifNone: [ channel user: user.
					user usedChannels add: channel ].
			routingKeys := self populateRoutingKeys: aRMQObject.
			routedQueues := self populateRoutedQueues: aRMQObject.
			routedQueues
				do: [ :aQueue | 
					"link with channels"
					aQueue consumerChannels add: channel.
					channel consumedQueues add: aQueue.

					"link with messages"
					aQueue messages add: message.
					message routedQueues add: aQueue.

					"add the bindings"
					routingKeys
						do: [ :aRoutingKey | 
							binding := RMQBindingWithQueue new.
							binding destination: aQueue.
							aQueue destinationBindings add: binding.
							binding source: exchange.
							exchange sourceBindings add: binding.
							binding routingKey: aRoutingKey.
							aRoutingKey binding: binding.
							aModel allRMQBindings
								detect: [ :el | 
									el source = binding source
										and: [ el destination = binding destination
												and: [ el routingKey = binding routingKey ] ] ]
								ifFound: [ :elementFound |  ]
								ifNone: [ aModel add: binding ] ] ].


			"set the exchange format"
			aModel allRMQExchangeFormats
				detect: [ :el | 
					el exchangeFormatSchema
						=
							(((aRMQObject at: 'properties') at: 'headers')
								at: 'X-ExchangeFormatSchema') ]
				ifFound: [ :elementFound | exchangeFormat := elementFound ]
				ifNone: [ exchangeFormat := RMQExchangeFormat new.
					exchangeFormat
						exchangeFormatSchema:
							(((aRMQObject at: 'properties') at: 'headers')
								at: 'X-ExchangeFormatSchema').
					exchangeFormat
						exchangeFormatType:
							(((aRMQObject at: 'properties') at: 'headers')
								at: 'X-ExchangeFormatId').
					exchangeFormat mooseModel: aModel.
					aModel add: exchangeFormat ].
			message exchangeFormat: exchangeFormat.
			exchangeFormat messages add: message.
			messageType := self populateType: aRMQObject.
			message messageType: messageType.
			messageType messages add: message.
			(aRMQObject at: 'properties')
				at: 'app_id'
				ifPresent: [ component := aModel
						selectOrAddEntityNamed: ((aRMQObject at: 'properties') at: 'app_id')
						withType: RMQComponent
						sourceName: nil.
					component senderMessages add: message.
					message senderComponent: component.
					component subscribedChannels
						detect: [ :ch | ch = channel ]
						ifNone: [ component subscribedChannels add: channel.
							channel subscribedComponent: component ].
					component exchanges
						detect: [ :exch | exch = exchange ]
						ifNone: [ component exchanges add: exchange.
							exchange components add: component ] ].
			delivMode := self populateDeliveryMode: aRMQObject.
			message deliveryMode: delivMode.
			delivMode messages add: message ].
	MooseModel root add: aModel
]

{ #category : #parsing }
RMQLogParser class >> populateDeliveryMode: aRMQObject [
	| newType |
	newType := DeliveryMode perform: (((aRMQObject at: 'properties') at: 'delivery_mode') = 2 ifTrue:[#persistent] ifFalse:[#nonPersistent]).
	model allDeliveryModes
		detect: [ :el | el rmqState = newType rmqState ]
		ifFound: [ :elementFound | 
			^elementFound]
		ifNone: [ model add: newType.
			^newType ]
]

{ #category : #parsing }
RMQLogParser class >> populateHeaders: aHeader [
	| newHeader headers |
	headers := OrderedCollection new.
	newHeader := RMQHeader new
		pulseName: aHeader.
	model allRMQHeaders
		detect: [ :el | el pulseName = newHeader pulseName ]
		ifFound: [ :elementFound | 
			headers add: elementFound.
			^elementFound]
		ifNone: [
			newHeader mooseModel: model.
			headers add: newHeader.
			^newHeader].
]

{ #category : #parsing }
RMQLogParser class >> populateMessage: aRMQObject payload: payload [
	|message|
	message := RMQMessage new 
				payload: payload.
	
	model allRMQMessages
		detect: [ :el | el payload pulseName = message payload pulseName ]
		ifFound: [ :elementFound | 
			elementFound payload messages add: message.
			^elementFound. ]
		ifNone: [ model add: message.
			payload messages add: message.
			^message. ].
]

{ #category : #parsing }
RMQLogParser class >> populateRoutedQueues: aRMQObject [
	| newRoutedQueue routedQueues  |
	routedQueues := OrderedCollection new.
	(aRMQObject at: 'routed_queues') = 'none'
		ifTrue: [ 
			|routed_queue|
			routed_queue := RMQQueue new
				pulseName: (aRMQObject at: 'routed_queues').
			model allRMQQueues
				detect: [ :el | el pulseName = routed_queue pulseName ]
				ifFound: [ :elementFound | ]
				ifNone: [ routed_queue mooseModel: model.
					routedQueues add: routed_queue ] ]
		ifFalse: [ (aRMQObject at: 'routed_queues')
				do: [ :aRoutedQueue | 
					newRoutedQueue := RMQQueue new
						pulseName: aRoutedQueue.
					model allRMQQueues
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
RMQLogParser class >> populateRoutingKeys: aRMQObject [
	| newRoutingKey routingKeys|
	routingKeys := OrderedCollection new.
	(aRMQObject at: 'routing_keys')
		do: [ :aRoutingKey | 
			newRoutingKey := RMQRoutingKey new
				pulseName: aRoutingKey.
			model allRMQRoutingKeys
				detect: [ :el | el pulseName = newRoutingKey pulseName ]
				ifFound: [ :elementFound | 
					routingKeys add: elementFound.]
				ifNone: [ newRoutingKey mooseModel: model.
					routingKeys add: newRoutingKey ].
			].
	^ routingKeys 
]

{ #category : #parsing }
RMQLogParser class >> populateType: aRMQObject [
	| newType |
	newType := MessageType perform: ((aRMQObject at: 'type') asSymbol).
	model allMessageTypes
		detect: [ :el | el rmqState = newType rmqState ]
		ifFound: [ :elementFound | 
			^elementFound]
		ifNone: [ model add: newType.
			^newType ]
]
