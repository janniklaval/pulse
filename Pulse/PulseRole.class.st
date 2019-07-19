Class {
	#name : #PulseRole,
	#superclass : #PulseEntity,
	#instVars : [
		'#settingDate',
		'#tag => FMOne type: #PulseTag opposite: #roles',
		'#users => FMMany type: #PulseUser opposite: #roles'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseRole class >> annotation [

	<MSEClass: #Role super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseRole class >> generatedSlotNames [
	<generated>
	'PulseRole class>>#generatedSlotNames'.
	^ #(settingDate tag users)
]

{ #category : #generator }
PulseRole class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseRole class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseRole >> settingDate [

	<MSEProperty: #settingDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ settingDate
]

{ #category : #accessing }
PulseRole >> settingDate: anObject [

	<generated>
	settingDate := anObject

]

{ #category : #accessing }
PulseRole >> tag [

	<generated>
	<MSEComment: 'TODO'>
	^ tag
]

{ #category : #accessing }
PulseRole >> tag: anObject [

	<generated>
	tag := anObject

]

{ #category : #accessing }
PulseRole >> users [

	<generated>
	<MSEComment: 'TODO'>
	^ users
]

{ #category : #accessing }
PulseRole >> users: anObject [

	<generated>
	users value: anObject

]
