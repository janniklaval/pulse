Class {
	#name : #ORActionRemovePulseRMQTenant,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQTenant >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.

	entity component
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity component.
			theEntity privateTenants: (theEntity privateTenants orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
