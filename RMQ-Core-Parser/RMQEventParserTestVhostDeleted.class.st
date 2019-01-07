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
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestVhostDeleted >> setUp [
|vhost|

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"set up the model for the test"
	vhost := model selectOrAddEntityNamed: 'testtest' withType: RMQVHost.
	2 second wait. 
	
	"consume from the events queues"
	consumer consumeQueue: 'events.vhost.deleted'; start. 
	2 second wait. 
	
]

{ #category : #tests }
RMQEventParserTestVhostDeleted >> testModelPopulation [

	self assert: (model allRMQVHosts anySatisfy: [:element | element name = 'testtest' and:[ element deletionDate isNotNil ] ]).

]
