"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #RMQEventParserTestBindingDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestBindingDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge events queue to make sur it is empty"
	consumer purgeQueue: 'events.binding.created'.
	
	"cretate an exchange, a queue and bind them"
	consumer createExchange: 'test.create.exchangeforbinding'  type: 'topic'.
	consumer createQueue: 'test.create.queueforbinding'.
	consumer bindQueue: 'test.create.queueforbinding' withExchange: 'test.create.exchangeforbinding' routingKey: 'key'. 
	
	"consume from the events queue"
	consumer consumeQueue: 'events.binding.created'; start. 
	"3 seconds wait."
	
	"delete the created resource"
	consumer deleteExchange: 'test.create.exchangeforbinding'.
	consumer deleteQueue: 'test.create.queueforbinding'. 

]

{ #category : #tests }
RMQEventParserTestBindingDeleted >> testModelPopulation [

	self assert: (model allRMQExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allRMQQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allRMQBindingWithQueues anySatisfy: [ :el | el source = 'test.create.exchangeforbinding' and: [ el destination = 'test.create.queueforbinding' ] ]).
]
