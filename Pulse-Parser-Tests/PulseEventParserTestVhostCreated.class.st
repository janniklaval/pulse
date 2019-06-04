"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.vhost.created  queue must not be empty 
"
Class {
	#name : #PulseEventParserTestVhostCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestVhostCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.vhost.created'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestVhostCreated >> testModelPopulation [

	self assert: (model allPulseVHosts anySatisfy: [:element | element name = 'testtest' and:[ element creationDate isNotNil ] ]).

]
