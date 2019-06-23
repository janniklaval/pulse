"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange 
"
Class {
	#name : #PulseEventParserTestExchangeDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestExchangeDeleted >> setUp [

"todo : go further and create the events queue and bing it to the exchange queue ?"
| vhost exchange |

	model := PulseModel new.
	model name: 'test'.
	
	parser := PulseEventParser new. 
	
	consumer := PulseConsumer new.
	consumer model: model. 
	consumer parser: parser.
	
	"purge events queue to make sure it is empty"
	consumer purgeQueue: 'events.exchange.deleted'.
	
	"populate the model with the resource, set vhost "
	vhost := PulseVHost new.
	vhost pulseName: '/';
			mooseModel: model.
	exchange := PulseExchange new pulseName: 'test.delete.exchange';
									mooseModel: model.
	exchange vhost: vhost. 
	vhost exchanges add: exchange. 

	
	"cretate then delete resource"
	consumer createExchange: 'test.delete.exchange' type: 'topic'.
	consumer deleteExchange: 'test.delete.exchange'. 
   1 seconds wait.

	"consume from the events queue"
	consumer consumeQueue: 'events.exchange.deleted'; start. 
	1 seconds wait.
	consumer stop. 
	

	
]

{ #category : #tests }
PulseEventParserTestExchangeDeleted >> testModelPopulation [

	self assert: (model allPulseExchanges anySatisfy: [:element | element name = 'test.delete.exchange' and:[ element deletionDate isNotNil ]]).
]
