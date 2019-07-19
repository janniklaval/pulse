Class {
	#name : #PulseMessageType,
	#superclass : #PulseEnum,
	#instVars : [
		'#messages => FMMany type: #PulseMessage opposite: #messageType'
	],
	#category : #'Pulse-Entities'
}

{ #category : #'as yet unclassified' }
PulseMessageType class >> acknowledged [
	^self new pulseState: #acknowledged
]

{ #category : #meta }
PulseMessageType class >> annotation [

	<MSEClass: #MessageType super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #generator }
PulseMessageType class >> generatedSlotNames [
	<generated>
	'PulseMessageType class>>#generatedSlotNames'.
	^ #(messages)
]

{ #category : #generator }
PulseMessageType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'as yet unclassified' }
PulseMessageType class >> published [
	^ self new pulseState: #published
]

{ #category : #'as yet unclassified' }
PulseMessageType class >> ready [
	^ self new pulseState: #ready
]

{ #category : #accessing }
PulseMessageType class >> received [
	^ self new pulseState: #received
]

{ #category : #accessing }
PulseMessageType class >> redelivered [
	^ self new pulseState: #redelivered
]

{ #category : #meta }
PulseMessageType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
PulseMessageType class >> unacknowledged [
	^ self new pulseState: #unacknowledged
]

{ #category : #accessing }
PulseMessageType >> messages [

	<generated>
	<MSEComment: 'TODO'>
	^ messages
]

{ #category : #accessing }
PulseMessageType >> messages: anObject [

	<generated>
	messages value: anObject

]
