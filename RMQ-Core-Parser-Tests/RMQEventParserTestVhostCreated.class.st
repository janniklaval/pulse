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
	#category : #'RMQ-Core-Parser-Tests'
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
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
RMQEventParserTestVhostCreated >> testModelPopulation [

	self assert: (model allRMQVHosts anySatisfy: [:element | element name = 'testtest' and:[ element creationDate isNotNil ] ]).

]
