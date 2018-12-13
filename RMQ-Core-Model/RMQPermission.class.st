Class {
	#name : #RMQPermission,
	#superclass : #PulseEntity,
	#instVars : [
		'configureValue',
		'writeValue',
		'readValue',
		'user',
		'vhost',
		'creationDate',
		'deletionDate'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQPermission >> configureValue [
	^ configureValue
]

{ #category : #accessing }
RMQPermission >> configureValue: anObject [
	configureValue := anObject
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
RMQPermission >> name [
	<MSEProperty: #name type: #String>
	^ vhost mooseName, '.', user mooseName, '>', configureValue mooseName, '_', writeValue mooseName, '_', readValue mooseName
]

{ #category : #accessing }
RMQPermission >> readValue [
	^ readValue
]

{ #category : #accessing }
RMQPermission >> readValue: anObject [
	readValue := anObject
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

{ #category : #accessing }
RMQPermission >> writeValue [
	^ writeValue
]

{ #category : #accessing }
RMQPermission >> writeValue: anObject [
	writeValue := anObject
]
