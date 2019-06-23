"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestBindingDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestBindingDeleted >> setUp [
	"todo : go further and create the events queue and bing it to the exchange queue ?"

	| newBinding source destination routingKey |
	model := PulseModel new.
	model name: 'test'.
	parser := PulseEventParser newOn: 'test'.
	consumer := PulseConsumer new.
	consumer model: model.
	consumer parser: parser.

	"purge events queue to make sur it is empty"
	"consumer purgeQueue: 'events.binding.created'."

	"set up the MM"
	newBinding := PulseBindingWithQueue new.
	source := model
		selectOrAddEntityNamed: 'test.create.exchangeforbinding'
		withType: PulseExchange
		sourceName: self sourceName.
	destination := model
		selectOrAddEntityNamed: 'test.create.queueforbinding'
		withType: PulseQueue
		sourceName: self sourceName.
	destination destinationBindings add: newBinding.
	source sourceBindings add: newBinding.
	newBinding
		source: source;
		destination: destination.
	model add: newBinding.
	routingKey := model
		selectOrAddEntityNamed: 'key'
		withType: PulseRoutingKey
		sourceName: self sourceName.
	newBinding routingKey: routingKey.
	routingKey binding: newBinding.

	"cretate an exchange, a queue and bind them"
	consumer
		createExchange: 'test.create.exchangeforbinding'
		type: 'topic'.
	consumer createQueue: 'test.create.queueforbinding'.
	consumer
		bindQueue: 'test.create.queueforbinding'
		withExchange: 'test.create.exchangeforbinding'
		routingKey: 'key'.
	consumer
		unbindQueue: 'test.create.queueforbinding'
		withExchange: 'test.create.exchangeforbinding'
		routingKey: 'key'.
	1 seconds wait.

	"delete the created resource"
	consumer deleteExchange: 'test.create.exchangeforbinding'.
	consumer deleteQueue: 'test.create.queueforbinding'.
	1 seconds wait.

	"consume from the events queue"
	consumer
		consumeQueue: 'events.binding.deleted';
		start.
	1 seconds wait.
	consumer stop
]

{ #category : #tests }
PulseEventParserTestBindingDeleted >> testModelPopulation [

	self assert: (model allPulseExchanges anySatisfy: [:element | element name = 'test.create.exchangeforbinding']).
	self assert: (model allPulseQueues anySatisfy: [:element | element name = 'test.create.queueforbinding']).
	self assert: (model allPulseBindingWithQueues anySatisfy: [ :el | el source name = 'test.create.exchangeforbinding' and: [ el destination name = 'test.create.queueforbinding' and:[ el deletionDate isNotNil and:[ el routingKey name = 'key' ] ] ] ]).
]
