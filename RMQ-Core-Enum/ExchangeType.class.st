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
	^ self new rmqState: #direct
]

{ #category : #accessing }
ExchangeType class >> fanout [
	^  self new rmqState: #fanout
]

{ #category : #accessing }
ExchangeType class >> headers [
	^ self new rmqState: #headers
]

{ #category : #accessing }
ExchangeType class >> topic [
	^ self new rmqState: #topic
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

{ #category : #initialization }
ExchangeType >> initialize [

	super initialize.
	exchanges := Set new.
	
]
