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
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.consumer.created'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
RMQEventParserTestConsumerCreated >> testModelPopulation [
	"self assert: (model allRMQChannels anySatisfy: [:element | element vhost name ='/']).
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allRMQConsumerProcesses anySatisfy: [:element | element creationDate isNotNil 
		                                                          and:[ element subscribedChannels anySatisfy: [ :el | el vhost name = '/'
				                                                    and: [ element subscribedChannels anySatisfy: [ :elem | elem consumedQueues isNotNil
						                                              and: [ element exclusive = 0 and: [ element ackRequired = 1  ] ] ] ]]]] ).
	
]
