"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #RMQEventParserTestQueueDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestQueueDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"
|queue vhost|

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge queue events.queue.deleted to make sur it is empty"
	consumer purgeQueue: 'events.queue.deleted'.
	
	"populate the model with queue test.delete.queue, set vhost "
	vhost := model selectOrAddEntityNamed: '/' withType: RMQVHost.
	queue := model selectOrAddEntityNamed: 'test.delete.queue' withType: RMQQueue.
	vhost queues add: queue. 
	queue vhost: vhost.  
	
	"cretate then delete queue test.delete.queue "
	"consumer createQueue: 'test.delete.queue'.
	consumer deleteQueue: 'test.delete.queue'. 
   2 seconds wait." 

	"consume from the events queue"
	consumer consumeQueue: 'events.queue.deleted'; start. 
	2 seconds wait.
	

	
]

{ #category : #tests }
RMQEventParserTestQueueDeleted >> testModelPopulation [

	self assert: (model allRMQQueues anySatisfy: [:element | element name = 'test.delete.queue' and:[ element deletionDate isNotNil ]]).
]
