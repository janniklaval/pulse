Class {
	#name : #ORActionAddPulseRMQExchangeFormat,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'exchangeFormatType',
		'exchangeFormatSchema',
		'messages'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> exchangeFormatSchema [
	^ exchangeFormatSchema
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> exchangeFormatSchema: anObject [
	exchangeFormatSchema := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> exchangeFormatType [
	^ exchangeFormatType
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> exchangeFormatType: anObject [
	exchangeFormatType := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQExchangeFormat >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQExchangeFormat >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQExchangeFormat new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"

	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self exchangeFormatSchema ifNotNil: [ :e | 
		newEntity privateExchangeFormatSchema: e orionCopy ].
	
	self exchangeFormatType ifNotNil: [ :e | 
		newEntity privateExchangeFormatType: e orionCopy ].
	
	"Set complex not derived properties of the entity"

	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateExchangeFormat: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
