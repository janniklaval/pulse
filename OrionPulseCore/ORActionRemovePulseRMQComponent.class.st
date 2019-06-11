Class {
	#name : #ORActionRemovePulseRMQComponent,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseRMQComponent >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity senderMessages do: [ :e | e deleteInAction: self ].
	entity subscribedChannels do: [ :e | e deleteInAction: self ].
	entity tenants do: [ :e | e deleteInAction: self ].
	
	entity componentType
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity componentType.
			theEntity privateComponents: (theEntity privateComponents orionCopy orionRemove: entity) ].
		
	entity deploymentMode
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity deploymentMode.
			theEntity privateComponents: (theEntity privateComponents orionCopy orionRemove: entity) ].
		
	entity exchanges do: [  :e |
			| theEntity |
			theEntity := self orionModel retrieveEntity: entity e.
			e deleteInAction: self.
			theEntity privateComponents: (theEntity privateComponents orionCopy orionRemove: entity) ].
		
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
