Class {
	#name : #ORActionRemovePulseRMQMessage,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQMessage >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.

	entity deliveryMode
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity deliveryMode.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity exchange
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity exchange.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity exchangeFormat
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity exchangeFormat.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity messageType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity messageType.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity payload
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity payload.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity queue
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity queue.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity routedQueues do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateMessages: (theEntity privateMessages orionCopy orionRemove: entity) ].
		
	entity senderComponent
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity queue.
			theEntity privateSenderMessages: (theEntity privateSenderMessages orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
