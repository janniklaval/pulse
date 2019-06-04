Class {
	#name : #PulseSource,
	#superclass : #PulseEntity,
	#instVars : [
		'#entities => FMMany type: #PulseEntity opposite: #sources',
		'#path'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseSource class >> annotation [

	<MSEClass: #Source super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseSource class >> generatedSlotNames [
	<generated>
	'PulseSource class>>#generatedSlotNames'.
	^ #(entities path)
]

{ #category : #generator }
PulseSource class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseSource class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseSource >> entities [

	<generated>
	<MSEComment: 'TODO'>
	^ entities
]

{ #category : #accessing }
PulseSource >> entities: anObject [

	<generated>
	entities value: anObject

]

{ #category : #accessing }
PulseSource >> path [

	<MSEProperty: #path type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ path
]

{ #category : #accessing }
PulseSource >> path: anObject [

	<generated>
	path := anObject

]

{ #category : #accessing }
PulseSource >> pulseName [

	^ self path
]