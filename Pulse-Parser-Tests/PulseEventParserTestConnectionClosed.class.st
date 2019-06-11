"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.connection.closed must not be empty 
"
Class {
	#name : #PulseEventParserTestConnectionClosed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestConnectionClosed >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| consumer2 |
	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new. 
	consumer model: model.
	consumer parser: parser.
	
	consumer2 := PulseConsumer new. 
	consumer2 model: model. 
	consumer2 parser: parser.
	
	"listen first to the connection.created queue"
	consumer consumeQueue: 'events.connection.created'; start. 
	2 seconds wait.
   
	"consume from the events queues"
	consumer2 consumeQueue: 'events.connection.closed'; start. 
   1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
PulseEventParserTestConnectionClosed >> testModelPopulation [

	self assert: (model allPulseConnections anySatisfy: [:element | element user name = 'guest' and: [ element closingDate isNotNil ] ]).
]
