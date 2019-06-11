Class {
	#name : #ORActionAddPulseRMQChannel,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'closingDate',
		'connection',
		'consumedQueues',
		'creationDate',
		'globalPrefetchCount',
		'guaranteeMode',
		'idleSince',
		'pid',
		'prefetchCount',
		'rmqState',
		'subscribedComponent',
		'user',
		'user_who_performed_connection',
		'vhost'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQChannel >> closingDate [
	^ closingDate
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> closingDate: anObject [
	closingDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> connection [
	^ connection
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> connection: anObject [
	connection := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> consumedQueues [
	^ consumedQueues
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> consumedQueues: anObject [
	consumedQueues := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> globalPrefetchCount [
	^ globalPrefetchCount
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> globalPrefetchCount: anObject [
	globalPrefetchCount := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> guaranteeMode [
	^ guaranteeMode
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> guaranteeMode: anObject [
	guaranteeMode := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> idleSince [
	^ idleSince
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> idleSince: anObject [
	idleSince := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> pid [
	^ pid
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> pid: anObject [
	pid := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> prefetchCount [
	^ prefetchCount
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> prefetchCount: anObject [
	prefetchCount := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQChannel >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQChannel new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self closingDate ifNotNil: [ :e | 
		newEntity privateClosingDate: e orionCopy ].
	
	self creationDate ifNotNil: [ :e | 
		newEntity privateCreationDate: e orionCopy ].
	
	self globalPrefetchCount ifNotNil: [ :e | 
		newEntity privateGlobalPrefetchCount: e orionCopy ].
	
	self idleSince ifNotNil: [ :e | 
		newEntity privateIdleSince: e orionCopy ].
	
	self pid ifNotNil: [ :e | 
		newEntity privatePid: e orionCopy ].
	
	self prefetchCount ifNotNil: [ :e | 
		newEntity privatePrefetchCount: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self connection
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self connection.
			newEntity privateConnection: theNewEntity orionCopy.
			theNewEntity privateChannels: (theNewEntity privateChannels orionCopy add: newEntity)].
	
	self consumedQueues
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self consumedQueues collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateConsumedQueues: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateConsumerChannels: (e privateConsumerChannels orionCopy add: newEntity) ] ].
	
	self guaranteeMode
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self guaranteeMode.
			newEntity privateGuaranteeMode: theNewEntity orionCopy.
			theNewEntity privateChannels: (theNewEntity privateChannels orionCopy add: newEntity)].
		
	self rmqState
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self rmqState.
			newEntity privateRmqState: theNewEntity orionCopy.
			theNewEntity privateChannels: (theNewEntity privateChannels orionCopy add: newEntity)].
		
	self subscribedComponent
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self subscribedComponent.
			newEntity privateSubscribedComponent: theNewEntity orionCopy.
			theNewEntity privateSubscribedChannels: (theNewEntity privateSubscribedChannels orionCopy add: newEntity)].
		
	self user
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user.
			newEntity privateUser: theNewEntity orionCopy.
			theNewEntity privateUsedChannels: (theNewEntity privateUsedChannels orionCopy add: newEntity)].
		
	self user_who_performed_connection
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user_who_performed_connection.
			newEntity private_user_who_performed_connection: theNewEntity orionCopy.
			theNewEntity privateInitializedChannels: (theNewEntity privateInitializedChannels orionCopy add: newEntity)].
		
		self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateChannels: (theNewEntity privateChannels orionCopy add: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> subscribedComponent [
	^ subscribedComponent
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> subscribedComponent: anObject [
	subscribedComponent := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> user [
	^ user
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> user: anObject [
	user := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQChannel >> vhost: anObject [
	vhost := anObject
]
