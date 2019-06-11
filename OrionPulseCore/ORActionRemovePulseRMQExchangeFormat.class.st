Class {
	#name : #ORActionRemovePulseRMQExchangeFormat,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQExchangeFormat >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity messages do: [ :e | e deleteInAction: self ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
