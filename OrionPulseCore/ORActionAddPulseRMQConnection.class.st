Class {
	#name : #ORActionAddPulseRMQConnection,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'protocol',
		'connectedAt',
		'authMechanism',
		'host',
		'port',
		'vhost',
		'channels',
		'user',
		'creationDate',
		'closingDate',
		'user_who_performed_connection',
		'peerHost',
		'peerPort',
		'sslProtocol',
		'ssl',
		'sslHash',
		'pid',
		'connectionType'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQConnection >> authMechanism [
	^ authMechanism
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> authMechanism: anObject [
	authMechanism := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> channels [
	^ channels
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> closingDate [
	^ closingDate
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> closingDate: anObject [
	closingDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> connectedAt [
	^ connectedAt
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> connectedAt: anObject [
	connectedAt := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> connectionType [
	^ connectionType
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> connectionType: anObject [
	connectionType := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> host [
	^ host
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> host: anObject [
	host := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> peerHost [
	^ peerHost
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> peerHost: anObject [
	peerHost := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> peerPort [
	^ peerPort
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> peerPort: anObject [
	peerPort := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> pid [
	^ pid
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> pid: anObject [
	pid := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> port [
	^ port
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> port: anObject [
	port := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> protocol [
	^ protocol
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQConnection >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQConnection new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self closingDate ifNotNil: [ :e |
		newEntity privateClosingDate: e orionCopy ].
	
	self connectedAt ifNotNil: [ :e |
		newEntity privateConnectedAt: e orionCopy ].
	
	self connectionType ifNotNil: [ :e |
		newEntity privateConnectionType: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self host ifNotNil: [ :e |
		newEntity privateHost: e orionCopy ].
	
	self peerHost ifNotNil: [ :e |
		newEntity privatePeerHost: e orionCopy ].
	
	self peerPort ifNotNil: [ :e |
		newEntity privatePeerPort: e orionCopy ].
	
	self pid ifNotNil: [ :e |
		newEntity privatePid: e orionCopy ].
	
	self port ifNotNil: [ :e |
		newEntity privatePort: e orionCopy ].
	
	self protocol ifNotNil: [ :e |
		newEntity privateProtocol: e orionCopy ].
	
	self ssl ifNotNil: [ :e |
		newEntity privateSsl: e orionCopy ].
	
	self sslHash ifNotNil: [ :e |
		newEntity privateSslHash: e orionCopy ].
	
	self sslProtocol ifNotNil: [ :e |
		newEntity privateSslProtocol: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self authMechanism
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self authMechanism.
			newEntity privateAuthMechanism: theNewEntity orionCopy.
			theNewEntity privateConnections: (theNewEntity privateConnections orionCopy add: newEntity)].
		
	self channels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self channels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateConnection: newEntity ] ].
		
	self rmqState
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self rmqState.
			newEntity privateRmqState: theNewEntity orionCopy.
			theNewEntity privateConnections: (theNewEntity privateConnections orionCopy add: newEntity)].
		
	self user
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user.
			newEntity privateUser: theNewEntity orionCopy.
			theNewEntity privateUsedConnections: (theNewEntity privateUsedConnections orionCopy add: newEntity)].
		
	self user_who_performed_connection
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user_who_performed_connection.
			newEntity private_user_who_performed_connection: theNewEntity orionCopy.
			theNewEntity privateInitializedConnections: (theNewEntity privateInitializedConnections orionCopy add: newEntity)].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateConnections: (theNewEntity privateConnections orionCopy add: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> ssl [
	^ ssl
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> ssl: anObject [
	ssl := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> sslHash [
	^ sslHash
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> sslHash: anObject [
	sslHash := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> sslProtocol [
	^ sslProtocol
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> sslProtocol: anObject [
	sslProtocol := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> user [
	^ user
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> user: anObject [
	user := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQConnection >> vhost: anObject [
	vhost := anObject
]
