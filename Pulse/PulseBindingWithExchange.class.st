Class {
	#name : #PulseBindingWithExchange,
	#superclass : #PulseBinding,
	#instVars : [
		'#destination => FMOne type: #PulseExchange opposite: #destinationBindings'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseBindingWithExchange class >> annotation [

	<MSEClass: #BindingWithExchange super: #PulseBinding>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseBindingWithExchange class >> generatedSlotNames [
	<generated>
	'PulseBindingWithExchange class>>#generatedSlotNames'.
	^ #(destination)
]

{ #category : #generator }
PulseBindingWithExchange class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseBindingWithExchange class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseBindingWithExchange >> destination [

	<generated>
	<MSEComment: 'TODO'>
	^ destination
]

{ #category : #accessing }
PulseBindingWithExchange >> destination: anObject [

	<generated>
	destination := anObject

]
