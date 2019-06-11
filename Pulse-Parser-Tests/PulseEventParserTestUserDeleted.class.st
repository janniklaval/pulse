"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.deleted  queue must not be empty 
message with user name testuser 
"
Class {
	#name : #PulseEventParserTestUserDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestUserDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| user|
	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"populate the model with the resource "
	user := RMQUser new.
	user pulseName: 'user';
			mooseModel: model.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.deleted'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestUserDeleted >> testModelPopulation [

	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'user' and:[ element deletionDate isNotNil ] ]).

]
