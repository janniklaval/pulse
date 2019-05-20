Class {
	#name : #ORActionRemovePulseNodeType,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseNodeType >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity nodes do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
