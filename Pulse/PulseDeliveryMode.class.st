Class {
	#name : #PulseDeliveryMode,
	#superclass : #PulseEnum,
	#instVars : [
		'#messages => FMMany type: #PulseMessage opposite: #deliveryMode'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseDeliveryMode class >> annotation [

	<MSEClass: #DeliveryMode super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #generator }
PulseDeliveryMode class >> generatedSlotNames [
	<generated>
	'PulseDeliveryMode class>>#generatedSlotNames'.
	^ #(messages)
]

{ #category : #generator }
PulseDeliveryMode class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'as yet unclassified' }
PulseDeliveryMode class >> nonPersistent [
	^ self new pulseState: #nonPersistent

]

{ #category : #'as yet unclassified' }
PulseDeliveryMode class >> persistent [
	^ self new pulseState: #persistent
]

{ #category : #meta }
PulseDeliveryMode class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseDeliveryMode >> messages [

	<generated>
	<MSEComment: 'TODO'>
	^ messages
]

{ #category : #accessing }
PulseDeliveryMode >> messages: anObject [

	<generated>
	messages value: anObject

]
