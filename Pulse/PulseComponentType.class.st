Class {
	#name : #PulseComponentType,
	#superclass : #PulseEnum,
	#instVars : [
		'#consumerComponents => FMMany type: #PulseConsumerComponent opposite: #componentType',
		'#publisherComponents => FMMany type: #PulsePublisherComponent opposite: #componentType'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseComponentType class >> annotation [

	<MSEClass: #ComponentType super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #'System-FileRegistry' }
PulseComponentType class >> connector [
	^ self new pulseState: #connector

]

{ #category : #'System-FileRegistry' }
PulseComponentType class >> database [
	^ self new pulseState: #database

]

{ #category : #generator }
PulseComponentType class >> generatedSlotNames [
	<generated>
	'PulseComponentType class>>#generatedSlotNames'.
	^ #(consumerComponents publisherComponents)
]

{ #category : #generator }
PulseComponentType class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'System-FileRegistry' }
PulseComponentType class >> mediator [
	^ self new pulseState: #mediator

]

{ #category : #'System-FileRegistry' }
PulseComponentType class >> module [
	^ self new pulseState: #module
]

{ #category : #meta }
PulseComponentType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'System-FileRegistry' }
PulseComponentType class >> service [
	^ self new pulseState: #service
]

{ #category : #accessing }
PulseComponentType >> consumerComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerComponents
]

{ #category : #accessing }
PulseComponentType >> consumerComponents: anObject [

	<generated>
	consumerComponents value: anObject

]

{ #category : #accessing }
PulseComponentType >> publisherComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponents
]

{ #category : #accessing }
PulseComponentType >> publisherComponents: anObject [

	<generated>
	publisherComponents value: anObject

]
