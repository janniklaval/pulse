Class {
	#name : #RMQChannel,
	#superclass : #PulseEntity,
	#instVars : [
		'connection',
		'prefetchCount',
		'globalPrefetchCount',
		'idleSince',
		'guaranteeMode',
		'rmqState',
		'vhost',
		'user',
		'user_who_performed_connection',
		'creationDate',
		'closingDate',
		'consumedQueues',
		'pid',
		'subscribedComponent'
	],
	#category : #'RMQ-Core-Model'
}

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
	^ guaranteeMode ifNil: [ self guaranteeMode: GuaranteeMode none.  guaranteeMode]
]

{ #category : #accessing }
RMQChannel >> guaranteeMode: anObject [
	guaranteeMode := self selectEnum: anObject. 
	guaranteeMode channels add: self.
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
	"users := Set new."
	consumedQueues := Set new.
	"subscribedComponents := Set new."
	
	rmqState := State idle.
	rmqState channels add: self.
]

{ #category : #accessing }
RMQChannel >> pid [
	<MSEProperty: #pid type: #String>
	^ pid
]

{ #category : #accessing }
RMQChannel >> pid: anObject [
	pid := anObject
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
RMQChannel >> rmqState [
	<MSEProperty: #rmqState type: #State opposite: #channels>
	^ rmqState ifNil: [ self rmqState: State idle.  rmqState]
]

{ #category : #accessing }
RMQChannel >> rmqState: anObject [
	rmqState := self selectEnum: anObject. 
	rmqState channels add: self.
]

{ #category : #accessing }
RMQChannel >> subscribedComponent [
	<MSEProperty: #subscribedComponent type: #RMQComponent opposite:#subscribedChannels>
	^ subscribedComponent
]

{ #category : #accessing }
RMQChannel >> subscribedComponent: anObject [
	subscribedComponent := anObject
]

{ #category : #accessing }
RMQChannel >> user [
	<MSEProperty: #user type: #RMQUser opposite:#usedChannels>
	^ user
]

{ #category : #accessing }
RMQChannel >> user: anObject [
	user := anObject
]

{ #category : #accessing }
RMQChannel >> user_who_performed_connection [
	<MSEProperty: #user_who_performed_connection type: #RMQUser opposite:#initializedChannels>
	^ user_who_performed_connection
]

{ #category : #accessing }
RMQChannel >> user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
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
