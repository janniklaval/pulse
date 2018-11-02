Class {
	#name : #RMQNode,
	#superclass : #MooseEntity,
	#instVars : [
		'nodeString',
		'type',
		'running',
		'cluster',
		'vhosts'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQNode >> cluster [
	<MSEProperty: #cluster type: #RMQCluster opposite:#nodes>
	^ cluster
]

{ #category : #accessing }
RMQNode >> cluster: anObject [
	cluster := anObject
]

{ #category : #initialization }
RMQNode >> initialize [

	super initialize.
	vhosts := OrderedCollection new.
]

{ #category : #accessing }
RMQNode >> name [
	<MSEProperty: #name type: #String>
	^ self nodeString
]

{ #category : #accessing }
RMQNode >> nodeString [
	<MSEProperty: #nodeString type: #String>
	^ nodeString
]

{ #category : #accessing }
RMQNode >> nodeString: anObject [
	nodeString := anObject
]

{ #category : #accessing }
RMQNode >> running [
	<MSEProperty: #running type: #Boolean>
	^ running
]

{ #category : #accessing }
RMQNode >> running: anObject [
	running := anObject
]

{ #category : #accessing }
RMQNode >> type [
	<MSEProperty: #type type: #NodeType opposite:#nodes>
	^ type
]

{ #category : #accessing }
RMQNode >> type: anObject [
	type := anObject
]

{ #category : #accessing }
RMQNode >> vhosts [
	<MSEProperty: #vhosts type: #RMQVHost opposite:#node>
	<multivalued>
	^ vhosts
]

{ #category : #accessing }
RMQNode >> vhosts: anObject [
	vhosts := anObject
]
