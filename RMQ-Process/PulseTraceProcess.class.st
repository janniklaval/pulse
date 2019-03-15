"
PulseTraceProcess uniqueInstance initialiseModel: 'TraceModel1' host: 'localhost' port: '15672' username: 'guest' password: 'guest'.
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
PulseTraceProcess >> initialiseModel: name [ 

	"| repository |" 
	
   model := PulseModel new.
	model name: name.
	MooseModel root add: model.
	
	parser := RMQTraceParser new. 
	
	consumer := RMQConsumer new. 
	consumer model: model. 
	consumer parser: parser.
	
   connection := AmqpConnection new.
	connection protocolClass: Amqp091.
	connection host: 'localhost' port: 5672.
	connection open.

	channel := connection newChannel.  


   "repository := VOMongoRepository
   host: 'localhost'
   database: 'rmqmodel'.
   repository enableSingleton."
]

{ #category : #initialize }
PulseTraceProcess >> initialiseModel: name host: host port: port username: username password: password [ 

   | credentials |

   model := PulseModel new.
	model name: name.
	MooseModel root add: model.
	
	parser := RMQTraceParser new. 
	
	consumer := RMQConsumer new. 
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
