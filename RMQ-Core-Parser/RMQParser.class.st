Class {
	#name : #RMQParser,
	#superclass : #Object,
	#instVars : [
		'sourceName'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initalize }
RMQParser class >> new [
	self notify: 'RMQEventParser need a source -- use newOn: instead'.
	^ self newOn: 'none'.

]

{ #category : #initalize }
RMQParser class >> newOn: sourceString [
	| inst |
	inst := super new.
	inst sourceName: sourceString.
	^ inst

]

{ #category : #accessing }
RMQParser >> sourceName [
	^ sourceName
]

{ #category : #accessing }
RMQParser >> sourceName: anObject [
	sourceName := anObject
]
