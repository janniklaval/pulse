Class {
	#name : #PulseEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'#pulseName',
		'#sources => FMMany type: #PulseSource opposite: #entities'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseEntity class >> generatedSlotNames [
	<generated>
	'PulseEntity class>>#generatedSlotNames'.
	^ #(pulseName sources)
]

{ #category : #generator }
PulseEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseEntity class >> metamodel [

	<generated>
	^ (self class environment at: #PulseMetamodelGenerator) metamodel
]

{ #category : #meta }
PulseEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseEntity >> pulseName [

	<MSEProperty: #pulseName type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ pulseName
]

{ #category : #accessing }
PulseEntity >> pulseName: anObject [

	<generated>
	pulseName := anObject

]

{ #category : #accessing }
PulseEntity >> sources [

	<generated>
	<MSEComment: 'TODO'>
	^ sources
]

{ #category : #accessing }
PulseEntity >> sources: anObject [

	<generated>
	sources value: anObject

]
