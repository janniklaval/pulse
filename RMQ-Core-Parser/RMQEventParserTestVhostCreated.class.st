"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.vhost.created  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestVhostCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestVhostCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.vhost.created'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestVhostCreated >> testModelPopulation [

	self assert: (model allRMQVHosts anySatisfy: [:element | element name = 'smalltalk' and:[ element creationDate isNotNil ] ]).

]
