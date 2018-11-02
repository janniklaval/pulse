Class {
	#name : #TransportPolitic,
	#superclass : #Type,
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
TransportPolitic class >> asynchronous [
	^ self new state: #asynchronous
]

{ #category : #accessing }
TransportPolitic class >> callback [
	^ self new state: #callback
]

{ #category : #'as yet unclassified' }
TransportPolitic class >> synchronous [
	^ self new state: #synchronous
]
