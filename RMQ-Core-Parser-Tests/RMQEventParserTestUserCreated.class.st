"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.created  queue must not be empty 
event with user name user
"
Class {
	#name : #RMQEventParserTestUserCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.created'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
RMQEventParserTestUserCreated >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'user' and:[ element creationDate isNotNil ] ]).

]
