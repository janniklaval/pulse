Trait {
	#name : #TAuthMechanism,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TAuthMechanism classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TAuthMechanism >> connections [
	^ self connectionsOR: self currentContext
]

{ #category : #accessing }
TAuthMechanism >> connectionsOR: aVersion [
	^ self privateConnections versionIn: aVersion
]
