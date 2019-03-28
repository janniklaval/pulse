Class {
	#name : #PulseEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'pulseName',
		'sources'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #testing }
PulseEntity class >> isVoyageRoot [

	^true
]

{ #category : #accessing }
PulseEntity >> name [
	<MSEProperty: #name type: #String>
	^ self pulseName
]

{ #category : #accessing }
PulseEntity >> pulseName [
	^ pulseName
]

{ #category : #accessing }
PulseEntity >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #utility }
PulseEntity >> selectEnum: anEnumObject [

	^ self mooseModel selectOrAddEntityNamed: anEnumObject name withType: anEnumObject class. 
]

{ #category : #accessing }
PulseEntity >> sources [
	<MSEProperty: #sources type: #PulseSource>
	<multivalued>
	^ sources
]

{ #category : #accessing }
PulseEntity >> sources: anObject [
	sources := anObject
]
