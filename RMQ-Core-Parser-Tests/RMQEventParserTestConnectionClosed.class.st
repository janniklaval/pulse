"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.connection.closed must not be empty 
"
Class {
	#name : #RMQEventParserTestConnectionClosed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestConnectionClosed >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| consumer2 |
	model := OldPulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model.
	consumer parser: parser.
	
	consumer2 := RMQConsumer new. 
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
RMQEventParserTestConnectionClosed >> testModelPopulation [

	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest' and: [ element closingDate isNotNil ] ]).
]
