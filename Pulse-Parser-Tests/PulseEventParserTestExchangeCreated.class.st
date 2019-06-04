"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestExchangeCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestExchangeCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"purge queue events.exchange.created to make sur it is empty"
	consumer purgeQueue: 'events.exchange.created'.
	
	"cretate a queue test.create.exchange"
	consumer createExchange: 'test.create.exchange'  type: 'fanout'.
	
	"consume from the events queue"
	consumer consumeQueue: 'events.exchange.created'; start. 
	"5 seconds wait."
	
	"delete the created resource"
	consumer deleteExchange: 'test.create.exchange'. 
	1 seconds wait.
	consumer stop. 

]

{ #category : #tests }
PulseEventParserTestExchangeCreated >> testModelPopulation [

	self assert: (model allPulseExchanges anySatisfy: [:element | element name = 'test.create.exchange' 
		                                                         and:[ element creationDate isNotNil
			                                                      and: [ element type name = 'fanout'
				                                                   and: [ element durability name =  'transient' ] ] ]]).
	
  self assert: (model allPulseVHosts anySatisfy: [:element | element name = '/' and: [ element exchanges anySatisfy: [ :el | el name = 'test.create.exchange' ]]]).
]
