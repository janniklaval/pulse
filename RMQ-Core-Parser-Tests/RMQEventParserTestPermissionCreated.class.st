"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.permission.created  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestPermissionCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestPermissionCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.permission.created'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
RMQEventParserTestPermissionCreated >> testModelPopulation [

	self assert: (model allRMQPermissions anySatisfy: [ :el | el vhost pulseName = '/' and:[ el creationDate isNotNil
								and: [ el user pulseName = 'testuser' and: [ el configureValue = '.*' and: [ el writeValue = '.*' and: [el readValue = '.*'] ] ] ] ]]
	              ).
]
