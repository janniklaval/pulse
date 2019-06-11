Trait {
	#name : #TNodeType,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TNodeType classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TNodeType >> nodes [
	^ self nodesOR: self currentContext
]

{ #category : #accessing }
TNodeType >> nodesOR: aVersion [
	^ self privateNodes versionIn: aVersion
]
