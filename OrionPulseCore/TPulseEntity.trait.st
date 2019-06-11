Trait {
	#name : #TPulseEntity,
	#traits : 'TMooseEntity',
	#classTraits : 'TMooseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TPulseEntity classSide >> isOrionClass [
	^ true
]

{ #category : #testing }
TPulseEntity >> pulseName [
	^ self pulseNameOR: self currentContext
]

{ #category : #testing }
TPulseEntity >> pulseNameOR: aVersion [
	^ self privatePulseName versionIn: aVersion
]
