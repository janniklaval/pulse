Class {
	#name : #ConsumeEvents,
	#superclass : #RMQAmqpConnecter,
	#instVars : [
		'model',
		'parser',
		'queueName',
		'consumerTag'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #amqp }
ConsumeEvents >> consumeQueue [
"// for tests "
": key

	queueName := (channel
		queueDeclare: 'events.', key
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: key."
   consumerTag := channel consumeFrom: 'smalltalk' callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeQueue: key [
	"comment stating purpose of message"

	"queueName := (channel
		queueDeclare: 'events.', key
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: key."
   consumerTag := channel consumeFrom: key callback: self selector: #handleDeliveryQueueCreated:.

]

{ #category : #amqp }
ConsumeEvents >> handleDelivery: delivery [
"// for tests"
	| str |
	str := 'headers: ', delivery properties headers printString, 'timestamp: ', delivery properties timestamp printString.
	 "delivery properties headers printString , delivery properties messageId printString. "
	Transcript cr; nextPutAll: 'Received delivery: ', str; flush.
	channel basicAck: delivery method deliveryTag. 
]

{ #category : #amqp }
ConsumeEvents >> handleDeliveryForAll: delivery [ 
	
	"listening to a single queue of all events, this handleDelivery calls RMQEventParser methodes to populate the model according to rooting key"
	"otherwise have a handleDelivery to every queue"
	| routingKey headersDictionnary timestamp |
	
	model := PulseModel new.
	model name: 'test'.
	parser := RMQEventParser new. 
	
	routingKey := delivery properties routingKey. 
	headersDictionnary := delivery properties headers. 
	timestamp := delivery properties timestamp. 
	
	(routingKey = 'queue.created') ifTrue: [ parser populate: model withQueueCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'queue.deleted') ifTrue: [ parser populate: model withQueueDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'exchange.created') ifTrue: [ parser populate: model withExchangeCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'exchange.deleted') ifTrue: [ parser populate: model withExchangeDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'binding.created') ifTrue: [ parser populate: model withBindingCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'binding.deleted') ifTrue: [ parser populate: model withBindingDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'connection.created') ifTrue: [ parser populate: model withConnectionCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'connection.closed') ifTrue: [ parser populate: model withConnectionClosed: headersDictionnary at: timestamp ]. 
	(routingKey = 'channel.created') ifTrue: [ parser populate: model withChannelCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'channel.closed') ifTrue: [ parser populate: model withChannelClosed: headersDictionnary at: timestamp ]. 
	(routingKey = 'consumer.created') ifTrue: [ parser populate: model withConsumerCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'consumer.deleted') ifTrue: [ parser populate: model withConsumerDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'vhost.created') ifTrue: [ parser populate: model withVhostCreated:  headersDictionnary at: timestamp ]. 
	(routingKey = 'vhost.deleted') ifTrue: [ parser populate: model withVhostDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.created') ifTrue: [ parser populate: model withUserCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.deleted') ifTrue: [ parser populate: model withUserDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.authentication.success') ifTrue: [ parser populate: model withUserAuthenticationSucceeded: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.authentication.failure') ifTrue: [ parser populate: model withUserAuthenticationFailed: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.password.changed') ifTrue: [ parser populate: model withUserPasswordChanged: headersDictionnary at: timestamp ].
	(routingKey = 'user.password.cleared') ifTrue: [ parser populate: model withUserPasswordCleared: headersDictionnary at: timestamp ].
	(routingKey = 'user.tags.set') ifTrue: [ parser populate: model withUserTagsSet: headersDictionnary at: timestamp ]. 
	(routingKey = 'permission.created') ifTrue: [ parser populate: model withPermissionCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'permission.deleted') ifTrue: [ parser populate: model withPermissionDeleted: headersDictionnary at: timestamp ]. 
	
	channel basicAck: delivery method deliveryTag. 
]

{ #category : #amqp }
ConsumeEvents >> handleDeliveryQueueCreated: delivery [ 	
	
	"otherwise have a handleDelivery to every queue"
	| headersDictionnary timestamp outputString|
	
	headersDictionnary := delivery properties headers. 
	timestamp := delivery properties timestamp. 
	
   self parser populate: self model withQueueCreated: headersDictionnary at: timestamp.

   self model allRMQQueues 
		detect: [ :el | el name = (headersDictionnary at: 'name')]
		ifFound: [ :elementFound | 
			outputString := elementFound name printString, ' ', elementFound creationDate printString  ]
		ifNone: [ outputString := 'error'  ]. 

	Transcript cr; nextPutAll: 'Resulat: ', outputString; flush.

	channel basicAck: delivery method deliveryTag. 
]

{ #category : #initialization }
ConsumeEvents >> initialize [
	super initialize.
	
	
]

{ #category : #amqp }
ConsumeEvents >> mainloop [
	[ connection waitForEvent ] repeat.
]

{ #category : #accessing }
ConsumeEvents >> model [
	^ model
]

{ #category : #accessing }
ConsumeEvents >> model: anObject [
	model := anObject
]

{ #category : #accessing }
ConsumeEvents >> parser [
	^ parser
]

{ #category : #accessing }
ConsumeEvents >> parser: anObject [
	parser := anObject
]
