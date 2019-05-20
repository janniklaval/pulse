Class {
	#name : #ORActionRenamePulseNodeType,
	#superclass : #ORActionRename,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRenamePulseNodeType >> run [

	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity pulseName: newName.
	entity := theEntity.
	^ entity
]
