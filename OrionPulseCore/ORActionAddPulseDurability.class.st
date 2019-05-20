Class {
	#name : #ORActionAddPulseDurability,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'exchanges',
		'queues'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseDurability >> exchanges [
	^ exchanges
]

{ #category : #accessing }
ORActionAddPulseDurability >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
ORActionAddPulseDurability >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseDurability >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseDurability >> queues [
	^ queues
]

{ #category : #accessing }
ORActionAddPulseDurability >> queues: anObject [
	queues := anObject
]

{ #category : #accessing }
ORActionAddPulseDurability >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseDurability >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseDurability >> run [

	| newEntity |
	super run.
	newEntity := ORPulseDurability new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self exchanges
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self exchanges collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateExchanges: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDurability: newEntity ] ].
		
	self queues
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self queues collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateQueues: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDurability: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
