"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.consumer.deleted queue must not be empty 
"
Class {
	#name : #PulseEventParserTestConsumerDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestConsumerDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| consumer2 |
	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	consumer2 := PulseConsumer new. 
	consumer2 model: model. 
	consumer2 parser: parser.
	
	"consume from the consumer.created queues"
	consumer consumeQueue: 'events.consumer.created'; start. 
	2 seconds wait.
	
	"consume from the events queues"
	consumer2 consumeQueue: 'events.consumer.deleted'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
PulseEventParserTestConsumerDeleted >> testModelPopulation [

	"self assert: (model allRMQChannels anySatisfy: [:element | element vhost name ='/']).
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allPulseConsumerProcesses anySatisfy: [:element | element deletionDate isNotNil and:[ element subscribedChannels anySatisfy: [ :el | el vhost name = '/']]]).
	
]
