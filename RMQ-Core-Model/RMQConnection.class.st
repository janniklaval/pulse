Class {
	#name : #RMQConnection,
	#superclass : #PulseEntity,
	#instVars : [
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
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQConnection >> authMechanism [
	<MSEProperty: #authMechanism type: #AuthMechanism opposite:#connections>
	^ authMechanism
]

{ #category : #accessing }
RMQConnection >> authMechanism: anObject [
	authMechanism := anObject
]

{ #category : #accessing }
RMQConnection >> channels [
	<MSEProperty: #channels type: #RMQChannel opposite:#connection>
	<multivalued>
	^ channels
]

{ #category : #accessing }
RMQConnection >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
RMQConnection >> closingDate [
	<MSEProperty: #closingDate type: #Number>
	^ closingDate
]

{ #category : #accessing }
RMQConnection >> closingDate: anObject [
	closingDate := anObject
]

{ #category : #accessing }
RMQConnection >> connectedAt [
	<MSEProperty: #connectedAt type: #Number>
	^ connectedAt
]

{ #category : #accessing }
RMQConnection >> connectedAt: anObject [
	connectedAt := anObject
]

{ #category : #accessing }
RMQConnection >> connectionType [
	<MSEProperty: #connectionType type: #String>
	^ connectionType
]

{ #category : #accessing }
RMQConnection >> connectionType: anObject [
	connectionType := anObject
]

{ #category : #accessing }
RMQConnection >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQConnection >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQConnection >> host [
	<MSEProperty: #host type: #String>
	^ host
]

{ #category : #accessing }
RMQConnection >> host: anObject [
	host := anObject
]

{ #category : #initialization }
RMQConnection >> initialize [

	super initialize.
	users := Set new.
	channels := Set new.
]

{ #category : #accessing }
RMQConnection >> peerHost [
	<MSEProperty: #peerHost type: #String>
	^ peerHost
]

{ #category : #accessing }
RMQConnection >> peerHost: anObject [
	peerHost := anObject
]

{ #category : #accessing }
RMQConnection >> peerPort [
	<MSEProperty: #peerPort type: #String>
	^ peerPort
]

{ #category : #accessing }
RMQConnection >> peerPort: anObject [
	peerPort := anObject
]

{ #category : #accessing }
RMQConnection >> pid [
	<MSEProperty: #pid type: #String>
	^ pid
]

{ #category : #accessing }
RMQConnection >> pid: anObject [
	pid := anObject
]

{ #category : #accessing }
RMQConnection >> port [
	<MSEProperty: #port type: #String>
	^ port
]

{ #category : #accessing }
RMQConnection >> port: anObject [
	port := anObject
]

{ #category : #accessing }
RMQConnection >> protocol [
	<MSEProperty: #protocol type: #String>
	^ protocol
]

{ #category : #accessing }
RMQConnection >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
RMQConnection >> rmqState [
	<MSEProperty: #rmqState type: #State opposite: #connections>
	^ rmqState
]

{ #category : #accessing }
RMQConnection >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQConnection >> ssl [
	<MSEProperty: #ssl type: #Boolean>
	^ ssl
]

{ #category : #accessing }
RMQConnection >> ssl: anObject [
	ssl := anObject
]

{ #category : #accessing }
RMQConnection >> sslHash [
	<MSEProperty: #sslHash type: #String>
	^ sslHash
]

{ #category : #accessing }
RMQConnection >> sslHash: anObject [
	sslHash := anObject
]

{ #category : #accessing }
RMQConnection >> sslProtocol [
	<MSEProperty: #sslProtocol type: #String>
	^ sslProtocol
]

{ #category : #accessing }
RMQConnection >> sslProtocol: anObject [
	sslProtocol := anObject
]

{ #category : #accessing }
RMQConnection >> user [
	<MSEProperty: #users type: #RMQUser opposite:#usedConnections>
	^ user
]

{ #category : #accessing }
RMQConnection >> user: anObject [
	user := anObject
]

{ #category : #accessing }
RMQConnection >> user_who_performed_connection [
	<MSEProperty: #user_who_performed_connection type: #RMQUser opposite:#initializedConnections>
	^ user_who_performed_connection
]

{ #category : #accessing }
RMQConnection >> user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]

{ #category : #accessing }
RMQConnection >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#connections>
	^ vhost
]

{ #category : #accessing }
RMQConnection >> vhost: anObject [
	vhost := anObject
]
