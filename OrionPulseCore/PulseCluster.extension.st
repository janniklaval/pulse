Extension { #name : #PulseCluster }

{ #category : #'*OrionPulseCore' }
PulseCluster >> privateNodes [
	^ nodes
]

{ #category : #'*OrionPulseCore' }
PulseCluster >> privateNodes: anObject [
	nodes := anObject
]
