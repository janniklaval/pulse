Class {
	#name : #ORActionRemovePulseEncoding,
	#superclass : #ORActionRemove,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRemovePulseEncoding >> run [

	super run.
	entity := self orionModel retrieveEntity: entity.
	entity payloads do: [ :e | e deleteInAction: self ].
	
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
