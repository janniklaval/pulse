Class {
	#name : #RMQEventParserTestQueuCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestQueuCreated >> setUp [

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	consumer consumeQueue: 'events.queue.created'; start. 
	10 seconds wait.

]

{ #category : #'testing - simple' }
RMQEventParserTestQueuCreated >> testPopulate [

	self assert: (model allRMQQueues anySatisfy: [:element | element name = 'mytestcreatequeue']).
]
