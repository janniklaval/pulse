Class {
	#name : #ORActionRemovePulseRMQExchange,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQExchange >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity alternate_exchange_for do: [ :e | e deleteInAction: self ].
	entity destinationBindings do: [ :e | e deleteInAction: self ].
	entity messages do: [ :e | e deleteInAction: self ].
	entity queues_for_dead_letter do: [ :e | e deleteInAction: self ].
	entity sourceBindings do: [ :e | e deleteInAction: self ].
	
	entity components do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateExchanges: (theEntity privateExchanges orionCopy orionRemove: entity) ].

	entity durability
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity durability.
			theEntity privateExchanges: (theEntity privateExchanges orionCopy orionRemove: entity) ].
		
	entity my_alternate_exchange
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity my_alternate_exchange.
			theEntity private_alternate_exchange_for: (theEntity private_alternate_exchange_for orionCopy orionRemove: entity) ].
		
	entity type
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity type.
			theEntity privateExchanges: (theEntity privateExchanges orionCopy orionRemove: entity) ].
		
		
	entity user_who_performed_action
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity user_who_performed_action.
			theEntity privateInitializedExchanges: (theEntity privateInitializedExchanges orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privateExchanges: (theEntity privateExchanges orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
