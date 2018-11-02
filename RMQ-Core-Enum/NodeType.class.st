Class {
	#name : #NodeType,
	#superclass : #Type,
	#instVars : [
		'nodes'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
NodeType class >> disc [
	^ self new state: #disc
]

{ #category : #'as yet unclassified' }
NodeType class >> ram [
	^ self new state: #ram
]

{ #category : #accessing }
NodeType >> nodes [
	<MSEProperty: #nodes type: #RMQNode opposite:#type>
	<multivalued>
	^ nodes
]

{ #category : #accessing }
NodeType >> nodes: anObject [
	nodes := anObject
]
