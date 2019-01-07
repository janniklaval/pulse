"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.channel.created must not be empty 
"
Class {
	#name : #RMQEventParserTestChannelCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestChannelCreated >> setUp [

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
	consumer consumeQueue: 'events.channel.created'; start. 
	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestChannelCreated >> testModelPopulation [

	self assert: (model allRMQChannels anySatisfy: [:element | element user name = 'guest' and:[ element creationDate isNotNil ] ]).
	"self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest']).
	self assert: (model allRMQComponents anySatisfy: [:element |  element subscribedChannels anySatisfy: [ :el | el  vhost = '/']])."
	
]
