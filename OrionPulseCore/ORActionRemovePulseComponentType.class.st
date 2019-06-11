Class {
	#name : #ORActionRemovePulseComponentType,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseComponentType >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity components do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
