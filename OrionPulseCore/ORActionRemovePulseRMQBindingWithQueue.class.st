Class {
	#name : #ORActionRemovePulseRMQBindingWithQueue,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQBindingWithQueue >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity routingKey do: [ :e | e deleteInAction: self ].
	
	entity destination
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity destination.
			theEntity privateDestinationBindings: (theEntity privateAuthMechanism orionCopy orionRemove: entity) ].
		
	entity source
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity source.
			theEntity privateSourceBindings: (theEntity privateSourceBindings orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privateBindings: (theEntity privateChildNamedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
