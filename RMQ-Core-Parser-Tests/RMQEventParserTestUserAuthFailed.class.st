"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.authentication.failure  queue must not be empty 
message with user name testuser 
"
Class {
	#name : #RMQEventParserTestUserAuthFailed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserAuthFailed >> setUp [

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
	consumer consumeQueue: 'events.user.authentication.failure'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
RMQEventParserTestUserAuthFailed >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element authentifications anySatisfy: [ :el | el success = false and:[ el timestamp isNotNil ] ] ] ]).

]
