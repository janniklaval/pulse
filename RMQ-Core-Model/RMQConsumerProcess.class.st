Class {
	#name : #RMQConsumerProcess,
	#superclass : #PulseEntity,
	#instVars : [
		'rmqState',
		'subscribedChannels',
		'consumerTag',
		'exclusive',
		'ackRequired',
		'deletionDate',
		'creationDate',
		'consumerComponent'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQConsumerProcess >> ackRequired [
	<MSEProperty: #ackRequired type: #Boolean>
	^ ackRequired
]

{ #category : #accessing }
RMQConsumerProcess >> ackRequired: anObject [
	ackRequired := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> consumerComponent [
	<MSEProperty: #consumerComponent type: #RMQConsumerComponent opposite:#consumerProcesses>
	^ consumerComponent
]

{ #category : #accessing }
RMQConsumerProcess >> consumerComponent: anObject [
	consumerComponent := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> consumerTag [
	<MSEProperty: #consumerTag type: #String>
	^ consumerTag
]

{ #category : #accessing }
RMQConsumerProcess >> consumerTag: anObject [
	consumerTag := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQConsumerProcess >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQConsumerProcess >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> exclusive [
	<MSEProperty: #exclusive type: #Boolean>
	^ exclusive
]

{ #category : #accessing }
RMQConsumerProcess >> exclusive: anObject [
	exclusive := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> guid [
	<MSEProperty: #guid type: #String>
	^ self pulseName
]

{ #category : #accessing }
RMQConsumerProcess >> guid: anObject [
	self pulseName: anObject
]

{ #category : #accessing }
RMQConsumerProcess >> initialize [

	super initialize.
	subscribedChannels := Set new.

]

{ #category : #accessing }
RMQConsumerProcess >> pulseName [
	<MSEProperty: #pulseName type: #String>
	^ consumerTag
]

{ #category : #accessing }
RMQConsumerProcess >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> rmqState [
	<MSEProperty: #rmqState type: #String>
	^ rmqState
]

{ #category : #accessing }
RMQConsumerProcess >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQConsumerProcess >> subscribedChannels [
	<MSEProperty: #subscribedChannels type: #RMQChannel opposite:#consumerProcess>
	<multivalued>
	^ subscribedChannels
]

{ #category : #accessing }
RMQConsumerProcess >> subscribedChannels: anObject [
	subscribedChannels := anObject
]
