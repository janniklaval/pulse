"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.created  queue must not be empty 
event with user name user
"
Class {
	#name : #PulseEventParserTestUserCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestUserCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.created'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestUserCreated >> testModelPopulation [

	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'user' and:[ element creationDate isNotNil ] ]).

]
