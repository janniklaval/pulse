Class {
	#name : #ORActionRenamePulseRMQRole,
	#superclass : #ORActionRename,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRenamePulseRMQRole >> run [

	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity pulseName: newName.
	entity := theEntity.
	^ entity
]
