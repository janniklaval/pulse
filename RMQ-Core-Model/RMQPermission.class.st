Class {
	#name : #RMQPermission,
	#superclass : #MooseEntity,
	#instVars : [
		'type',
		'value',
		'users',
		'attachedVHost',
		'creationDate',
		'deletionDate'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQPermission >> attachedVHost [
	<MSEProperty: #attachedVHost type: #RMQVHost opposite:#attachedPermissions>
	<multivalued>
	^ attachedVHost
]

{ #category : #accessing }
RMQPermission >> attachedVHost: anObject [
	attachedVHost := anObject
]

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
RMQPermission >> type [
	<MSEProperty: #type type: #PermissionType opposite:#permissions>
	^ type
]

{ #category : #accessing }
RMQPermission >> type: anObject [
	type := anObject
]

{ #category : #accessing }
RMQPermission >> users [
	<MSEProperty: #users type: #RMQUser opposite:#permissions>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQPermission >> users: anObject [
	users := anObject
]

{ #category : #accessing }
RMQPermission >> value1 [
	<MSEProperty: #value type: #String>
	^ value
]

{ #category : #accessing }
RMQPermission >> value: anObject [
	value := anObject
]
