Class {
	#name : #ORActionRemovePulseRMQRole,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQRole >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.

	entity tag
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity tag.
			theEntity privateRoles: (theEntity privateRoles orionCopy orionRemove: entity) ].
		
	entity user
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user.
			theEntity privateRoles: (theEntity privateRoles orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
