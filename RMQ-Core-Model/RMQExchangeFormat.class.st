Class {
	#name : #RMQExchangeFormat,
	#superclass : #PulseEntity,
	#instVars : [
		'exchangeFormatType',
		'exchangeFormatSchema',
		'messages'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQExchangeFormat >> exchangeFormatSchema [
	<MSEProperty: #exchangeFormatSchema type: #String>
	^ exchangeFormatSchema
]

{ #category : #accessing }
RMQExchangeFormat >> exchangeFormatSchema: anObject [
	exchangeFormatSchema := anObject
]

{ #category : #accessing }
RMQExchangeFormat >> exchangeFormatType [
	<MSEProperty: #exchangeFormatType type: #String>
	^ exchangeFormatType
]

{ #category : #accessing }
RMQExchangeFormat >> exchangeFormatType: anObject [
	exchangeFormatType := anObject
]

{ #category : #accessing }
RMQExchangeFormat >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#exchangeFormat>
	<multivalued>
	^ messages
]

{ #category : #accessing }
RMQExchangeFormat >> messages: anObject [
	messages := anObject
]
