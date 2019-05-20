Class {
	#name : #ORActionRemovePulseTag,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseTag >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity roles do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
