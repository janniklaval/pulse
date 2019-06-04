"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestQueueDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestQueueDeleted >> setUp [
	"todo : go further and create the events queue and bing it to the exchange queue ?"

	| queue vhost |
	model := PulseModel new.
	model name: 'test'.
	parser := PulseEventParser newOn: 'test'.
	consumer := PulseConsumer new.
	consumer model: model.
	consumer parser: parser.

	"purge queue events.queue.deleted to make sur it is empty"
	consumer purgeQueue: 'events.queue.deleted'.

	"populate the model with queue test.delete.queue, set vhost "
	vhost := model
		selectOrAddEntityNamed: '/'
		withType: RMQVHost
		sourceName: self sourceName.
	queue := model
		selectOrAddEntityNamed: 'test.delete.queue'
		withType: RMQQueue
		sourceName: self sourceName.
	vhost queues add: queue.
	queue vhost: vhost.

	"cretate then delete queue test.delete.queue "
	consumer createQueue: 'test.delete.queue'.
	consumer deleteQueue: 'test.delete.queue'.
	2 seconds wait.

	"consume from the events queue"
	consumer
		consumeQueue: 'events.queue.deleted';
		start.
	1 seconds wait.
	consumer stop
]

{ #category : #tests }
PulseEventParserTestQueueDeleted >> testModelPopulation [

	self assert: (model allPulseQueues anySatisfy: [:element | element name = 'test.delete.queue' and:[ element deletionDate isNotNil ]]).
]
