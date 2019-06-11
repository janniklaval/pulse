"
A ORActionRemoveEntity is an Orion abstract class for remove entity actions
"
Class {
	#name : #ORActionRemoveEntity,
	#superclass : #ORActionRemove,
	#category : #'OrionCore-action'
}

{ #category : #printing }
ORActionRemoveEntity >> printWorkspace [

	^ super printWorkspace , self entity mooseName.
]
