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
	#category : #'Pulse-Process'
}

{ #category : #accessing }
PulseRESTProcess >> blockToExecute [

	PulseRESTParserApiDefinitions populate: model withJson: restGetter definitions.
	PulseRESTParserApiChannels populate: model withJson: restGetter channels.
	PulseRESTParserApiConnections populate: model withJson: restGetter connections.
	PulseRESTParserApiConsumers populate: model withJson: restGetter consumers.
	PulseRESTParserApiExchanges populate: model withJson: restGetter exchanges.
	PulseRESTParserApiQueues populate: model withJson: restGetter queues.


]

{ #category : #accessing }
PulseRESTProcess >> blockToFinalize [

	^self
]

{ #category : #initalize }
PulseRESTProcess >> initNewModelNamed: aMooseName onServer: serverName port: portAddr userName: username pwd: passw [

	model := PulseModel new.
	model name: aMooseName.
	MooseModel root add: model.

	restGetter := PulseRESTGetter new ipAddr: serverName;
							portAddr: portAddr;
							username: username;
							password: passw.
]
