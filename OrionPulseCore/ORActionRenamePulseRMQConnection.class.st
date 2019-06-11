Class {
	#name : #ORActionRenamePulseRMQConnection,
	#superclass : #ORActionRename,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRenamePulseRMQConnection >> run [

	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity pulseName: newName.
	entity := theEntity.
	^ entity
]
