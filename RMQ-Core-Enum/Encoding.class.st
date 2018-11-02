Class {
	#name : #Encoding,
	#superclass : #Type,
	#instVars : [
		'payloads'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
Encoding class >> base64 [
	^ self new state: #base64
]

{ #category : #accessing }
Encoding class >> string [
	^ self new state: #string
]

{ #category : #accessing }
Encoding >> payloads [
	<MSEProperty: #payloads type: #RMQPayload opposite:#encoding>
	<multivalued>
	^ payloads
]

{ #category : #accessing }
Encoding >> payloads: anObject [
	payloads := anObject
]
