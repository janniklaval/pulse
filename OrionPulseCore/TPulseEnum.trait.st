Trait {
	#name : #TPulseEnum,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TPulseEnum classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TPulseEnum >> pulseName [
	^ self pulseNameOR: self currentContext
]

{ #category : #accessing }
TPulseEnum >> pulseNameOR: aVersion [
	^ self privatePulseName versionIn: aVersion
]

{ #category : #accessing }
TPulseEnum >> rmqState [
	^ self rmqStateOR: self currentContext
]

{ #category : #accessing }
TPulseEnum >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion
]
