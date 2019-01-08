"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.deleted  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestUserDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.deleted'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserDeleted >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testuser' and:[ element deletionDate isNotNil ] ]).

]
