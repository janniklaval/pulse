Trait {
	#name : #TMessageType,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TMessageType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TMessageType >> messages [
	^ self messagesOR: self currentContext
]

{ #category : #accessing }
TMessageType >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion
]

{ #category : #accessing }
TMessageType >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TMessageType >> nameOR: aVersion [
	^ self privateName versionIn: aVersion
]
