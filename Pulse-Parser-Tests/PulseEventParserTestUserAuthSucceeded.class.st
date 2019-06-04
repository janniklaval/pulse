"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.authentication.success   queue must not be empty 
an event message with user name = guest 
"
Class {
	#name : #PulseEventParserTestUserAuthSucceeded,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestUserAuthSucceeded >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.authentication.success'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestUserAuthSucceeded >> testModelPopulation [

	self assert: ((model allWithType: PulseAuthentification) anySatisfy: [:element | element user name = 'guest' and:[ element timestamp isNotNil and:[element success] ] ]).

]