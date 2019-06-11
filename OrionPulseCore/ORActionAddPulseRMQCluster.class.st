Class {
	#name : #ORActionAddPulseRMQCluster,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'nodes'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQCluster >> nodes [
	^ nodes
]

{ #category : #accessing }
ORActionAddPulseRMQCluster >> nodes: anObject [
	nodes := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQCluster >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQCluster >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQCluster >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQCluster new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self nodes
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self nodes collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateNodes: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateCluster: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
