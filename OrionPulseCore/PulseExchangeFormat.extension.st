Extension { #name : #PulseExchangeFormat }

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateExchangeFormatSchema [
	^ exchangeFormatSchema
]

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateExchangeFormatSchema: anObject [
	exchangeFormatSchema := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateExchangeFormatType [
	^ exchangeFormatType
]

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateExchangeFormatType: anObject [
	exchangeFormatType := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
PulseExchangeFormat >> privateMessages: anObject [
	messages := anObject
]
