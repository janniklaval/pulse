"
create amqp connections to consume a RabbitMQ node 
"
Class {
	#name : #PulseAmqpConnecter,
	#superclass : #Object,
	#instVars : [
		'connection',
		'channel',
		'process'
	],
	#category : #'Pulse-Parser'
}

{ #category : #connecting }
PulseAmqpConnecter >> close [
	connection close.
]

{ #category : #connecting }
PulseAmqpConnecter >> createEventQueue: queueName routingKey: key [

	channel queueBind: queueName exchange: self definedExchange routingKey: key.
]

{ #category : #connecting }
PulseAmqpConnecter >> definedExchange [
	^ 'amq.rabbitmq.event'
]

{ #category : #connecting }
PulseAmqpConnecter >> definedHost [
	^ 'localhost'
]

{ #category : #connecting }
PulseAmqpConnecter >> initialize [
	super initialize.

	connection := AmqpConnection new.
	connection protocolClass: Amqp091.
	connection host: self definedHost port: 5672.
	connection open.

	channel := connection newChannel.
]

{ #category : #connecting }
PulseAmqpConnecter >> start [
	process ifNotNil: [ self stop ].
	process := [ self mainloop ] fork.
]

{ #category : #connecting }
PulseAmqpConnecter >> stop [
	process ifNotNil: [
		process terminate.
		process := nil]
]
