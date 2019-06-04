Class {
	#name : #PulseExchangeFormat,
	#superclass : #PulseEntity,
	#instVars : [
		'#exchangeFormatSchema',
		'#exchangeFormatType',
		'#messages => FMMany type: #PulseMessage opposite: #exchangeFormat'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseExchangeFormat class >> annotation [

	<MSEClass: #ExchangeFormat super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseExchangeFormat class >> generatedSlotNames [
	<generated>
	'PulseExchangeFormat class>>#generatedSlotNames'.
	^ #(exchangeFormatSchema exchangeFormatType messages)
]

{ #category : #generator }
PulseExchangeFormat class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseExchangeFormat class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseExchangeFormat >> exchangeFormatSchema [

	<MSEProperty: #exchangeFormatSchema type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ exchangeFormatSchema
]

{ #category : #accessing }
PulseExchangeFormat >> exchangeFormatSchema: anObject [

	<generated>
	exchangeFormatSchema := anObject

]

{ #category : #accessing }
PulseExchangeFormat >> exchangeFormatType [

	<MSEProperty: #exchangeFormatType type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ exchangeFormatType
]

{ #category : #accessing }
PulseExchangeFormat >> exchangeFormatType: anObject [

	<generated>
	exchangeFormatType := anObject

]

{ #category : #accessing }
PulseExchangeFormat >> messages [

	<generated>
	<MSEComment: 'TODO'>
	^ messages
]

{ #category : #accessing }
PulseExchangeFormat >> messages: anObject [

	<generated>
	messages value: anObject

]