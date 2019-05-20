Trait {
	#name : #TDeliveryMode,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TDeliveryMode classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TDeliveryMode >> messages [
	^ self messagesOR: self currentContext
]

{ #category : #accessing }
TDeliveryMode >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion
]
