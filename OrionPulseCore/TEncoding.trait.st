Trait {
	#name : #TEncoding,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TEncoding classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TEncoding >> payloads [
	^ self payloadsOR: self currentContext
]

{ #category : #accessing }
TEncoding >> payloadsOR: aVersion [
	^ self privatePayloads versionIn: aVersion
]
