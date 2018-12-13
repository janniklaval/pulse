Class {
	#name : #RMQPermission,
	#superclass : #PulseEntity,
	#instVars : [
		'type',
		'user',
		'creationDate',
		'deletionDate',
		'vhost',
		'rmqValue'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQPermission >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQPermission >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQPermission >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQPermission >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQPermission >> rmqValue [
	<MSEProperty: #value type: #String>
	^ rmqValue
]

{ #category : #accessing }
RMQPermission >> rmqValue: anObject [
	rmqValue := anObject
]

{ #category : #accessing }
RMQPermission >> type [
	<MSEProperty: #type type: #PermissionType opposite:#permissions>
	^ type
]

{ #category : #accessing }
RMQPermission >> type: anObject [
	type := anObject
]

{ #category : #accessing }
RMQPermission >> user [
	<MSEProperty: #user type: #RMQUser opposite:#permissions>
	^ user
]

{ #category : #accessing }
RMQPermission >> user: anObject [
	user := anObject
]

{ #category : #accessing }
RMQPermission >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#permissions>
	^ vhost
]

{ #category : #accessing }
RMQPermission >> vhost: anObject [
	vhost := anObject
]
