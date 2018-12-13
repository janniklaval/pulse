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

{ #category : #accessing }
State class >> idle [
	^ self new rmqState: #idle
]

{ #category : #accessing }
State class >> other [
	^ self new rmqState: #other
]

{ #category : #accessing }
State class >> running [
	^ self new rmqState: #running
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
State >> initialize [

	super initialize.
	channels := OrderedCollection new.
	connections := OrderedCollection new.
	queues := OrderedCollection new.
	
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
