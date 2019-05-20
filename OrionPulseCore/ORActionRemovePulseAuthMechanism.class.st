Class {
	#name : #ORActionRemovePulseAuthMechanism,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseAuthMechanism >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity connections do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
