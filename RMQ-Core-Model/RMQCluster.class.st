Class {
	#name : #RMQCluster,
	#superclass : #MooseEntity,
	#instVars : [
		'nodes',
		'clusterString'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQCluster >> clusterString [
	<MSEProperty: #clusterString type: #String>
	^ clusterString
]

{ #category : #accessing }
RMQCluster >> clusterString: anObject [
	clusterString := anObject
]

{ #category : #accessing }
RMQCluster >> name [
	<MSEProperty: #name type: #String>
	^ self clusterString
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
