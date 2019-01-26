Class {
	#name : #MessageType,
	#superclass : #PulseEnum,
	#instVars : [
		'messages'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #'as yet unclassified' }
MessageType class >> acknowledged [
	^self new rmqState: #acknowledged
]

{ #category : #'as yet unclassified' }
MessageType class >> published [
	^ self new rmqState: #published
]

{ #category : #'as yet unclassified' }
MessageType class >> ready [
	^ self new rmqState: #ready
]

{ #category : #accessing }
MessageType class >> received [
	^ self new rmqState: #received
]

{ #category : #accessing }
MessageType class >> redelivered [
	^ self new rmqState: #redelivered
]

{ #category : #'as yet unclassified' }
MessageType class >> unacknowledged [
	^ self new rmqState: #unacknowledged
]

{ #category : #accessing }
MessageType >> initialize [
	super initialize.
	messages := Set new.
]

{ #category : #accessing }
MessageType >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#messageType>
	<multivalued>
	^ messages
]

{ #category : #accessing }
MessageType >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
MessageType >> name [

	^ self rmqState.
]
