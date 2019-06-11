Class {
	#name : #ORActionRemovePulseRMQRoutingKey,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQRoutingKey >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity binding do: [ :e | e deleteInAction: self ].
	entity queues_for_dead_letter do: [ :e | e deleteInAction: self ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
