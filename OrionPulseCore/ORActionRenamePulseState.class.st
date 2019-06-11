Class {
	#name : #ORActionRenamePulseState,
	#superclass : #ORActionRename,
	#category : #'OrionPulseCore-Action'
}

{ #category : #'method execution' }
ORActionRenamePulseState >> run [

	| theEntity |
	super run.
	theEntity := (self orionModel retrieveEntity: entity).
	theEntity pulseName: newName.
	entity := theEntity.
	^ entity
]
