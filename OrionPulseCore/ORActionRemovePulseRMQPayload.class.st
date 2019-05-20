Class {
	#name : #ORActionRemovePulseRMQPayload,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQPayload >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity messages do: [ :e | e deleteInAction: self ].

	entity encoding
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity encoding.
			theEntity privatePayloads: (theEntity privatePayloads orionCopy orionRemove: entity) ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
