Extension { #name : #RMQExchangeFormat }

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateExchangeFormatSchema [
	^ exchangeFormatSchema
]

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateExchangeFormatSchema: anObject [
	exchangeFormatSchema := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateExchangeFormatType [
	^ exchangeFormatType
]

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateExchangeFormatType: anObject [
	exchangeFormatType := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
RMQExchangeFormat >> privateMessages: anObject [
	messages := anObject
]
