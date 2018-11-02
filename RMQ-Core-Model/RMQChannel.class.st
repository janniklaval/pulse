Class {
	#name : #RMQChannel,
	#superclass : #MooseEntity,
	#instVars : [
		'channelString',
		'connection',
		'peerHost',
		'peerPort',
		'prefetchCount',
		'globalPrefetchCount',
		'idleSince',
		'guaranteeMode',
		'rmqState',
		'subscribedComponents',
		'vhost',
		'initializer',
		'users',
		'creationDate',
		'closingDate',
		'consumedQueues'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQChannel >> channel [
	<MSEProperty: #channel type: #String>
	^ channelString
]

{ #category : #accessing }
RMQChannel >> channel: anObject [
	channelString := anObject
]

{ #category : #accessing }
RMQChannel >> closingDate [
	<MSEProperty: #closingDate type: #Number>
	^ closingDate
]

{ #category : #accessing }
RMQChannel >> closingDate: anObject [
	closingDate := anObject
]

{ #category : #accessing }
RMQChannel >> connection [
	<MSEProperty: #connection type: #RMQConnection opposite:#channels>
	^ connection
]

{ #category : #accessing }
RMQChannel >> connection: anObject [
	connection := anObject
]

{ #category : #accessing }
RMQChannel >> consumedQueues [
	<MSEProperty: #consumedQueues type: #RMQQueue opposite:#consumerChannels>
	<multivalued>
	^ consumedQueues
]

{ #category : #accessing }
RMQChannel >> consumedQueues: anObject [
	consumedQueues := anObject
]

{ #category : #accessing }
RMQChannel >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQChannel >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQChannel >> globalPrefetchCount [
	<MSEProperty: #globalPrefetchCount type: #Number>
	^ globalPrefetchCount
]

{ #category : #accessing }
RMQChannel >> globalPrefetchCount: anObject [
	globalPrefetchCount := anObject
]

{ #category : #accessing }
RMQChannel >> guaranteeMode [
	<MSEProperty: #guaranteeMode type: #GuaranteeMode opposite: #channels>
	^ guaranteeMode
]

{ #category : #accessing }
RMQChannel >> guaranteeMode: anObject [
	guaranteeMode := anObject
]

{ #category : #accessing }
RMQChannel >> idleSince [
	<MSEProperty: #idleSince type: #Number>
	^ idleSince
]

{ #category : #accessing }
RMQChannel >> idleSince: anObject [
	idleSince := anObject
]

{ #category : #initialization }
RMQChannel >> initialize [

	super initialize.
	users := OrderedCollection new.
	consumedQueues := OrderedCollection new.
	subscribedComponents := OrderedCollection new.
]

{ #category : #accessing }
RMQChannel >> initializer [
	<MSEProperty: #initializer type: #RMQUser opposite:#initializedChannels>
	^ initializer
]

{ #category : #accessing }
RMQChannel >> initializer: anObject [
	initializer := anObject
]

{ #category : #accessing }
RMQChannel >> name [
	<MSEProperty: #name type: #String>
	^ self channel asString
]

{ #category : #accessing }
RMQChannel >> peerHost [
	<MSEProperty: #peerHost type: #String>
	^ peerHost
]

{ #category : #accessing }
RMQChannel >> peerHost: anObject [
	peerHost := anObject
]

{ #category : #accessing }
RMQChannel >> peerPort [
	<MSEProperty: #peerPort type: #String>
	^ peerPort
]

{ #category : #accessing }
RMQChannel >> peerPort: anObject [
	peerPort := anObject
]

{ #category : #accessing }
RMQChannel >> prefetchCount [
	<MSEProperty: #prefetchCount type: #Number>
	^ prefetchCount
]

{ #category : #accessing }
RMQChannel >> prefetchCount: anObject [
	prefetchCount := anObject
]

{ #category : #accessing }
RMQChannel >> reationDate: anObject [
	reationDate := anObject
]

{ #category : #accessing }
RMQChannel >> rmqState [
	<MSEProperty: #rmqState type: #State opposite: #channels>
	^ rmqState
]

{ #category : #accessing }
RMQChannel >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQChannel >> subscribedComponents [
	<MSEProperty: #subscribedComponents type: #RMQComponent opposite:#subscribedChannels>
	<multivalued>
	^ subscribedComponents
]

{ #category : #accessing }
RMQChannel >> subscribedComponents: anObject [
	subscribedComponents := anObject
]

{ #category : #accessing }
RMQChannel >> users [
	<MSEProperty: #users type: #RMQUser opposite:#usedChannels>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQChannel >> users: anObject [
	users := anObject
]

{ #category : #accessing }
RMQChannel >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#channels>
	^ vhost
]

{ #category : #accessing }
RMQChannel >> vhost: anObject [
	vhost := anObject
]
