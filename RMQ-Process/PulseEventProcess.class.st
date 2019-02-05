"
PulseEventProcess uniqueInstance initialiseModel: 'test2' host: 'localhost' port: 5672 username: 'guest' password: 'guest'. 
PulseEventProcess uniqueInstance start. 
PulseEventProcess uniqueInstance stop.
"
Class {
	#name : #PulseEventProcess,
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
PulseEventProcess >> blockToExecute [
  
  	consumer consumeEventsQueue ; start.
]

{ #category : #accessing }
PulseEventProcess >> blockToFinalize [

	connection close.
]

{ #category : #connecting }
PulseEventProcess >> definedExchange [
	^ 'amq.rabbitmq.event'
]

{ #category : #connecting }
PulseEventProcess >> definedHost [
	^ 'localhost'
]

{ #category : #initialize }
PulseEventProcess >> initialiseModel: name [ 

   model := PulseModel new.
	model name: name.
	MooseModel root add: model.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
   connection := AmqpConnection new.
	connection protocolClass: Amqp091.
	connection host: self definedHost port: 5672.
	connection open.

	channel := connection newChannel.  
	
    
]

{ #category : #initialize }
PulseEventProcess >> initialiseModel: name host: host port: port username: username password: password [ 

   | credentials |

   model := PulseModel new.
	model name: name.
	MooseModel root add: model.
	
	parser := RMQEventParser new. 
	
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
