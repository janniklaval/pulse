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
PulseSource >> initialize [

	super initialize.	
	entities := Set new.
]

{ #category : #accessing }
PulseSource >> path [
	^ path
]

{ #category : #accessing }
PulseSource >> path: anObject [
	path := anObject
]

{ #category : #accessing }
PulseSource >> pulseName [
	<MSEProperty: #pulseName type: #String>
	^ path
]
