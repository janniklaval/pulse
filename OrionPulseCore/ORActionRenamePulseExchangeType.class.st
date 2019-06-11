Class {
	#name : #ORActionRenamePulseExchangeType,
	#superclass : #ORActionRename,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRenamePulseExchangeType >> run [

	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity pulseName: newName.
	entity := theEntity.
	^ entity
]
