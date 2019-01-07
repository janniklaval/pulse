"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.user.tags.set  queue must not be empty 
with a message containing : a tag = test,  a user = testtest
"
Class {
	#name : #RMQEventParserTestUserTagsSet,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestUserTagsSet >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.user.tags.set'; start. 
	2 seconds wait.
	
]

{ #category : #tests }
RMQEventParserTestUserTagsSet >> testModelPopulation [

	self assert: (model allRMQUsers anySatisfy: [:element | element name = 'testtest' ]).
	self assert: (model allRMQRoles anySatisfy: [:element | element tag = 'test' and: [ element user name = 'testtest' and:[ element settingDate isNotNil ] ] ]).

]
