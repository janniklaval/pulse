Class {
	#name : #Encoding,
	#superclass : #PulseEnum,
	#instVars : [
		'payloads'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
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
