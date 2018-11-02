Class {
	#name : #RMQLogParser,
	#superclass : #Object,
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
	| parser rmqObjects json routedQueues messageType  |
	parser := PPParserResource current parserAt: PPJsonParser.
	json := self initializeContents: aJSonFilePath.
	rmqObjects := parser parse: json.
	
	model := MooseModel new.
	model name: aJSonFilePath asFileReference basenameWithoutExtension.
	
	rmqObjects do: [:aRMQObject | 
			| message connection queue user node exchange vhost channel routingKeys binding payload component delivMode|
			payload := self populatePayload: aRMQObject.
			message := self populateMessage: aRMQObject payload: payload.
			message timestamp: (aRMQObject at: 'timestamp').
			
			connection :=self populateConnection: aRMQObject.
			
			queue := self populateQueue: aRMQObject.
			message queue ifNil:[
				queue sendedMessages add: message.
				message queue: queue.
			].
			
			user := self populateUser: aRMQObject.
			user usedConnections 
				detect: [:conn| conn = connection ]
				ifNone: [
					connection users add: user.
					user usedConnections add: connection.
				].
		
			node := self populateNode: aRMQObject.
			
			exchange := self populateExchange: aRMQObject.
			exchange messages add: message.
			message exchange: exchange.
			
			
			vhost := self populateVhost: aRMQObject.
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
			
			
			
			channel := self populateChannel: aRMQObject.
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
					channel users add: user.
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
					binding := self populateBinding: aRMQObject.
					
					binding destinationQueue: aQueue.
					aQueue destinationBindings add: binding.
					
					"binding destinationType: DestinationType queue."
					
					binding sourceExchange: exchange.
					exchange sourceBindings add: binding.
					
					binding routingKey: aRoutingKey.	
					aRoutingKey binding: binding.
					
					
					model allRMQBindings
						detect: [ :el | (el sourceExchange = binding sourceExchange) and:[(el destinationQueue = binding destinationQueue) and:[el routingKey = binding routingKey]] ]
							ifFound: [ :elementFound | 
								]
							ifNone: [ model add: binding.
						].
				].
			].
					
			
		
			messageType := self populateType: aRMQObject.
			message messageType: messageType.
			messageType messages add: message.
			
			component := self populateComponent: aRMQObject.
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
RMQLogParser class >> populateBinding: aRMQObject [
	| newBinding |
	newBinding := RMQBinding new.

	^newBinding
]

{ #category : #parsing }
RMQLogParser class >> populateChannel: aRMQObject [
	| newChannel |
	newChannel := RMQChannel new
		channel: (aRMQObject at: 'channel').
	model allRMQChannels
		detect: [ :el | el channel = newChannel channel ]
		ifFound: [ :elementFound | 
			^elementFound ]
		ifNone: [ model add: newChannel.
			^newChannel]
]

{ #category : #parsing }
RMQLogParser class >> populateComponent: aRMQObject [
	| newComponent |
	newComponent := RMQComponent new
		symbolicName: ((aRMQObject at: 'properties') at: 'app_id').
	model allRMQComponents 
		detect: [ :el | el symbolicName = newComponent symbolicName ]
		ifFound: [ :elementFound |  
			^elementFound.]
		ifNone: [ model add: newComponent.
			^newComponent].
		
	
]

{ #category : #parsing }
RMQLogParser class >> populateConnection: aRMQObject [
	| connection |
	connection := RMQConnection new
				connectionString: (aRMQObject at: 'connection').
	
	model allRMQConnections
		detect: [ :el | el connectionString = connection connectionString ]
		ifFound: [ :elementFound | 
			^elementFound. ]
		ifNone: [ model add: connection.
			^connection. ]
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
RMQLogParser class >> populateExchange: aRMQObject [
	| newExchange |
	newExchange := RMQExchange new
		exchangeString: (aRMQObject at: 'exchange').
	model allRMQExchanges
		detect: [ :el | el exchangeString = newExchange exchangeString ]
		ifFound: [ :elementFound | 
			^elementFound ]
		ifNone: [ model add: newExchange.
			^newExchange]
]

{ #category : #parsing }
RMQLogParser class >> populateHeaders: aHeader [
	| newHeader headers |
	headers := OrderedCollection new.
	newHeader := RMQHeader new
		headerString: aHeader.
	model allRMQHeaders
		detect: [ :el | el headerString = newHeader headerString ]
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
		detect: [ :el | el payload payloadString = message payload payloadString ]
		ifFound: [ :elementFound | 
			elementFound payload messages add: message.
			^elementFound. ]
		ifNone: [ model add: message.
			payload messages add: message.
			^message. ].
]

{ #category : #parsing }
RMQLogParser class >> populateNode: aRMQObject [
	| newNode |
	newNode := RMQNode new
		nodeString: (aRMQObject at: 'node').
	model allRMQNodes
		detect: [ :el | el nodeString = newNode nodeString ]
		ifFound: [ :elementFound | 
			^elementFound ]
		ifNone: [ model add: newNode.
			^newNode ]
]

{ #category : #parsing }
RMQLogParser class >> populatePayload: aRMQObject [
	|payload |
	payload := (RMQPayload new
				payloadString: (aRMQObject at: 'payload')).
				
	model allRMQPayloads
		detect: [ :el | el payloadString = payload payloadString ]
		ifFound: [ :elementFound | 
			^elementFound. ]
		ifNone: [ model add: payload.
			^payload. ]
]

{ #category : #parsing }
RMQLogParser class >> populateQueue: aRMQObject [
	| newQueue |
	newQueue := RMQQueue new
		queueString: (aRMQObject at: 'queue').
		
	model allRMQQueues
		detect: [ :el | el queueString = newQueue queueString ]
		ifFound: [ :elementFound | 
			^elementFound. ]
		ifNone: [ model add: newQueue.
			^newQueue. ]
]

{ #category : #parsing }
RMQLogParser class >> populateRoutedQueues: aRMQObject [
	| newRoutedQueue routedQueues  |
	routedQueues := OrderedCollection new.
	(aRMQObject at: 'routed_queues') = 'none'
		ifTrue: [ 
			|routed_queue|
			routed_queue := RMQQueue new
				queueString: (aRMQObject at: 'routed_queues').
			model allRMQQueues
				detect: [ :el | el queueString = routed_queue queueString ]
				ifFound: [ :elementFound | ]
				ifNone: [ model add: routed_queue.
					routedQueues add: routed_queue ] ]
		ifFalse: [ (aRMQObject at: 'routed_queues')
				do: [ :aRoutedQueue | 
					newRoutedQueue := RMQQueue new
						queueString: aRoutedQueue.
					model allRMQQueues
						detect: [ :el | el queueString = newRoutedQueue queueString ]
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
				routingKeyString: aRoutingKey.
			model allRMQRoutingKeys
				detect: [ :el | el routingKeyString = newRoutingKey routingKeyString ]
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

{ #category : #parsing }
RMQLogParser class >> populateUser: aRMQObject [
	| newUser |
	newUser := RMQUser new
		userString: (aRMQObject at: 'user').
	model allRMQUsers
		detect: [ :el | el userString = newUser userString ]
		ifFound: [ :elementFound | 
			^elementFound ]
		ifNone: [ model add: newUser.
			^newUser ]
]

{ #category : #parsing }
RMQLogParser class >> populateVhost: aRMQObject [
	| newVHost |
	newVHost := RMQVHost new
		vhostString: (aRMQObject at: 'vhost').
	model allRMQVHosts
		detect: [ :el | el vhostString = newVHost vhostString ]
		ifFound: [ :elementFound | 
			^elementFound ]
		ifNone: [ model add: newVHost.
			^newVHost ]
]
