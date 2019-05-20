Class {
	#name : #ORActionRemovePulseRMQVhost,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQVhost >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity bindings do: [ :e | e deleteInAction: self ].
	entity channels do: [ :e | e deleteInAction: self ].
	entity connections do: [ :e | e deleteInAction: self ].
	entity exchanges do: [ :e | e deleteInAction: self ].
	entity permissions do: [ :e | e deleteInAction: self ].
	entity queues do: [ :e | e deleteInAction: self ].

	entity node
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity node.
			theEntity privateVhost: (theEntity privateVhost orionCopy orionRemove: entity) ].
		
	entity users do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateVhosts: (theEntity privateVhosts orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
