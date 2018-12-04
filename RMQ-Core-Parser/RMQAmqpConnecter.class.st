"
create amqp connections to consume a RabbitMQ node 
"
Class {
	#name : #RMQAmqpConnecter,
	#superclass : #Object,
	#instVars : [
		'connection',
		'channel',
		'process'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #connecting }
RMQAmqpConnecter >> close [
	connection close.
]

{ #category : #connecting }
RMQAmqpConnecter >> createEventQueue: queueName routingKey: key [

	channel queueBind: queueName exchange: self definedExchange routingKey: key.
]

{ #category : #connecting }
RMQAmqpConnecter >> definedExchange [
	^ 'amq.rabbitmq.event'
]

{ #category : #connecting }
RMQAmqpConnecter >> definedHost [
	^ 'localhost'
]

{ #category : #connecting }
RMQAmqpConnecter >> initialize [
	super initialize.

	connection := AmqpConnection new.
	connection protocolClass: Amqp091.
	connection host: self definedHost port: 5672.
	connection open.

	channel := connection newChannel.
]

{ #category : #connecting }
RMQAmqpConnecter >> start [
	process ifNotNil: [ self stop ].
	process := [ self mainloop ] fork.
]

{ #category : #connecting }
RMQAmqpConnecter >> stop [
	process ifNotNil: [
		process terminate.
		process := nil]
]
