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
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestBindingDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"
| newBinding source destination routingKey|
	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge events queue to make sur it is empty"
	"consumer purgeQueue: 'events.binding.created'."
	
	"set up the MM"
	newBinding := RMQBindingWithQueue new.
	source:= model selectOrAddEntityNamed: 'test.create.exchangeforbinding' withType: RMQExchange.
	destination:= model selectOrAddEntityNamed: 'test.create.queueforbinding' withType: RMQQueue.
	destination destinationBindings add: newBinding.
	source sourceBindings add: newBinding.
	newBinding 
		source: source;
		destination: destination. 	
   model add: newBinding.
	routingKey := model selectOrAddEntityNamed: 'key' withType: RMQRoutingKey.
	newBinding routingKey: routingKey.
	routingKey binding: newBinding.
	
	"cretate an exchange, a queue and bind them"
	consumer createExchange: 'test.create.exchangeforbinding'  type: 'topic'.
	consumer createQueue: 'test.create.queueforbinding'.
	consumer bindQueue: 'test.create.queueforbinding' withExchange: 'test.create.exchangeforbinding' routingKey: 'key'. 
	consumer unbindQueue: 'test.create.queueforbinding' withExchange: 'test.create.exchangeforbinding' routingKey: 'key'. 
	1 seconds wait.
	
	"delete the created resource"
	consumer deleteExchange: 'test.create.exchangeforbinding'.
	consumer deleteQueue: 'test.create.queueforbinding'. 
	1 seconds wait.
	
	"consume from the events queue"
	consumer consumeQueue: 'events.binding.deleted'; start. 
	2 seconds wait.
]

{ #category : #tests }
RMQEventParserTestBindingDeleted >> testModelPopulation [

	self assert: (model allRMQExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allRMQQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allRMQBindingWithQueues anySatisfy: [ :el | el source name = 'test.create.exchangeforbinding' and: [ el destination name = 'test.create.queueforbinding' and:[ el deletionDate isNotNil and:[ el routingKey name = 'key' ] ] ] ]).
]
