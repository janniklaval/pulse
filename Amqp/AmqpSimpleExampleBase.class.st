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
	^ 'smalltalk-test'
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> exampleHost [
	^ 'localhost'
]

{ #category : #'as yet unclassified' }
AmqpSimpleExampleBase >> initialize [
	super initialize.

	conn := AmqpConnection new.
	conn protocolClass: Amqp091.
	conn host: self exampleHost.
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
