Class {
	#name : #PulseTag,
	#superclass : #PulseEnum,
	#instVars : [
		'#roles => FMMany type: #PulseRole opposite: #tag'
	],
	#category : #'Pulse-Entities'
}

{ #category : #'as yet unclassified' }
PulseTag class >> administrator [
	^self new pulseState: #administrator
]

{ #category : #meta }
PulseTag class >> annotation [

	<MSEClass: #Tag super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #generator }
PulseTag class >> generatedSlotNames [
	<generated>
	'PulseTag class>>#generatedSlotNames'.
	^ #(roles)
]

{ #category : #generator }
PulseTag class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'as yet unclassified' }
PulseTag class >> management [
	^ self new pulseState: #management
]

{ #category : #'as yet unclassified' }
PulseTag class >> monitoring [
	^ self new pulseState: #monitoring
]

{ #category : #'instance creation' }
PulseTag class >> none [
	^ self new pulseState: #none
]

{ #category : #'as yet unclassified' }
PulseTag class >> policymaker [
	^ self new pulseState: #policymaker
]

{ #category : #meta }
PulseTag class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseTag >> roles [

	<generated>
	<MSEComment: 'TODO'>
	^ roles
]

{ #category : #accessing }
PulseTag >> roles: anObject [

	<generated>
	roles value: anObject

]
