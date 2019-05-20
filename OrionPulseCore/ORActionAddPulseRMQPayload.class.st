Class {
	#name : #ORActionAddPulseRMQPayload,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'messages',
		'size_byte',
		'encoding'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQPayload >> encoding [
	^ encoding
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> encoding: anObject [
	encoding := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQPayload >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQPayload new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self size_byte ifNotNil: [ :e |
		newEntity private_size_byte: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self encoding
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self encoding.
			newEntity privateEncoding: theNewEntity orionCopy.
			theNewEntity privatePayloads: (theNewEntity privatePayloads orionCopy unsafeAdd: newEntity)].
		
	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privatePayload: (e privatePayloads orionCopy unsafeAdd: newEntity) ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> size_byte [
	^ size_byte
]

{ #category : #accessing }
ORActionAddPulseRMQPayload >> size_byte: anObject [
	size_byte := anObject
]
