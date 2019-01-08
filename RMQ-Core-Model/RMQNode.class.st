Class {
	#name : #RMQNode,
	#superclass : #PulseEntity,
	#instVars : [
		'type',
		'running',
		'cluster',
		'vhosts',
		'host',
		'port',
		'creationDate',
		'deletionDate'
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

{ #category : #accessing }
RMQNode >> creationDate [
	^ creationDate
]

{ #category : #accessing }
RMQNode >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQNode >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
RMQNode >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQNode >> host [
	^ host
]

{ #category : #accessing }
RMQNode >> host: anObject [
	host := anObject
]

{ #category : #initialization }
RMQNode >> initialize [

	super initialize.
	vhosts := Set new.
]

{ #category : #accessing }
RMQNode >> port [
	^ port
]

{ #category : #accessing }
RMQNode >> port: anObject [
	port := anObject
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
	type := self selectEnum: anObject. 
	type nodes add: self.
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
