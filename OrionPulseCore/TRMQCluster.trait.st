Trait {
	#name : #TRMQCluster,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQCluster classSide >> isOrionClass [
	^ true
]

{ #category : #testing }
TRMQCluster >> nodes [
	^ self nodesOR: self currentContext
		
]

{ #category : #testing }
TRMQCluster >> nodesOR: aVersion [
	^ self privateNodes versionIn: aVersion
]
