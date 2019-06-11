Class {
	#name : #ORActionAddPulseRMQVHost,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'node',
		'users',
		'connections',
		'queues',
		'exchanges',
		'bindings',
		'channels',
		'tracing',
		'creationDate',
		'deletionDate',
		'permissions'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQVHost >> bindings [
	^ bindings
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> bindings: anObject [
	bindings := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> channels [
	^ channels
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> connections [
	^ connections
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> connections: anObject [
	connections := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> exchanges [
	^ exchanges
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> node [
	^ node
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> node: anObject [
	node := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> permissions [
	^ permissions
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> permissions: anObject [
	permissions := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> queues [
	^ queues
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> queues: anObject [
	queues := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQVHost >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQVHost new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self tracing ifNotNil: [ :e |
		newEntity privateTracing: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self bindings
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self bindings collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateBindings: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
		
	self channels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self channels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
		
	self connections
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self connections collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateConnections: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
		
	self exchanges
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self exchanges collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateExchanges: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
	
	self node
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self node.
			newEntity privateNode: theNewEntity orionCopy.
			theNewEntity privateVhosts: (theNewEntity privateVhosts orionCopy unsafeAdd: newEntity)].
		
	self permissions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self permissions collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privatePermissions: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
		
	self queues
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self queues collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateQueues: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhost: newEntity ] ].
		
	self users
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self users collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateUsers: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateVhosts: (e privateVhosts orionCopy unsafeAdd: newEntity) ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> tracing [
	^ tracing
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> tracing: anObject [
	tracing := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> users [
	^ users
]

{ #category : #accessing }
ORActionAddPulseRMQVHost >> users: anObject [
	users := anObject
]
