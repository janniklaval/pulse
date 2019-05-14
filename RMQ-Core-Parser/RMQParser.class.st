Class {
	#name : #RMQParser,
	#superclass : #Object,
	#instVars : [
		'sourceName'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #accessing }
RMQParser >> sourceName [
	^ sourceName
]

{ #category : #accessing }
RMQParser >> sourceName: anObject [
	sourceName := anObject
]
