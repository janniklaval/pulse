"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.tags.set  queue must not be empty 
with a message containing : a tag = monitoring,  a user = testuser
"
Class {
	#name : #RMQEventParserTestUserTagsSet,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestUserTagsSet >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.tags.set'; start. 
	1 seconds wait.
	consumer stop.
	
]

{ #category : #tests }
RMQEventParserTestUserTagsSet >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'user' ]).
	self assert: (model allRMQRoles anySatisfy: [:element | element tag name = 'testing' and: [ element user name = 'user' and:[ element settingDate isNotNil ] ] ] ).

]
