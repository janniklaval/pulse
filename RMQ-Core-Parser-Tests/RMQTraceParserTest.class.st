Class {
	#name : #RMQTraceParserTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initializing }
RMQTraceParserTest >> setUp [

"todo : go further and create the events queue and bind it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQTraceParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the traces queue"
	consumer consumeTracesQueue ; start. 
	1 seconds wait.
	consumer stop. 
	
]

{ #category : #tests }
RMQTraceParserTest >> testModelPopulation [

	self assert: (model allRMQVHosts anySatisfy: [:element | element name = '/' ]).
]
