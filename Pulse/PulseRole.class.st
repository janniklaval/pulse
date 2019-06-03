Class {
	#name : #PulseRole,
	#superclass : #PulseEntity,
	#instVars : [
		'#settingDate',
		'#tag => FMOne type: #PulseTag opposite: #roles',
		'#user => FMOne type: #PulseUser opposite: #roles'
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
	^ #(settingDate tag user)
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
PulseRole >> user [

	<generated>
	<MSEComment: 'TODO'>
	^ user
]

{ #category : #accessing }
PulseRole >> user: anObject [

	<generated>
	user := anObject

]
