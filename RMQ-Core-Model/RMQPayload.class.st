Class {
	#name : #RMQPayload,
	#superclass : #PulseEntity,
	#instVars : [
		'messages',
		'size_byte',
		'encoding'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQPayload >> encoding [
	<MSEProperty: #encoding type: #Encoding opposite:#payloads>
	^ encoding
]

{ #category : #accessing }
RMQPayload >> encoding: anObject [
	encoding := anObject
]

{ #category : #accessing }
RMQPayload >> initialize [
	super initialize.
	messages := Set new.
]

{ #category : #accessing }
RMQPayload >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#payload>
	<multivalued>
	^ messages
]

{ #category : #accessing }
RMQPayload >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
RMQPayload >> size_byte [
	<MSEProperty: #encoding type: #Number>
	^ size_byte
]

{ #category : #accessing }
RMQPayload >> size_byte: anObject [
	size_byte := anObject
]
