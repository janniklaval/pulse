"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestQueueCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestQueueCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"purge queue events.queue.created to make sur it is empty"
	consumer purgeQueue: 'events.queue.created'.
	
	"cretate a queue test.create.queue"
	consumer createQueue: 'test.create.queue'.
	
	"consume from the events queue"
	consumer consumeQueue: 'events.queue.created'; start. 
	"5 seconds wait."
	
	"delete the created resource"
	consumer deleteQueue: 'test.create.queue'. 
   1 seconds wait.
	consumer stop. 
]

{ #category : #'testing - simple' }
PulseEventParserTestQueueCreated >> testModelPopulation [

	self assert: (model allPulseQueues anySatisfy: [:element | element name = 'test.create.queue']).
]
