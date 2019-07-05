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
	^self
]

{ #category : #'as yet unclassified' }
PulseGuaranteeMode class >> confirm [
	^ self new pulseState: #confirm
]

{ #category : #'instance creation' }
PulseGuaranteeMode class >> none [
	^ self new pulseState: #none
]

{ #category : #meta }
PulseGuaranteeMode class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
PulseGuaranteeMode class >> transactional [
	^ self new pulseState: #transactional
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
