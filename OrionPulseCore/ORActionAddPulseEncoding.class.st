Class {
	#name : #ORActionAddPulseEncoding,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'payloads'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseEncoding >> payloads [
	^ payloads
]

{ #category : #accessing }
ORActionAddPulseEncoding >> payloads: anObject [
	payloads := anObject
]

{ #category : #accessing }
ORActionAddPulseEncoding >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseEncoding >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseEncoding >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseEncoding >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseEncoding >> run [

	| newEntity |
	super run.
	newEntity := ORPulseEncoding new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self payloads
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self payloads collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privatePayloads: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateEncoding: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
