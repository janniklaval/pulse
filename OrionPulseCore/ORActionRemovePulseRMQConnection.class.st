Class {
	#name : #ORActionRemovePulseRMQConnection,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQConnection >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity channels do: [ :e | e deleteInAction: self ].

	entity authMechanism
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity authMechanism.
			theEntity privateConnections: (theEntity privateConnections orionCopy orionRemove: entity) ].
		
	entity rmqState
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity rmqState.
			theEntity privateConnections: (theEntity privateConnections orionCopy orionRemove: entity) ].
		
	entity user
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user.
			theEntity privateUsedConnections: (theEntity privateUsedConnections orionCopy orionRemove: entity) ].
		
	entity user_who_performed_connection
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user_who_performed_connection.
			theEntity privateInitializedConnections: (theEntity privateInitializedConnections orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privateConnections: (theEntity privateConnections orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
