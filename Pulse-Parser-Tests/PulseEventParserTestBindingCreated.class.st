"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestBindingCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestBindingCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new.
	
	consumer := PulseConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge events queue to make sur it is empty"
	"consumer purgeQueue: 'events.binding.created'."
	
	"cretate an exchange, a queue and bind them"
	consumer createExchange: 'test.create.exchangeforbinding'  type: 'topic'.
	consumer createQueue: 'test.create.queueforbinding'.
	consumer bindQueue: 'test.create.queueforbinding' withExchange: 'test.create.exchangeforbinding' routingKey: 'key'. 
	1 seconds wait.
	
	"delete the created resource"
	consumer deleteExchange: 'test.create.exchangeforbinding'.
	consumer deleteQueue: 'test.create.queueforbinding'. 
	1 seconds wait.
	
	"consume from the events queue"
	consumer consumeQueue: 'events.binding.created'; start. 
	1 seconds wait.
	consumer stop. 
]

{ #category : #tests }
PulseEventParserTestBindingCreated >> testModelPopulation [

	self assert: (model allPulseExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allPulseRoutingKeys anySatisfy: [:element | element name = 'key']).
	self assert: (model allPulseBindingWithQueues anySatisfy: [ :el | el source name = 'test.create.exchangeforbinding' and: [ el destination name = 'test.create.queueforbinding' and:[ el creationDate isNotNil and:[ el routingKey name = 'key' ] ] ] ]).
]
