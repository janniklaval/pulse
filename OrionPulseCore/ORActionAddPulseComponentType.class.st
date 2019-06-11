Class {
	#name : #ORActionAddPulseComponentType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'components'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseComponentType >> components [
	^ components
]

{ #category : #accessing }
ORActionAddPulseComponentType >> components: anObject [
	components := anObject
]

{ #category : #accessing }
ORActionAddPulseComponentType >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseComponentType >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseComponentType >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseComponentType >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseComponentType >> run [

	| newEntity |
	super run.
	newEntity := ORPulseComponentType new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self components
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self components collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateComponents: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateComponentType: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
