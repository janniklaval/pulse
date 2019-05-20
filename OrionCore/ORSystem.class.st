Class {
	#name : #ORSystem,
	#superclass : #Object,
	#instVars : [
		'sourceModel',
		'name',
		'announcer',
		'orionModels'
	],
	#classVars : [
		'announcer'
	],
	#classInstVars : [
		'rootSystem'
	],
	#category : #OrionCore
}

{ #category : #'as yet unclassified' }
ORSystem class >> add: anElement [

	self root add: anElement.
	self announcer announce: (ORSystemAdded new entity: anElement).

]

{ #category : #accessing }
ORSystem class >> announcer [
	^ announcer 	ifNil: 
		[ announcer := (Announcer new)]
]

{ #category : #accessing }
ORSystem class >> announcer: anObject [
	announcer := anObject
]

{ #category : #'as yet unclassified' }
ORSystem class >> remove: anElement [

	self root remove: anElement.
	self announcer announce: (ORSystemRemoved new entity: anElement).

]

{ #category : #'as yet unclassified' }
ORSystem class >> resetRoot [ 
	 
	rootSystem := OrderedCollection new
]

{ #category : #'as yet unclassified' }
ORSystem class >> root [ 
	 
	^ rootSystem 
		ifNil: 
			[ rootSystem := (OrderedCollection new)]
]

{ #category : #accessing }
ORSystem >> announcer [
	^ announcer
]

{ #category : #accessing }
ORSystem >> announcer: anObject [
	announcer := anObject
]

{ #category : #'initialize-release' }
ORSystem >> initialize [
	orionModels := OrderedCollection new.
	announcer := Announcer new
]

{ #category : #accessing }
ORSystem >> name [
	^ name
]

{ #category : #accessing }
ORSystem >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
ORSystem >> orionModels [
	^ orionModels
]

{ #category : #accessing }
ORSystem >> orionModels: anObject [
	orionModels := anObject
]

{ #category : #accessing }
ORSystem >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
ORSystem >> sourceModel: anObject [
	sourceModel := anObject
]
