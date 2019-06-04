"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.vhost.deleted  queue must not be empty 
event message  with vhost name: testtest
"
Class {
	#name : #PulseEventParserTestVhostDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestVhostDeleted >> setUp [
	"todo : go further and create the events queue and bind it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	parser := PulseEventParser newOn: 'test'.
	consumer := PulseConsumer new.
	consumer model: model.
	consumer parser: parser.

	"set up the model for the test"
	model
		selectOrAddEntityNamed: 'testtest'
		withType: PulseVHost
		sourceName: self sourceName.
	2 second wait.

	"consume from the events queues"
	consumer
		consumeQueue: 'events.vhost.deleted';
		start.
	1 seconds wait.
	consumer stop
]

{ #category : #tests }
PulseEventParserTestVhostDeleted >> testModelPopulation [

	self assert: (model allPulseVHosts anySatisfy: [:element | element name = 'testtest' and:[ element deletionDate isNotNil ] ]).

]
