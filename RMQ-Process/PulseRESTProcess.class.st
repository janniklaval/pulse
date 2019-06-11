"
PulseRESTProcess uniqueInstance initNewModelNamed: 'test' onServer: 'localhost' port: '15672' userName: 'guest' pwd: 'guest'.
PulseRESTProcess uniqueInstance start.

PulseRESTProcess uniqueInstance stop
"
Class {
	#name : #PulseRESTProcess,
	#superclass : #PulseAbstractProcess,
	#instVars : [
		'model',
		'restGetter'
	],
	#category : #'RMQ-Process'
}

{ #category : #accessing }
PulseRESTProcess >> blockToExecute [

	RMQRESTParserApiDefinitions populate: model withJson: restGetter definitions.
	RMQRESTParserApiChannels populate: model withJson: restGetter channels.
	RMQRESTParserApiConnections populate: model withJson: restGetter connections.
	RMQRESTParserApiConsumers populate: model withJson: restGetter consumers.
	RMQRESTParserApiExchanges populate: model withJson: restGetter exchanges.
	RMQRESTParserApiQueues populate: model withJson: restGetter queues.


]

{ #category : #accessing }
PulseRESTProcess >> blockToFinalize [

	^self
]

{ #category : #initalize }
PulseRESTProcess >> initNewModelNamed: aMooseName onServer: serverName port: portAddr userName: username pwd: passw [

	model := OldPulseModel new.
	model name: aMooseName.
	MooseModel root add: model.

	restGetter := RMQRESTGetter new ipAddr: serverName;
							portAddr: portAddr;
							username: username;
							password: passw.
]
