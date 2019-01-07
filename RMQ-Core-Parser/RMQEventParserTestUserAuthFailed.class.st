"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.authentication.failure  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestUserAuthFailed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestUserAuthFailed >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.authentication.failure'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserAuthFailed >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element authentifications anySatisfy: [ :el | el success = false and:[ el timestamp isNotNil ] ] ] ]).

]
