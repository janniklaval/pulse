"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.permission.created  queue must not be empty 
"
Class {
	#name : #PulseEventParserTestPermissionCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestPermissionCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.permission.created'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
PulseEventParserTestPermissionCreated >> testModelPopulation [

	self assert: (model allPulsePermissions anySatisfy: [ :el | el vhost pulseName = '/' and:[ el creationDate isNotNil
								and: [ el user pulseName = 'testuser' and: [ el configureValue = '.*' and: [ el writeValue = '.*' and: [el readValue = '.*'] ] ] ] ]]
	              ).
]
