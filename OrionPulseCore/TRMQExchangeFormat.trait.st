Trait {
	#name : #TRMQExchangeFormat,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQExchangeFormat classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQExchangeFormat >> exchangeFormatSchema [
	^ self exchangeFormatSchemaOR: self currentContext 
]

{ #category : #accessing }
TRMQExchangeFormat >> exchangeFormatSchemaOR: aVersion [
	^ self privateExchangeFormatSchema versionIn: aVersion
]

{ #category : #accessing }
TRMQExchangeFormat >> exchangeFormatType [
	^ self exchangeFormatTypeOR: self currentContext 
]

{ #category : #accessing }
TRMQExchangeFormat >> exchangeFormatTypeOR: aVersion [
	^ self privateExchangeFormatType versionIn: aVersion
]

{ #category : #accessing }
TRMQExchangeFormat >> messages [
	^ self messagesOR: self currentContext 
]

{ #category : #accessing }
TRMQExchangeFormat >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion 
]
