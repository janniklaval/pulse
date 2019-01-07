"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.password.changed  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestUserPasswordChanged,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestUserPasswordChanged >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.password.changed'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserPasswordChanged >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element passwordChangingDate isNotNil ] ]).

]
