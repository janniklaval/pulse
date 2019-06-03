Class {
	#name : #PulseGuaranteeMode,
	#superclass : #PulseEnum,
	#instVars : [
		'#channels => FMMany type: #PulseChannel opposite: #guaranteeMode'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseGuaranteeMode class >> annotation [

	<MSEClass: #GuaranteeMode super: #PulseEnum>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
PulseGuaranteeMode class >> confirm [
	^ self new rmqState: #confirm
]

{ #category : #generator }
PulseGuaranteeMode class >> generatedSlotNames [
	<generated>
	'PulseGuaranteeMode class>>#generatedSlotNames'.
	^ #(channels)
]

{ #category : #generator }
PulseGuaranteeMode class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'instance creation' }
PulseGuaranteeMode class >> none [
	^ self new rmqState: #none
]

{ #category : #meta }
PulseGuaranteeMode class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
PulseGuaranteeMode class >> transactional [
	^ self new rmqState: #transactional
]

{ #category : #accessing }
PulseGuaranteeMode >> channels [

	<generated>
	<MSEComment: 'TODO'>
	^ channels
]

{ #category : #accessing }
PulseGuaranteeMode >> channels: anObject [

	<generated>
	channels value: anObject

]
