Class {
	#name : #ORActionAddPulseMessageType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'messages'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseMessageType >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseMessageType >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseMessageType >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseMessageType >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseMessageType >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseMessageType >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseMessageType >> run [

	| newEntity |
	super run.
	newEntity := ORPulseMessageType new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateMessageType: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
