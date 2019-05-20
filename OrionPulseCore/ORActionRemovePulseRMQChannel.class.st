Class {
	#name : #ORActionRemovePulseRMQChannel,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQChannel >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	
	entity connection
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity connection.
			theEntity privateChannels: (theEntity privateChannels orionCopy orionRemove: entity) ].
		
	entity consumedQueues do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateConsumerChannels: (theEntity privateConsumerChannels orionCopy orionRemove: entity) ].
		
	entity guaranteeMode
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity guaranteeMode.
			theEntity privateChannels: (theEntity privateChannels orionCopy orionRemove: entity) ].
		
	entity rmqState
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity rmqState.
			theEntity privateChannels: (theEntity privateChannels orionCopy orionRemove: entity) ].
		
	entity subscribedComponent
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity subscribedComponent.
			theEntity privateSubscribedChannels: (theEntity privateSubscribedChannels orionCopy orionRemove: entity) ].
		
	entity user
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user.
			theEntity privateUsedChannels: (theEntity privateUsedChannels orionCopy orionRemove: entity) ].
		
	entity user_who_performed_connection
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user_who_performed_connection.
			theEntity privateInitializedChannels: (theEntity privateInitializedChannels orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privateChannels: (theEntity privateChannels orionCopy orionRemove: entity) ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
