Class {
	#name : #PulseEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'pulseName'
	],
	#category : #'RMQ-Core-Model'
}

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
