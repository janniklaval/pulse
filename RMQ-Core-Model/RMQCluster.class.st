Class {
	#name : #RMQCluster,
	#superclass : #PulseEntity,
	#instVars : [
		'nodes'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQCluster >> nodes [
	<MSEProperty: #nodes type: #RMQNode opposite:#cluster>
	<multivalued>
	^ nodes
]

{ #category : #accessing }
RMQCluster >> nodes: anObject [
	nodes := anObject
]
