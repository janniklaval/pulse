Class {
	#name : #ExchangeType,
	#superclass : #Type,
	#instVars : [
		'exchanges'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #accessing }
ExchangeType class >> direct [
	^ self new state: #direct
]

{ #category : #accessing }
ExchangeType class >> fanout [
	^ self new state: #fanout
]

{ #category : #accessing }
ExchangeType class >> headers [
	^ self new state: #headers
]

{ #category : #accessing }
ExchangeType class >> topic [
	^ self new state: #topic
]

{ #category : #accessing }
ExchangeType >> exchanges [
	<MSEProperty: #exchanges type: #RMQExchange opposite:#type>
	<multivalued>
	^ exchanges
]

{ #category : #accessing }
ExchangeType >> exchanges: anObject [
	exchanges := anObject
]
