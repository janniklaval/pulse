"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.consumer.created queue must not be empty 
"
Class {
	#name : #RMQEventParserTestConsumerCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestConsumerCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.consumer.created'; start. 
	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestConsumerCreated >> testModelPopulation [

	"self assert: (model allRMQChannels anySatisfy: [:element | element vhost name ='/']).
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allRMQComponents anySatisfy: [:element | element creationDate isNotNil and:[ element subscribedChannels anySatisfy: [ :el | el vhost name = '/']]]).
	
]
