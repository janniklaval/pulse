Class {
	#name : #ORActionRemovePulseRMQCluster,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQCluster >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity nodes do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
