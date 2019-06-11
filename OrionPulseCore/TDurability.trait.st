Trait {
	#name : #TDurability,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TDurability classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TDurability >> exchanges [
	^ self exchangesOR: self currentContext
]

{ #category : #accessing }
TDurability >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion
]

{ #category : #accessing }
TDurability >> queues [
	^ self queuesOR: self currentContext
]

{ #category : #accessing }
TDurability >> queuesOR: aVersion [
	^ self privateQueues versionIn: aVersion
]
