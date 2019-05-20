Class {
	#name : #ORActionRemovePulseMessageType,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseMessageType >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity messages do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
