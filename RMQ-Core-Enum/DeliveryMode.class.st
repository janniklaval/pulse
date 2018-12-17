Class {
	#name : #DeliveryMode,
	#superclass : #Type,
	#instVars : [
		'messages'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
DeliveryMode class >> nonPersistent [
	^ self new rmqState: #nonPersistent
]

{ #category : #'as yet unclassified' }
DeliveryMode class >> persistent [
	^ self new rmqState: #persistent
]

{ #category : #accessing }
DeliveryMode >> initialize [
	super initialize.
	messages := Set new.
]

{ #category : #accessing }
DeliveryMode >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#deliveryMode>
	<multivalued>
	^ messages
]

{ #category : #accessing }
DeliveryMode >> messages: anObject [
	messages := anObject
]
