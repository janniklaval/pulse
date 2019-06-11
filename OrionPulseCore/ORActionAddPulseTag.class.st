Class {
	#name : #ORActionAddPulseTag,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'roles'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseTag >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseTag >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseTag >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseTag >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
ORActionAddPulseTag >> roles [
	^ roles
]

{ #category : #accessing }
ORActionAddPulseTag >> roles: anObject [
	roles := anObject
]

{ #category : #'method execution' }
ORActionAddPulseTag >> run [

	| newEntity |
	super run.
	newEntity := ORPulseTransportPolitic new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	self rmqState ifNotNil: [ :e |
		newEntity privateRmqState: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self roles
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self roles collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateRoles: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateTag: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
