Trait {
	#name : #TExchangeType,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TExchangeType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TExchangeType >> exchanges [
	^ self exchangesOR: self currentContext
]

{ #category : #accessing }
TExchangeType >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion
]
