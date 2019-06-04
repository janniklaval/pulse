Class {
	#name : #PulseTraceParserTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initializing }
PulseTraceParserTest >> setUp [

"todo : go further and create the events queue and bind it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseTraceParser newOn: 'test'. 
	
	consumer := PulseConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the traces queue"
	consumer consumeTracesQueue ; start. 
	1 seconds wait.
	consumer stop. 
	
]

{ #category : #tests }
PulseTraceParserTest >> testModelPopulation [

   self assert: (model allPulseNodes anySatisfy: [:element | element name = '/' ]).
	self assert: (model allPulseVHosts anySatisfy: [:element | element name = '/' ]).
	self assert: (model allPulseExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allPulseChannels anySatisfy: [:element | element user name = 'guest' and:[ element creationDate isNotNil ] ]).
	self assert: (model allPulseConnections anySatisfy: [:element | element user name = 'guest']).
	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'guest' and:[ element vhosts anySatisfy: [:el| el name = '/']  ] ]).
	self assert: (model allPulseExchangeFormats anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseConsumerProcesses anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseMessages anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseDeliveryModes anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseMessageTypes anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
]
