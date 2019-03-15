"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.vhost.deleted  queue must not be empty 
event message  with vhost name: testtest
"
Class {
	#name : #RMQEventParserTestVhostDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestVhostDeleted >> setUp [

"todo : go further and create the events queue and bind it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"set up the model for the test"
	model selectOrAddEntityNamed: 'testtest' withType: RMQVHost.
	2 second wait. 
	
	"consume from the events queues"
	consumer consumeQueue: 'events.vhost.deleted'; start. 
	1 seconds wait.
	consumer stop. 
	
]

{ #category : #tests }
RMQEventParserTestVhostDeleted >> testModelPopulation [

	self assert: (model allRMQVHosts anySatisfy: [:element | element name = 'testtest' and:[ element deletionDate isNotNil ] ]).

]
