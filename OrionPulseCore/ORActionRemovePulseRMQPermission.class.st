Class {
	#name : #ORActionRemovePulseRMQPermission,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQPermission >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.

	entity user
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user.
			theEntity privatePermissions: (theEntity privatePermissions orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privatePermissions: (theEntity privatePermissions orionCopy orionRemove: entity) ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
