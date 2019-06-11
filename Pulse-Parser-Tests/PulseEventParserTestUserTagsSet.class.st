"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.tags.set  queue must not be empty 
with a message containing : a tag = monitoring,  a user = testuser
"
Class {
	#name : #PulseEventParserTestUserTagsSet,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestUserTagsSet >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.tags.set'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
PulseEventParserTestUserTagsSet >> testModelPopulation [

	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'user' ]).
	self assert: (model allPulseRoles anySatisfy: [:element | element tag name = 'testing' and: [ element user name = 'user' and:[ element settingDate isNotNil ] ] ] ).

]
