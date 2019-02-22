"
PulseTraceProcess uniqueInstance initNewModelNamed: 'test' onServer: 'localhost' port: '15672' userName: 'guest' pwd: 'guest'.
PulseTraceProcess uniqueInstance start.

PulseTraceProcess uniqueInstance stop
"
Class {
	#name : #PulseTraceProcess,
	#superclass : #PulseAbstractProcess,
	#instVars : [
		'model',
		'parser',
		'connection',
		'channel',
		'consumer'
	],
	#category : #'RMQ-Process'
}

{ #category : #accessing }
PulseTraceProcess >> blockToExecute [
  
  	consumer consumeTracesQueue ; start.
]

{ #category : #accessing }
PulseTraceProcess >> blockToFinalize [

	connection close.
	consumer stop. 
   "model save."
]

{ #category : #initialize }
PulseTraceProcess >> initialiseModel: name host: host port: port username: username password: password [ 

   | credentials |

   model := PulseModel new.
	model name: name.
	MooseModel root add: model.
	
	parser := RMQTraceParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	credentials := AmqpPlainCredentials new username: username ; password: password.
	
	
   connection := AmqpConnection new.
	connection protocolClass: Amqp091.
	connection host: host port: port.
	connection credentials: credentials. 
	connection open.

	channel := connection newChannel.  
	
]
