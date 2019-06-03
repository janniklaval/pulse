Class {
	#name : #PulseExchangeType,
	#superclass : #PulseEnum,
	#instVars : [
		'#exchanges => FMMany type: #PulseExchange opposite: #type'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseExchangeType class >> annotation [

	<MSEClass: #ExchangeType super: #PulseEnum>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #accessing }
PulseExchangeType class >> direct [
	^ self new pulseState: #direct
]

{ #category : #accessing }
PulseExchangeType class >> fanout [
	^  self new pulseState: #fanout
]

{ #category : #generator }
PulseExchangeType class >> generatedSlotNames [
	<generated>
	'PulseExchangeType class>>#generatedSlotNames'.
	^ #(exchanges)
]

{ #category : #generator }
PulseExchangeType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
PulseExchangeType class >> headers [
	^ self new pulseState: #headers
]

{ #category : #meta }
PulseExchangeType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseExchangeType class >> topic [
	^ self new pulseState: #topic
]

{ #category : #accessing }
PulseExchangeType >> exchanges [

	<generated>
	<MSEComment: 'TODO'>
	^ exchanges
]

{ #category : #accessing }
PulseExchangeType >> exchanges: anObject [

	<generated>
	exchanges value: anObject

]
