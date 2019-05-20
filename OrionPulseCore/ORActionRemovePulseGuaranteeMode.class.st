Class {
	#name : #ORActionRemovePulseGuaranteeMode,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseGuaranteeMode >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity channels do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
