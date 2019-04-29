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
	| parser rmqObjects exchangeName |
	parser := PPParserResource current parserAt: PPJsonParser.
	rmqObjects := parser parse: aString.
	
	rmqObjects do: [:aRMQObject | 
			| message connection queue user node exchange vhost channel routingKeys binding payload component delivMode routedQueues messageType exchangeFormat  publisherComponent consumerComponent tenantId queueName consumerComponentName |
			
			node := aModel selectOrAddEntityNamed: (aRMQObject at: 'node') withType: RMQNode.
			
			vhost := aModel selectOrAddEntityNamed: (aRMQObject at: 'vhost') withType: RMQVHost.
			vhost node ifNil:[
				node vhosts add: vhost.
				vhost node: node.
			].
			
			payload := aModel selectOrAddEntityNamed: (aRMQObject at: 'payload') withType: RMQPayload.
			
			"to do : search the message by the ID, see traceParser  "
			message := self populateMessage: aRMQObject payload: payload.
			message timestamp: (aRMQObject at: 'timestamp').
			
			connection := aModel selectOrAddEntityNamed: (aRMQObject at: 'connection') withType: RMQConnection.
			
			(vhost connections anySatisfy: [ :e | e = connection ])
		   ifFalse: [ vhost connections add: connection. connection vhost: vhost ].
			
		
			user := aModel selectOrAddEntityNamed: (aRMQObject at: 'user') withType: RMQUser.
			user usedConnections 
				detect: [:conn| conn = connection ]
				ifNone: [
					connection user: user.
					user usedConnections add: connection.
				].
		  	user vhosts 
				detect: [:vh| vh = vhost ]
				ifNone: [
					vhost users add: user.
					user vhosts add: vhost.
				].
			
			exchangeName  := (aRMQObject at: 'exchange').
			exchange := aModel selectOrAddEntityNamed: exchangeName withType: RMQExchange.
			exchange publishedMessages add: message.
			message publishedToExchange: exchange.
			"set topicId"
	      (((exchangeName substrings: '.') at: 1) = 'pubsub' )  ifTrue: [ exchange topicID: ((exchangeName substrings: '.') at: 3) ].
			
			exchange vhost ifNil:[
				vhost exchanges add: exchange.
				exchange vhost: vhost.
			].
			
			channel := aModel selectOrAddEntityNamed: ((aRMQObject at: 'connection'), ' (', ((aRMQObject at: 'channel') asStringWithCommas), ')' )  asString withType: RMQChannel.
			channel vhost ifNil:[
				vhost channels add: channel.
				channel vhost: vhost.
			].
			channel connection ifNil:[
				connection channels add: connection.
				channel connection: connection.
			].
			user usedChannels 
				detect: [:ch| ch = channel ]
				ifNone: [
					channel user: user.
					user usedChannels add: channel.
				].
			
		   "update see traceParser "
			delivMode := self populateDeliveryMode: aRMQObject.
			message deliveryMode: delivMode.
			delivMode messages add: message.
			
			
			messageType := self populateType: aRMQObject.
			message messageType: messageType.
			messageType messages add: message.
			
			"messages can be : published or  receiv"
	
			"consumer or publisher : tow cases according to trace type"	
			((aRMQObject at: 'type') = 'published' ) ifTrue:[  "case message published"
				
          "set the publisher"        
			 (aRMQObject at: 'properties') at: 'app_id' ifPresent:[
				publisherComponent := aModel selectOrAddEntityNamed: ((aRMQObject at: 'properties') at: 'app_id') withType: RMQPublisherComponent.
				
				publisherComponent appId: ((aRMQObject at: 'properties') at: 'app_id'). 
				
				publisherComponent messagesFromPublisher add: message.
				message publisherComponent: publisherComponent.
				
				tenantId := aModel selectOrAddEntityNamed: (((aRMQObject at: 'properties') at: 'headers') at: 'X-TenantId') withType: RMQTenant. 
				publisherComponent tenantId: tenantId. 
			
				publisherComponent usedChannels 
					detect: [:ch| ch = channel ]
					ifNone: [
						publisherComponent usedChannels add: channel.
						channel publisherComponent: publisherComponent.
					].
			
				publisherComponent exchanges 
					detect: [:exch| exch = exchange ]
					ifNone: [
						publisherComponent exchanges add: exchange.
						exchange publisherComponents add: publisherComponent.
					].
			   ].
		
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
				 ]."
			
			] ifFalse: [   "case message delivered"
			"set the consumer"
			" if routed_queues is not present and trace type deliver : message delivered to consumer"
			"get the module id to create the consumerComponent, the moduleId is part of the resource (here queue),  set subscribedChannel of consumerComponent, link channel to related queue, and queue to the message "	
				
             "set the queue from which the message was delivered "
             queueName := (aRMQObject at: 'queue'). 
			    queue := aModel selectOrAddEntityNamed: queueName withType: RMQQueue.
			
	     
				 queue deliveredMessages add: message.
				 message deliveredFromQueues add: queue.
		    	
			    queue vhost ifNil:[
				 vhost queues add: queue.
				 queue vhost: vhost. ].
		
				
				  "set the consumer" " link with message ?"
				  " get the consumer component id from the 4 th part of the queue name !!  "
				 (((queueName substrings: '.') at: 1) = 'pubsub' )  ifTrue: [ consumerComponentName := ((queueName substrings: '.') at: 4). 
				  consumerComponent := aModel selectOrAddEntityNamed: consumerComponentName withType: RMQConsumerComponent.
				
				  consumerComponent appId: (( queueName substrings: '.') at: 4 ). 
			
				  consumerComponent subscribedChannels 
					detect: [:ch| ch = channel ]
					ifNone: [
						consumerComponent subscribedChannels add: channel.
						channel consumerComponent: consumerComponent.
					].
				   ].
						
				   channel consumedQueues add: queue. 
				   queue consumerChannels add: channel. 
				
			 ].
			
		
			routingKeys := self populateRoutingKeys: aRMQObject.
			
			routedQueues := self populateRoutedQueues: aRMQObject.
			
			routedQueues do:[:aQueue |
				"link with channels"
				aQueue consumerChannels add: channel.
				channel consumedQueues add: aQueue.
				
				"link with messages"
				aQueue routedMessages add: message.
				message routedToQueues add: aQueue.
				
				"add the bindings"
				routingKeys do:[:aRoutingKey |
					binding := RMQBindingWithQueue new.
					
					binding destination: aQueue.
					aQueue destinationBindings add: binding.
					
					binding source: exchange.
					exchange sourceBindings add: binding.
					
					binding routingKey: aRoutingKey.	
					aRoutingKey binding: binding.
					
					
					aModel allRMQBindings
						detect: [ :el | (el source = binding source) and:[(el destination = binding destination) and:[el routingKey = binding routingKey]] ]
							ifFound: [ :elementFound | 
								]
							ifNone: [ aModel add: binding.
						].
				].
			].
					
			
			"set the exchange format"
		   aModel allRMQExchangeFormats
		   detect: [ :el | el exchangeFormatSchema  = (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema') ]
		   ifFound: [ :elementFound | 
			exchangeFormat := elementFound. ]
		   ifNone: [ 
			  exchangeFormat := RMQExchangeFormat new. 
			  exchangeFormat exchangeFormatSchema: (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema'). 
			  exchangeFormat exchangeFormatType: (((aRMQObject at: 'properties') at: 'headers') at: 'X-ExchangeFormatId').
			  exchangeFormat mooseModel: aModel.
		     aModel add: exchangeFormat].
		     message exchangeFormat: exchangeFormat. 
		     exchangeFormat messages add: message. 
		
			 ].
	
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
