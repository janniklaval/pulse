Class {
	#name : #PulseTransportPolitic,
	#superclass : #PulseEnum,
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseTransportPolitic class >> annotation [

	<MSEClass: #TransportPolitic super: #PulseEnum>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
PulseTransportPolitic class >> asynchronous [
		^ self new pulseState: #asynchronous
]

{ #category : #accessing }
PulseTransportPolitic class >> callback [
	^ self new pulseState: #callback
]

{ #category : #generator }
PulseTransportPolitic class >> generatedSlotNames [
	<generated>
	'PulseTransportPolitic class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
PulseTransportPolitic class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseTransportPolitic class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
PulseTransportPolitic class >> synchronous [
	^ self new pulseState: #synchronous
]
