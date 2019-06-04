"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.channel.created must not be empty 
"
Class {
	#name : #PulseEventParserTestChannelCreated,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestChannelCreated >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"do something to connect with the broker"
	consumer purgeQueue: 'events.exchange.created'.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.channel.created'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
PulseEventParserTestChannelCreated >> testModelPopulation [

	self assert: (model allPulseChannels anySatisfy: [:element | element user name = 'guest' and:[ element creationDate isNotNil ] ]).
	"self assert: (model allRMQConnections anySatisfy: [:element | element user name = 'guest'])."
	self assert: (model allPulseUsers anySatisfy: [:element | element name = 'guest' and:[ element vhosts anySatisfy: [:el| el name = '/']  ] ]).
	
]