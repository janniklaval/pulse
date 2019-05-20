Class {
	#name : #ORActionRemovePulseDurability,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseDurability >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity exchanges do: [ :e | e deleteInAction: self ].
	entity queues do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
