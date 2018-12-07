Class {
	#name : #RMQAuthentification,
	#superclass : #PulseEntity,
	#instVars : [
		'authentificationString',
		'success',
		'timestamp',
		'user'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQAuthentification >> authentificationString [
	<MSEProperty: #authentification type: #String>
	^ authentificationString
]

{ #category : #accessing }
RMQAuthentification >> authentificationString: anObject [
	authentificationString := anObject
]

{ #category : #accessing }
RMQAuthentification >> success [
	<MSEProperty: #success type: #Boolean>
	^ success
]

{ #category : #accessing }
RMQAuthentification >> success: anObject [
	success := anObject
]

{ #category : #accessing }
RMQAuthentification >> timestamp [
	<MSEProperty: #timestamp type: #Number>
	^ timestamp
]

{ #category : #accessing }
RMQAuthentification >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
RMQAuthentification >> user [
	<MSEProperty: #user type: #RMQUser opposite: #authentification>
	^ user
]

{ #category : #accessing }
RMQAuthentification >> user: anObject [
	user := anObject
]
