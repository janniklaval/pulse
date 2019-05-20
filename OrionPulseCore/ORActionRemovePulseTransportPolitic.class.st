Class {
	#name : #ORActionRemovePulseTransportPolitic,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseTransportPolitic >> run [

	super run.
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
