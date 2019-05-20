Trait {
	#name : #TComponentType,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TComponentType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TComponentType >> components [
	^ self componentsOR: self currentContext
]

{ #category : #accessing }
TComponentType >> componentsOR: aVersion [
	^ self privateComponents versionIn: aVersion
]
