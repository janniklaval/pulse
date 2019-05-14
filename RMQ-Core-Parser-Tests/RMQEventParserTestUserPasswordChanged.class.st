"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.password.changed  queue must not be empty 
event with user name testuser 
"
Class {
	#name : #RMQEventParserTestUserPasswordChanged,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserPasswordChanged >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| user |
	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"populate the model with the resource "
	user := RMQUser new.
	user pulseName: 'testuser';
			mooseModel: model.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.password.changed'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
RMQEventParserTestUserPasswordChanged >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element passwordChangingDate isNotNil ] ]).

]
