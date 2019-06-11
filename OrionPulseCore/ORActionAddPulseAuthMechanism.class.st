Class {
	#name : #ORActionAddPulseAuthMechanism,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'connections'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> connections [
	^ connections
]

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> connections: aValue [
	connections := aValue
]

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseAuthMechanism >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseAuthMechanism >> run [

	| newEntity |
	super run.
	newEntity := ORPulseAuthMechanism new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self rmqState ifNotNil: [ :e |
		newEntity privateRmqState: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self connections
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self connections collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateConnections: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateAuthMechanism: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
