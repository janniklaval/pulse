Class {
	#name : #State,
	#superclass : #PulseEnum,
	#instVars : [
		'queues',
		'channels',
		'connections'
	],
	#category : #'RMQ-Core-Model'
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
	channels := Set new.
	connections := Set new.
	queues := Set new.
	
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
