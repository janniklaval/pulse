Class {
	#name : #RMQBinding,
	#superclass : #PulseEntity,
	#instVars : [
		'vhost',
		'source',
		'creationDate',
		'deletionDate',
		'routingKey',
		'destination'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQBinding >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQBinding >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQBinding >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQBinding >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQBinding >> destination: anObject [
	destination := anObject
]

{ #category : #initialization }
RMQBinding >> initialize [
	
	super initialize.
]

{ #category : #accessing }
RMQBinding >> pulseName [

	pulseName ifNil: [ 
		(self source isNil or: [ self destination isNil ]) ifFalse: [ self pulseName: (self source name, '>', self destination name) ]  ].
	^ pulseName
]

{ #category : #accessing }
RMQBinding >> routingKey [
	<MSEProperty: #routingKey type: #RMQRoutingKey opposite:#binding>
	<multivalued>
	^ routingKey
]

{ #category : #accessing }
RMQBinding >> routingKey: anObject [
	routingKey := anObject
]

{ #category : #accessing }
RMQBinding >> source [
<MSEProperty: #source type: #RMQExchange opposite:#sourceBindings>
	^ source
]

{ #category : #accessing }
RMQBinding >> source: anObject [
	source := anObject
]

{ #category : #accessing }
RMQBinding >> vhost [

	<MSEProperty: #vhost type: #RMQVHost opposite:#bindings>
	^ vhost
]

{ #category : #accessing }
RMQBinding >> vhost: anObject [
	vhost := anObject
]
