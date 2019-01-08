Class {
	#name : #RMQAuthentification,
	#superclass : #PulseEntity,
	#instVars : [
		'success',
		'timestamp',
		'user',
		'failureError'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQAuthentification >> failureError [
	<MSEProperty: #failureError type: #Number>
	^ failureError
]

{ #category : #accessing }
RMQAuthentification >> failureError: anObject [
	failureError := anObject
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
	<MSEProperty: #user type: #RMQUser opposite: #authentifications>
	^ user
]

{ #category : #accessing }
RMQAuthentification >> user: anObject [
	user := anObject
]
