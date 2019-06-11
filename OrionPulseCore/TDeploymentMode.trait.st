Trait {
	#name : #TDeploymentMode,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TDeploymentMode classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TDeploymentMode >> components [
	^ self componentsOR: self currentContext
]

{ #category : #accessing }
TDeploymentMode >> componentsOR: aVersion [
	^ self privateComponents versionIn: aVersion
]
