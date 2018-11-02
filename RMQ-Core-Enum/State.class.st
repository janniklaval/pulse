Class {
	#name : #State,
	#superclass : #Type,
	#instVars : [
		'queues',
		'channels',
		'connections'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
State class >> idle [
	^ self new state: #idle
]

{ #category : #'as yet unclassified' }
State class >> other [
	^ self new state: #other
]

{ #category : #accessing }
State class >> running [
	^ self new state: #running
]

{ #category : #accessing }
State >> channels [
	<MSEProperty: #channels type: #RMQChannel opposite:#rmqState>
	<multivalued>
	^ channels
]

{ #category : #accessing }
State >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
State >> connections [
	<MSEProperty: #connections type: #RMQConnection opposite:#rmqState>
	<multivalued>
	^ connections
]

{ #category : #accessing }
State >> connections: anObject [
	connections := anObject
]

{ #category : #accessing }
State >> queues [
	<MSEProperty: #queues type: #RMQQueue opposite:#rmqState>
	<multivalued>
	^ queues
]

{ #category : #accessing }
State >> queues: anObject [
	queues := anObject
]
