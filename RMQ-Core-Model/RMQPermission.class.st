Class {
	#name : #RMQPermission,
	#superclass : #MooseEntity,
	#instVars : [
		'type',
		'value',
		'user',
		'creationDate',
		'deletionDate',
		'vhost'
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
RMQPermission >> name [
	<MSEProperty: #name type: #String>
	^ attachedVHost mooseName, '.', user mooseName, '>', type mooseName
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
RMQPermission >> value1 [
	<MSEProperty: #value type: #String>
	^ value
]

{ #category : #accessing }
RMQPermission >> value: anObject [
	value := anObject
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
