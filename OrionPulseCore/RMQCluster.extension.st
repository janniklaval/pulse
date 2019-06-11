Extension { #name : #RMQCluster }

{ #category : #'*OrionPulseCore' }
RMQCluster >> privateNodes [
	^ nodes
]

{ #category : #'*OrionPulseCore' }
RMQCluster >> privateNodes: anObject [
	nodes := anObject
]
