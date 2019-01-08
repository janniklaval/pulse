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
	^  self new rmqState: #base64
]

{ #category : #accessing }
Encoding class >> string [
	^ self new rmqState: #string
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
