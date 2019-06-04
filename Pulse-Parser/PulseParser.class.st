Class {
	#name : #PulseParser,
	#superclass : #Object,
	#instVars : [
		'sourceName'
	],
	#category : #'Pulse-Parser'
}

{ #category : #initalize }
PulseParser class >> new [
	self notify: 'RMQEventParser need a source -- use newOn: instead'.
	^ self newOn: 'none'.

]

{ #category : #initalize }
PulseParser class >> newOn: sourceString [
	| inst |
	inst := super new.
	inst sourceName: sourceString.
	^ inst

]

{ #category : #accessing }
PulseParser >> sourceName [
	^ sourceName
]

{ #category : #accessing }
PulseParser >> sourceName: anObject [
	sourceName := anObject
]
