Class {
	#name : #TransportPolitic,
	#superclass : #Type,
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
TransportPolitic class >> asynchronous [
		^ self new rmqState: #asynchronous
]

{ #category : #accessing }
TransportPolitic class >> callback [
	^ self new rmqState: #callback
]

{ #category : #'as yet unclassified' }
TransportPolitic class >> synchronous [
	^ self new rmqState: #synchronous
]
