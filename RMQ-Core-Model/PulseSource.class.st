Class {
	#name : #PulseSource,
	#superclass : #PulseEntity,
	#instVars : [
		'path',
		'entities'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
PulseSource >> entities [
	<MSEProperty: #entities type: #PulseEntity>
	<multivalued>
	^ entities
]

{ #category : #accessing }
PulseSource >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
PulseSource >> path [
	^ path
]

{ #category : #accessing }
PulseSource >> path: anObject [
	path := anObject
]
