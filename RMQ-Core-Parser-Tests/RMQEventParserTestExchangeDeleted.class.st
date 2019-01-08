"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #RMQEventParserTestExchangeDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQEventParserTestExchangeDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"
| vhost exchange |

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"purge events queue to make sure it is empty"
	consumer purgeQueue: 'events.exchange.deleted'.
	
	"populate the model with the resource, set vhost "
	vhost := RMQVHost new.
	vhost pulseName: '/'.
	model add: vhost.
	exchange := RMQExchange new pulseName: 'test.delete.exchange'.
	exchange vhost: vhost. 
	vhost exchanges add: exchange. 
	model add: exchange.  
	2 seconds wait.
	
	"cretate then delete resource"
	"consumer createExchange: 'test.delete.exchange' type: 'topic'.
	1 seconds wait.
	consumer deleteExchange: 'test.delete.exchange'. "

	"consume from the events queue"
	consumer consumeQueue: 'events.exchange.deleted'; start. 
	"5 seconds wait."
	

	
]

{ #category : #tests }
RMQEventParserTestExchangeDeleted >> testModelPopulation [

	self assert: (model allRMQExchanges anySatisfy: [:element | element name = 'test.delete.exchange' and:[ element deletionDate isNotNil ]]).
]
