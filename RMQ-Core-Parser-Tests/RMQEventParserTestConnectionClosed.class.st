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

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	


	
	"consume from the events queues"
	consumer consumeQueue: 'events.connection.closed'; start. 
   	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestConnectionClosed >> testModelPopulation [

	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest' and: [ element closingDate isNotNil ] ]).
]
