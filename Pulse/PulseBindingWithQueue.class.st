Class {
	#name : #PulseBindingWithQueue,
	#superclass : #PulseBinding,
	#instVars : [
		'#destination => FMOne type: #PulseQueue opposite: #destinationBindings'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseBindingWithQueue class >> annotation [

	<MSEClass: #BindingWithQueue super: #PulseBinding>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseBindingWithQueue class >> generatedSlotNames [
	<generated>
	'PulseBindingWithQueue class>>#generatedSlotNames'.
	^ #(destination)
]

{ #category : #generator }
PulseBindingWithQueue class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseBindingWithQueue class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseBindingWithQueue >> destination [

	<generated>
	<MSEComment: 'TODO'>
	^ destination
]

{ #category : #accessing }
PulseBindingWithQueue >> destination: anObject [

	<generated>
	destination := anObject

]
