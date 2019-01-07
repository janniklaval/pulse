"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #RMQEventParserTestExchangeCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestExchangeCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge queue events.exchange.created to make sur it is empty"
	consumer purgeQueue: 'events.exchange.created'.
	
	"cretate a queue test.create.exchange"
	consumer createExchange: 'test.create.exchange'  type: 'topic'.
	
	"consume from the events queue"
	consumer consumeQueue: 'events.exchange.created'; start. 
	"5 seconds wait."
	
	"delete the created resource"
	consumer deleteExchange: 'test.create.exchange'. 

]

{ #category : #tests }
RMQEventParserTestExchangeCreated >> testModelPopulation [

	self assert: (model allRMQExchanges anySatisfy: [:element | element name = 'test.create.exchange' and:[ element creationDate isNotNil ]]).
]
