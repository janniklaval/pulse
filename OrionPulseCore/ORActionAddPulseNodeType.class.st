Class {
	#name : #ORActionAddPulseNodeType,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'rmqState',
		'nodes'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseNodeType >> nodes [
	^ nodes
]

{ #category : #accessing }
ORActionAddPulseNodeType >> nodes: anObject [
	nodes := anObject
]

{ #category : #accessing }
ORActionAddPulseNodeType >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseNodeType >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseNodeType >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseNodeType >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseNodeType >> run [

	| newEntity |
	super run.
	newEntity := ORPulseNodeType new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self nodes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self nodes collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateNodes: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateType: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
