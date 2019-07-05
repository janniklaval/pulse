Class {
	#name : #PulseAuthMechanism,
	#superclass : #PulseEnum,
	#instVars : [
		'#connections => FMMany type: #PulseConnection opposite: #authMechanism'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseAuthMechanism class >> amqPlain [
	^  self new pulseState: #amqPlain
]

{ #category : #meta }
PulseAuthMechanism class >> annotation [

	<MSEClass: #AuthMechanism super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #meta }
PulseAuthMechanism class >> plain [
	^ self new pulseState: #plain
]

{ #category : #meta }
PulseAuthMechanism class >> rabbit_cr_demo [
		^ self new pulseState: #rabbit_cr_demo
]

{ #category : #meta }
PulseAuthMechanism class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseAuthMechanism >> connections [

	<generated>
	<MSEComment: 'TODO'>
	^ connections
]

{ #category : #accessing }
PulseAuthMechanism >> connections: anObject [

	<generated>
	connections value: anObject

]
