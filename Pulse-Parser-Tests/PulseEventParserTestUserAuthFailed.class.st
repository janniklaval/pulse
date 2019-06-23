"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.authentication.failure  queue must not be empty 
message with user name testuser 
"
Class {
	#name : #PulseEventParserTestUserAuthFailed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestUserAuthFailed >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| user |
	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new. 
	consumer model: model.
	consumer parser: parser.
	
	"populate the model with the resource "
	user := PulseUser new.
	user pulseName: 'testuser';
			mooseModel: model.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.authentication.failure'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestUserAuthFailed >> testModelPopulation [

	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'testuser' and:[ element authentifications anySatisfy: [ :el | el success = false and:[ el timestamp isNotNil ] ] ] ]).

]
