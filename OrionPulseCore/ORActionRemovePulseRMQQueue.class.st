Class {
	#name : #ORActionRemovePulseRMQQueue,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQQueue >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity destinationBindings do: [ :e | e deleteInAction: self ].
	entity sendedMessages do: [ :e | e deleteInAction: self ].
	
	entity consumerChannels do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateConsumedQueues: (theEntity privateConsumedQueues orionCopy orionRemove: entity) ].

	entity dead_letter_exchange
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity dead_letter_exchange.
			theEntity private_queues_for_dead_letter: (theEntity private_queues_for_dead_letter orionCopy orionRemove: entity) ].
		
	entity dead_letter_routing_key
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity dead_letter_routing_key.
			theEntity private_queues_for_dead_letter: (theEntity private_queues_for_dead_letter orionCopy orionRemove: entity) ].
		
	entity durability
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity durability.
			theEntity privateQueues: (theEntity privateQueues orionCopy orionRemove: entity) ].
		
	entity messages do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateRoutedQueues: (theEntity privateRoutedQueues orionCopy orionRemove: entity) ].
		
	entity rmqState 
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity rmqState.
			theEntity privateQueues: (theEntity privateQueues orionCopy orionRemove: entity) ].
		
	entity vhost
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity vhost.
			theEntity privateQueues: (theEntity privateQueues orionCopy orionRemove: entity) ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
