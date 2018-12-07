Class {
	#name : #ConsumeEvents,
	#superclass : #RMQAmqpConnecter,
	#instVars : [
		'queueName',
		'consumerTag'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #amqp }
ConsumeEvents >> consumeBindingCreatedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.binding.created'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'binding.created'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeBindingdeletedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.binding.deleted'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'binding.deleted'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeChannelClosedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.channel.closed'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'channel.closed'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeChannelCreatedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.channel.created'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'channel.created'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeConnectionClosedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.connection.closed'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'connection.closed'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeConnectionCreatedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.connection.created'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'connection.created'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeConsumerCreatedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.consumer.created'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'consumer.created'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeQueue: key [
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.', key
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: key.
   consumerTag := channel consumeFrom: key callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeQueueCreatedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.queue.created'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'queue.created'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> consumeQueueDeletedEvents [ 
	"comment stating purpose of message"

	queueName := (channel
		queueDeclare: 'events.queue.deleted'
		durable: false
		exclusive: false
		autoDelete: true
		passive: false
		arguments: nil) method queue.
   channel queueBind: queueName exchange: self definedExchange routingKey: 'queue.deleted'.
   consumerTag := channel consumeFrom: queueName callback: self selector: #handleDelivery:.

]

{ #category : #amqp }
ConsumeEvents >> handleDelivery: delivery [ 
	| str |
	str := delivery properties headers printString. "[ delivery properties headers utf8Decoded ] on: ZnInvalidUTF8 do: [ delivery body printString ] , delivery properties messageId printString , delivery properties timestamp printString."
	Transcript cr; nextPutAll: 'Received delivery: ', str; flush.
	channel basicAck: delivery method deliveryTag. 
]

{ #category : #initialization }
ConsumeEvents >> initialize [
	super initialize.
	
	consumerTag := channel consumeFrom: 'events.queue.created' callback: self selector: #handleDelivery:.
	
]

{ #category : #amqp }
ConsumeEvents >> mainloop [
	[ connection waitForEvent ] repeat.
]
