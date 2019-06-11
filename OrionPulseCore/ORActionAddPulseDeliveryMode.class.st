Class {
	#name : #ORActionAddPulseDeliveryMode,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'messages'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseDeliveryMode >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseDeliveryMode >> run [

	| newEntity |
	super run.
	newEntity := ORPulseDeliveryMode new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeliveryMode: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
