Class {
	#name : #DestinationType,
	#superclass : #Type,
	#instVars : [
		'bindings'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #accessing }
DestinationType class >> exchange [
	^ self new rmqState: #exchange
]

{ #category : #accessing }
DestinationType class >> queue [
	^ self new rmqState: #queue
]

{ #category : #accessing }
DestinationType >> bindings [
	<MSEProperty: #bindings type: #RMQBinding opposite:#destinationType>
	<multivalued>
	^ bindings
]

{ #category : #accessing }
DestinationType >> bindings: anObject [
	bindings := anObject
]
