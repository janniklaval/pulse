Class {
	#name : #ORActionRemovePulseState,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseState >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity channels do: [ :e | e deleteInAction: self ].
	entity queues do: [ :e | e deleteInAction: self ].
	entity connections do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
