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
	
	rmqObjects do: [:aRMQObject | 
			| message connection queue user node exchange vhost channel routingKeys binding payload component delivMode routedQueues messageType|
			payload := model selectOrAddEntityNamed: (aRMQObject at: 'payload') withType: RMQPayload.
			
			message := self populateMessage: aRMQObject payload: payload.
			message timestamp: (aRMQObject at: 'timestamp').
			
			connection := model selectOrAddEntityNamed: (aRMQObject at: 'connection') withType: RMQConnection.
			
			queue := model selectOrAddEntityNamed: (aRMQObject at: 'queue') withType: RMQQueue.
			
			message queue ifNil:[
				queue sendedMessages add: message.
				message queue: queue.
			].
			
			user := model selectOrAddEntityNamed: (aRMQObject at: 'user') withType: RMQUser.
			
			user usedConnections 
				detect: [:conn| conn = connection ]
				ifNone: [
					connection user: user.
					user usedConnections add: connection.
				].
		
			node := model selectOrAddEntityNamed: (aRMQObject at: 'node') withType: RMQNode.
			
			
			exchange := model selectOrAddEntityNamed: (aRMQObject at: 'exchange') withType: RMQExchange.
			exchange messages add: message.
			message exchange: exchange.
			
			
			vhost := model selectOrAddEntityNamed: (aRMQObject at: 'vhost') withType: RMQVHost.
			user vhosts 
				detect: [:vh| vh = vhost ]
				ifNone: [
					vhost users add: user.
					user vhosts add: vhost.
				].

			connection vhost ifNil:[
				vhost connections add: connection.
				connection vhost: vhost.
			].
			queue vhost ifNil:[
				vhost queues add: queue.
				queue vhost: vhost.
			].
			exchange vhost ifNil:[
				vhost exchanges add: exchange.
				exchange vhost: vhost.
			].
			vhost node ifNil:[
				node vhosts add: vhost.
				vhost node: node.
			].
			
			channel := model selectOrAddEntityNamed: (aRMQObject at: 'channel') withType: RMQChannel.
			channel vhost ifNil:[
				vhost channels add: vhost.
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
			
		
			routingKeys := self populateRoutingKeys: aRMQObject.
			
			routedQueues := self populateRoutedQueues: aRMQObject.
			
			routedQueues do:[:aQueue |
				"link with channels"
				aQueue consumerChannels add: channel.
				channel consumedQueues add: aQueue.
				
				"link with messages"
				aQueue messages add: message.
				message routedQueues add: aQueue.
				
				"add the bindings"
				routingKeys do:[:aRoutingKey |
					binding := RMQBindingWithQueue new.
					
					binding destination: aQueue.
					aQueue destinationBindings add: binding.
					
					binding source: exchange.
					exchange sourceBindings add: binding.
					
					binding routingKey: aRoutingKey.	
					aRoutingKey binding: binding.
					
					
					model allRMQBindings
						detect: [ :el | (el source = binding source) and:[(el destination = binding destination) and:[el routingKey = binding routingKey]] ]
							ifFound: [ :elementFound | 
								]
							ifNone: [ model add: binding.
						].
				].
			].
					
			
		
			messageType := self populateType: aRMQObject.
			message messageType: messageType.
			messageType messages add: message.
			
			component := model selectOrAddEntityNamed: ((aRMQObject at: 'properties') at: 'app_id') withType: RMQComponent.
			component senderMessages add: message.
			message senderComponent:component.
			
			component subscribedChannels 
				detect: [:ch| ch = channel ]
				ifNone: [
					component subscribedChannels add: channel.
					channel subscribedComponents add: component.
				].
			
			component exchanges 
				detect: [:exch| exch = exchange ]
				ifNone: [
					component exchanges add: exchange.
					exchange components add: component.
				].
			
			
			delivMode := self populateDeliveryMode: aRMQObject.
			message deliveryMode: delivMode.
			delivMode messages add: message.
			
			
			((aRMQObject at: 'properties') at: 'headers')
				do:
					[ :aHeader | self populateHeaders: aHeader ] ].
	
	MooseModel root add: model
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
		ifNone: [ model add: newHeader.
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
				ifNone: [ model add: routed_queue.
					routedQueues add: routed_queue ] ]
		ifFalse: [ (aRMQObject at: 'routed_queues')
				do: [ :aRoutedQueue | 
					newRoutedQueue := RMQQueue new
						pulseName: aRoutedQueue.
					model allRMQQueues
						detect: [ :el | el pulseName = newRoutedQueue pulseName ]
						ifFound: [ :elementFound | 
							routedQueues add: elementFound.]
						ifNone: [ model add: newRoutedQueue.
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
				ifNone: [ model add: newRoutingKey.
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
