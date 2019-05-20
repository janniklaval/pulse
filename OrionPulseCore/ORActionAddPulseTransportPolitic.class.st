Class {
	#name : #ORActionAddPulseTransportPolitic,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseTransportPolitic >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseTransportPolitic >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseTransportPolitic >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseTransportPolitic >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseTransportPolitic >> run [

	| newEntity |
	super run.
	newEntity := ORPulseTransportPolitic new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self rmqState ifNotNil: [ :e |
		newEntity privateRmqState: e orionCopy ].
	
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
