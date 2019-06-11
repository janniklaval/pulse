"
An ORActionMove is an Orion abstract class for move actions

Instance Variables
	newContainer:		new container of the moved entity

"
Class {
	#name : #ORActionMove,
	#superclass : #ORAction,
	#instVars : [
		'newContainer'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionMove class >> description [
	^'move'
]

{ #category : #testing }
ORActionMove class >> isMove [
	^ true
]

{ #category : #testing }
ORActionMove >> isPairedChange [
	^ true
]

{ #category : #accessing }
ORActionMove >> newContainer [
	self 
		deprecated: 'Use another container instead'
		on: 	'3 January 2017' 
		in: 'Pharo-6.0-60334-'.
	^ self halt
]

{ #category : #accessing }
ORActionMove >> newContainer: anObject [
	self deprecated: 'Use another container instead' on: '3 January 2017' in: 'Pharo-6.0-60334-'.
	self halt
]

{ #category : #printing }
ORActionMove >> printWorkspace [

	^ super printWorkspace, self entity name , ' in ', self to mooseName
]

{ #category : #accessing }
ORActionMove >> to [
	^ newContainer
]

{ #category : #accessing }
ORActionMove >> to: anObject [
	newContainer := anObject
]
