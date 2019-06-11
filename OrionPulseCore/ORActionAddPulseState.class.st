Class {
	#name : #ORActionAddPulseState,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'channels',
		'connections',
		'queues'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseState >> channels [
	^ channels
]

{ #category : #accessing }
ORActionAddPulseState >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
ORActionAddPulseState >> connections [
	^ connections
]

{ #category : #accessing }
ORActionAddPulseState >> connections: anObject [
	connections := anObject
]

{ #category : #accessing }
ORActionAddPulseState >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseState >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseState >> queues [
	^ queues
]

{ #category : #accessing }
ORActionAddPulseState >> queues: anObject [
	queues := anObject
]

{ #category : #accessing }
ORActionAddPulseState >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseState >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseState >> run [

	| newEntity |
	super run.
	newEntity := ORPulseState new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self rmqState ifNotNil: [ :e |
		newEntity privateRmqState: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self channels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self channels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateRmqState: newEntity ] ].
		
	self connections
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self connections collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateConnections: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateRmqState: newEntity ] ].
		
	self queues
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self queues collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateQueues: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateRmqState: newEntity ] ].

	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
