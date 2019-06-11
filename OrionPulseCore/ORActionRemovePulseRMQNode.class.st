Class {
	#name : #ORActionRemovePulseRMQNode,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQNode >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity vhosts do: [ :e | e deleteInAction: self ].

	entity type
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity type.
			theEntity privateNodes: (theEntity privateNodes orionCopy orionRemove: entity) ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
