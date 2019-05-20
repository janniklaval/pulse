Class {
	#name : #ORActionRemovePulseRMQUser,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQUser >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity authentifications do: [ :e | e deleteInAction: self ].
	entity initializedChannels do: [ :e | e deleteInAction: self ].
	entity initializedConnections do: [ :e | e deleteInAction: self ].
	entity initializedExchanges do: [ :e | e deleteInAction: self ].
	entity permissions do: [ :e | e deleteInAction: self ].
	entity roles do: [ :e | e deleteInAction: self ].
	entity usedChannels do: [ :e | e deleteInAction: self ].
	entity usedConnections do: [ :e | e deleteInAction: self ].
	
	
	entity vhost do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateUsers: (theEntity privateUsers orionCopy orionRemove: entity) ].

	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
