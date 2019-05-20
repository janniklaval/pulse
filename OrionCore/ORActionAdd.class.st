"
An ORActionAdd is an Orion abstract class for add  actions

"
Class {
	#name : #ORActionAdd,
	#superclass : #ORAction,
	#category : #'OrionCore-action'
}

{ #category : #testing }
ORActionAdd class >> isAddition [
	^ true
]

{ #category : #testing }
ORActionAdd >> belongsToParentModel [
	^ false
]
