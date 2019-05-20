Extension { #name : #ExchangeType }

{ #category : #'*OrionPulseCore' }
ExchangeType >> privateExchanges [
	^ exchanges
]

{ #category : #'*OrionPulseCore' }
ExchangeType >> privateExchanges: anObject [
	exchanges := anObject
]
