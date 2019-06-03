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

	model := OldPulseModel new.
	model name: 'test'.
	
	parser := RMQTraceParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the traces queue"
	consumer consumeTracesQueue ; start. 
	1 seconds wait.
	consumer stop. 
	
]

{ #category : #tests }
RMQTraceParserTest >> testModelPopulation [

   self assert: (model allRMQNodes anySatisfy: [:element | element name = '/' ]).
	self assert: (model allRMQVHosts anySatisfy: [:element | element name = '/' ]).
	self assert: (model allRMQExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allRMQQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allRMQChannels anySatisfy: [:element | element user name = 'guest' and:[ element creationDate isNotNil ] ]).
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest']).
	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'guest' and:[ element vhosts anySatisfy: [:el| el name = '/']  ] ]).
	self assert: (model allRMQExchangeFormats anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allRMQConsumerProcesses anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allRMQMessages anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allDeliveryModes anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allMessageTypes anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
]
