"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.connection.created must not be empty 

    Instance Variables
	consumer:		<Object>
	model:		<Object>
	parser:		<Object>


    Implementation Points
"
Class {
	#name : #RMQEventParserTestConnectionCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestConnectionCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"do something to connect with the broker"
	consumer purgeQueue: 'events.exchange.created'.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.connection.created'; start. 
	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestConnectionCreated >> testModelPopulation [

	"self assert: (model allRMQChannels anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest' and: [ element creationDate isNotNil ] ]).
	"self assert: (model allRMQComponents anySatisfy: [:element |  element subscribedChannels anySatisfy: [ :el | el  vhost = '/']])."
	 
]
