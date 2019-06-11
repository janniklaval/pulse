"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.consumer.deleted queue must not be empty 
"
Class {
	#name : #RMQEventParserTestConsumerDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestConsumerDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	| consumer2 |
	model := OldPulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := RMQConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	consumer2 := RMQConsumer new. 
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
RMQEventParserTestConsumerDeleted >> testModelPopulation [

	"self assert: (model allRMQChannels anySatisfy: [:element | element vhost name ='/']).
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allRMQConsumerProcesses anySatisfy: [:element | element deletionDate isNotNil and:[ element subscribedChannels anySatisfy: [ :el | el vhost name = '/']]]).
	
]
