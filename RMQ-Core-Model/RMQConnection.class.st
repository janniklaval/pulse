Class {
	#name : #RMQConnection,
	#superclass : #MooseEntity,
	#instVars : [
		'connectionString',
		'rmqState',
		'protocol',
		'connectedAt',
		'authMechanism',
		'host',
		'port',
		'vhost',
		'channels',
		'initializer',
		'users',
		'creationDate',
		'closingDate'
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
RMQConnection >> connectionString [
	^ connectionString
]

{ #category : #accessing }
RMQConnection >> connectionString: anObject [
	connectionString := anObject
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
	users := OrderedCollection new.
	channels := OrderedCollection new.
]

{ #category : #accessing }
RMQConnection >> initializer [
	<MSEProperty: #initializer type: #RMQUser opposite:#initializedConnections>
	^ initializer
]

{ #category : #accessing }
RMQConnection >> initializer: anObject [
	initializer := anObject
]

{ #category : #accessing }
RMQConnection >> name [
<MSEProperty: #name type: #String>
	^self connectionString
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
RMQConnection >> users [
	<MSEProperty: #users type: #RMQUser opposite:#usedConnections>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQConnection >> users: anObject [
	users := anObject
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
