Class {
	#name : #AmqpConsumerExample,
	#superclass : #AmqpSimpleExampleBase,
	#instVars : [
		'queueName',
		'consumerTag'
	],
	#category : #'Amqp-Examples'
}

{ #category : #amqp }
AmqpConsumerExample >> handleDelivery: delivery [
	| str |
	str := delivery properties headers printString "[ delivery body utf8Decoded ] on: ZnInvalidUTF8 do: [ delivery body printString ]".
	Transcript cr; nextPutAll: 'Received delivery: ', str; flush.
	ch basicAck: delivery method deliveryTag.
]

{ #category : #initialization }
AmqpConsumerExample >> initialize [
	super initialize.
	"ch exchangeDeclare: self exampleExchange type: 'fanout'.
	queueName := (ch
		queueDeclare: ''
		durable: false
		exclusive: true
		autoDelete: true
		passive: false
		arguments: nil) method queue.
	ch queueBind: queueName exchange: self exampleExchange routingKey: ''.
	consumerTag := ch consumeFrom: queueName callback: self selector: #handleDelivery:."
	consumerTag := ch consumeFrom: 'smalltalk' callback: self selector: #handleDelivery:.
]

{ #category : #'as yet unclassified' }
AmqpConsumerExample >> mainloop [
	[ conn waitForEvent ] repeat.
]
