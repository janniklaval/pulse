"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.created  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestUserCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.created'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserCreated >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element creationDate isNotNil ] ]).

]
