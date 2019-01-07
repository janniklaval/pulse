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
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestChannelClosed >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.channel.closed'; start. 
	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestChannelClosed >> testModelPopulation [

	self assert: (model allRMQChannels anySatisfy: [:element | element user name = 'guest' and:[ element closingDate isNotNil ] ]).
]
