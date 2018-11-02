Class {
	#name : #RMQCluster,
	#superclass : #MooseEntity,
	#instVars : [
		'nodes'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQCluster >> name [
<MSEProperty: #name type: #String>
	^'Cluster ', self name asString 
]

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
