Class {
	#name : #ORActionAddPulseExchangeType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'exchanges'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseExchangeType >> exchanges [
	^ exchanges
]

{ #category : #accessing }
ORActionAddPulseExchangeType >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
ORActionAddPulseExchangeType >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseExchangeType >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseExchangeType >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseExchangeType >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseExchangeType >> run [

	| newEntity |
	super run.
	newEntity := ORPulseExchangeType new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self exchanges
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self exchanges collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateExchanges: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateType: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
