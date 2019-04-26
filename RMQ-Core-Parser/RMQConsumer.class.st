"
we must not parse messages from exchange : amq.rabbitmq.event in  Properties headers: exchange_name: 
"
Class {
	#name : #RMQConsumer,
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
RMQConsumer >> bindQueue: qname withExchange: exname routingKey: key [

channel 
		queueBind: qname exchange: exname routingKey: key. 
]

{ #category : #amqp }
RMQConsumer >> consumeEventsQueue [
" consumes a predifined queue for events, named eventsqueue"
   consumerTag := channel consumeFrom: 'eventsqueue' callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
RMQConsumer >> consumeQueue: key [
	" consumes a predifined queue, named 'key' " 
   consumerTag := channel consumeFrom: key callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
RMQConsumer >> consumeQueueAndReject: key [
	" consumes a predifined queue, named 'key' " 
   consumerTag := channel consumeFrom: key callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
RMQConsumer >> consumeTracesQueue [
" consumes a predifined queue for events, named eventsqueue"
   consumerTag := channel consumeFrom: 'messages_traces' callback: self selector: #handleDeliveryTracesQueue:.

]

{ #category : #amqp }
RMQConsumer >> createAndConsumeEventsQueue: qName [
	" createconsumes a queue " 

	queueName := (channel
		queueDeclare: qName
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: 'amq.rabbitmq.event' routingKey: qName.
   consumerTag := channel consumeFrom: qName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
RMQConsumer >> createAndConsumeQueue: queue exchange: exchange routingKey: key [ 

	queueName := (channel
		queueDeclare: queue
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: exchange routingKey: 'key'.
   consumerTag := channel consumeFrom: queue callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
RMQConsumer >> createExchange: exchangeName type: typeName [

channel 
	exchangeDeclare: exchangeName type: typeName
]

{ #category : #amqp }
RMQConsumer >> createQueue: qname [ 

channel 
		queueDeclare: qname
		durable: false
		exclusive: false
		autoDelete: false
		passive: false
		arguments: nil.
]

{ #category : #amqp }
RMQConsumer >> deleteExchange: exname [ 

channel 
		exchangeDelete: exname.
]

{ #category : #amqp }
RMQConsumer >> deleteQueue: qname [ 

channel 
		queueDelete: qname.
]

{ #category : #amqp }
RMQConsumer >> handleDelivery: delivery [

	| routingKey headersDictionnary timestamp  |
	
	routingKey := (delivery method routingKey) trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ]. 
	headersDictionnary := delivery properties headers. 
	timestamp := delivery properties timestamp. 
	
	(routingKey = 'queue.created') ifTrue: [ self parser populate: self model withQueueCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'queue.deleted') ifTrue: [ self parser populate: self model withQueueDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'exchange.created') ifTrue: [ self parser populate: self model withExchangeCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'exchange.deleted') ifTrue: [ self parser populate: self model withExchangeDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'binding.created') ifTrue: [ self  parser populate: self model withBindingCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'binding.deleted') ifTrue: [ self parser populate: self model withBindingDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'connection.created') ifTrue: [ self parser populate: self model withConnectionCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'connection.closed') ifTrue: [ self parser populate: self model withConnectionClosed: headersDictionnary at: timestamp ]. 
	(routingKey = 'channel.created') ifTrue: [ self parser populate: self model withChannelCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'channel.closed') ifTrue: [ self parser populate: self model withChannelClosed: headersDictionnary at: timestamp ]. 
	(routingKey = 'consumer.created') ifTrue: [ self parser populate: self model withConsumerCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'consumer.deleted') ifTrue: [ self parser populate: self model withConsumerDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'vhost.created') ifTrue: [ self parser populate: self model withVhostCreated:  headersDictionnary at: timestamp ]. 
	(routingKey = 'vhost.deleted') ifTrue: [ self parser populate: self model withVhostDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.created') ifTrue: [ self parser populate: self model withUserCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.deleted') ifTrue: [ self parser populate: self model withUserDeleted: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.authentication.success') ifTrue: [ self parser populate: self model withUserAuthenticationSucceeded: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.authentication.failure') ifTrue: [ self parser populate: self model withUserAuthenticationFailed: headersDictionnary at: timestamp ]. 
	(routingKey = 'user.password.changed') ifTrue: [ self parser populate: self model withUserPasswordChanged: headersDictionnary at: timestamp ].
	(routingKey = 'user.password.cleared') ifTrue: [ self parser populate: self model withUserPasswordCleared: headersDictionnary at: timestamp ].
	(routingKey = 'user.tags.set') ifTrue: [ self parser populate: self model withUserTagsSet: headersDictionnary at: timestamp ]. 
	(routingKey = 'permission.created') ifTrue: [ self parser populate: self model withPermissionCreated: headersDictionnary at: timestamp ]. 
	(routingKey = 'permission.deleted') ifTrue: [ self parser populate: self model withPermissionDeleted: headersDictionnary at: timestamp ]. 
	
	channel basicAck: delivery method deliveryTag.  
]

{ #category : #amqp }
RMQConsumer >> handleDeliveryForAll: delivery [ 
	
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
RMQConsumer >> handleDeliveryQueueCreated: delivery [ 	
	
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

{ #category : #amqp }
RMQConsumer >> handleDeliveryTest: delivery [
"// for tests"
	| str |
	str := 'headers: ', delivery properties headers printString, 'timestamp: ', delivery properties timestamp printString.
	 "delivery properties headers printString , delivery properties messageId printString. "
	Transcript cr; nextPutAll: 'Received delivery: ', str; flush.
	channel basicAck: delivery method deliveryTag. 
]

{ #category : #amqp }
RMQConsumer >> handleDeliveryTracesQueue: delivery [

	| routingKey headersDictionnary exchange resource  traceType |
	
	routingKey := (delivery method routingKey) trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
	headersDictionnary  := delivery properties headers. 
	exchange := (headersDictionnary at: 'exchange_name'). 
	traceType := (routingKey substrings: '.') at: 1 . " publish or deliver"
	resource := routingKey removePrefix: (traceType,'.'). " exchange if publish and queue if deliver "
 
	"Transcript cr; nextPutAll: 'headers : ', headersDictionnary; flush."
	
	(exchange = 'amq.rabbitmq.event') ifFalse: [ self parser populate: self model withTraceMessage: headersDictionnary withTraceType: traceType onResource: resource ].  
	
	channel basicAck: delivery method deliveryTag.  
	

]

{ #category : #initialization }
RMQConsumer >> initialize [
	super initialize.
	
	
]

{ #category : #amqp }
RMQConsumer >> mainloop [
	[ connection waitForEvent ] repeat.
]

{ #category : #accessing }
RMQConsumer >> model [
	^ model
]

{ #category : #accessing }
RMQConsumer >> model: anObject [
	model := anObject
]

{ #category : #accessing }
RMQConsumer >> parser [
	^ parser
]

{ #category : #accessing }
RMQConsumer >> parser: anObject [
	parser := anObject
]

{ #category : #amqp }
RMQConsumer >> purgeQueue: qname [ 

channel 
		queuePurge: qname.
]

{ #category : #amqp }
RMQConsumer >> unbindQueue: qname withExchange: exname routingKey: key [

channel 
		queueUnbind: qname exchange: exname routingKey: key. 
]
