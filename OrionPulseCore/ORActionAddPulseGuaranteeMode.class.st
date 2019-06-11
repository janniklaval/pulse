Class {
	#name : #ORActionAddPulseGuaranteeMode,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'channels'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> channels [
	^ channels
]

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseGuaranteeMode >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseGuaranteeMode >> run [

	| newEntity |
	super run.
	newEntity := ORPulseGuaranteeMode new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self channels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self channels collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateChannels: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateGuaranteeMode: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
