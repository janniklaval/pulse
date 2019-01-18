Class {
	#name : #AmqpSimpleExampleBase,
	#superclass : #Object,
	#instVars : [
		'conn',
		'ch',
		'proc'
	],
	#category : #'Amqp-Examples'
}

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> close [
	conn close.
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> exampleExchange [
	^ 'smalltalk-test' "amq.rabbitmq.event"
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> exampleHost [
	^ 'localhost'
]

{ #category : #initialization }
AmqpSimpleExampleBase >> initialize [
	super initialize.
	
	"credentials := AmqpPlainCredentials new
			username: 'guest';
		   password: 'guest'."

	conn := AmqpConnection new.
	conn protocolClass: Amqp091.
	conn host: self exampleHost port: 5672.
	"conn credentials: credentials."
	conn open.

	ch := conn newChannel.
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> start [
	proc ifNotNil: [ self stop ].
	proc := [ self mainloop ] fork.
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> stop [
	proc ifNotNil: [
		proc terminate.
		proc := nil]
]
