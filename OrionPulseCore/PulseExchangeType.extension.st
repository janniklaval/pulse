Extension { #name : #PulseExchangeType }

{ #category : #'*OrionPulseCore' }
PulseExchangeType >> privateExchanges [
	^ exchanges
]

{ #category : #'*OrionPulseCore' }
PulseExchangeType >> privateExchanges: anObject [
	exchanges := anObject
]
