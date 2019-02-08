"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
events.channel.closed must not be empty  
"
Class {
	#name : #RMQEventParserTestChannelClosed,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestChannelClosed >> setUp [


"todo : go further and create the events queue and bing it to the exchange queue ?"

	| consumer2 |
	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	consumer2 := ConsumeEvents new. 
	consumer2 model: model. 
	consumer2 parser: parser.
	
	"listen first to the channel.created queue"
	consumer consumeQueue: 'events.channel.created'; start. 
	2 seconds wait.

	"consume from the events queues"
	consumer2 consumeQueue: 'events.channel.closed'; start. 
	1 seconds wait.
	consumer stop. 
	
	

]

{ #category : #tests }
RMQEventParserTestChannelClosed >> testModelPopulation [

	self assert: (model allRMQChannels anySatisfy: [:element | element user name = 'guest' and:[ element closingDate isNotNil ] ]).
]
