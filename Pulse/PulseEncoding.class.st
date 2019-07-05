Class {
	#name : #PulseEncoding,
	#superclass : #PulseEnum,
	#instVars : [
		'#payloads => FMMany type: #PulsePayload opposite: #encoding'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseEncoding class >> annotation [

	<MSEClass: #Encoding super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #accessing }
PulseEncoding class >> base64 [
	^  self new pulseState: #base64
]

{ #category : #meta }
PulseEncoding class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseEncoding class >> string [
	^ self new pulseState: #string
]

{ #category : #accessing }
PulseEncoding >> payloads [

	<generated>
	<MSEComment: 'TODO'>
	^ payloads
]

{ #category : #accessing }
PulseEncoding >> payloads: anObject [

	<generated>
	payloads value: anObject

]
