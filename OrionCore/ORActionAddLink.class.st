"
An ORActionAddLink is an Orion abstract class for add link actions

Instance Variables
	from:		source of the link
	to:		target of the link

"
Class {
	#name : #ORActionAddLink,
	#superclass : #ORActionAdd,
	#instVars : [
		'from',
		'to'
	],
	#category : #'OrionCore-action'
}

{ #category : #'as yet unclassified' }
ORActionAddLink class >> description [
	^'add association'
]

{ #category : #accessing }
ORActionAddLink >> from [
	self 
		deprecated: 'Use real from instead'
		on: 	'3 January 2017' 
		in: 'Pharo-6.0-60334-'.
	^ self halt
]

{ #category : #accessing }
ORActionAddLink >> from: anObject [
		self 
		deprecated: 'Use real from instead'
		on: 	'3 January 2017' 
		in: 'Pharo-6.0-60334-'.
	^ self halt
]

{ #category : #printing }
ORActionAddLink >> printWorkspace [

	^ super printWorkspace, ' from ', self from mooseName, ' to ', self to mooseName
]

{ #category : #accessing }
ORActionAddLink >> to [
		self 
		deprecated: 'Use real to instead'
		on: 	'3 January 2017' 
		in: 'Pharo-6.0-60334-'.
	^ self halt
]

{ #category : #accessing }
ORActionAddLink >> to: anObject [
		self 
		deprecated: 'Use real to instead'
		on: 	'3 January 2017' 
		in: 'Pharo-6.0-60334-'.
	^ self halt
]
