"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.authentication.success   queue must not be empty 
an event message with user name = guest 
"
Class {
	#name : #RMQEventParserTestUserAuthSucceeded,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserAuthSucceeded >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.authentication.success'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserAuthSucceeded >> testModelPopulation [

	self assert: (model allRMQAuthentifications anySatisfy: [:element | element user name = 'guest' and:[ element timestamp isNotNil and:[element success] ] ]).

]
