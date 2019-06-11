Class {
	#name : #ORActionRemovePulseExchangeType,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseExchangeType >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity exchanges do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
