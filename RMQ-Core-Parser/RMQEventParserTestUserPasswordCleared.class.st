"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.password.cleared  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestUserPasswordCleared,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestUserPasswordCleared >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.password.cleared'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserPasswordCleared >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element passwordClearingDate isNotNil ] ]).

]