Class {
	#name : #PulseEnum,
	#superclass : #PulseEntity,
	#instVars : [
		'pulseState'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseEnum class >> annotation [

	<MSEClass: #Enum super: #PulseEntity>
	<package: #Pulse>
	^self
]

{ #category : #generator }
PulseEnum class >> generatedSlotNames [
	<generated>
	'PulseEnum class>>#generatedSlotNames'.
	^ #(pulseState)
]

{ #category : #generator }
PulseEnum class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseEnum class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseEnum >> pulseName [

	^ pulseState
]

{ #category : #accessing }
PulseEnum >> pulseState [

	<MSEProperty: #pulseState type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseEnum >> pulseState: anObject [

	<generated>
	pulseState := anObject

]
