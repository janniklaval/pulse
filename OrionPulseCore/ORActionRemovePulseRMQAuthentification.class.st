Class {
	#name : #ORActionRemovePulseRMQAuthentification,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQAuthentification >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	
	entity user
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user.
			theEntity privateAuthentifications: (theEntity privateAuthentifications orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
