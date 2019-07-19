Class {
	#name : #PulsePermission,
	#superclass : #PulseEntity,
	#instVars : [
		'#configureValue',
		'#creationDate',
		'#deletionDate',
		'#readValue',
		'#writeValue',
		'#user => FMOne type: #PulseUser opposite: #permissions',
		'#vhost => FMOne type: #PulseVHost opposite: #permissions'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulsePermission class >> annotation [

	<MSEClass: #Permission super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulsePermission class >> generatedSlotNames [
	<generated>
	'PulsePermission class>>#generatedSlotNames'.
	^ #(configureValue creationDate deletionDate readValue user vhost writeValue)
]

{ #category : #generator }
PulsePermission class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulsePermission class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulsePermission >> configureValue [

	<MSEProperty: #configureValue type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ configureValue
]

{ #category : #accessing }
PulsePermission >> configureValue: anObject [

	<generated>
	configureValue := anObject

]

{ #category : #accessing }
PulsePermission >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulsePermission >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulsePermission >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulsePermission >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulsePermission >> readValue [

	<MSEProperty: #readValue type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ readValue
]

{ #category : #accessing }
PulsePermission >> readValue: anObject [

	<generated>
	readValue := anObject

]

{ #category : #accessing }
PulsePermission >> user [

	<generated>
	<MSEComment: 'TODO'>
	^ user
]

{ #category : #accessing }
PulsePermission >> user: anObject [

	<generated>
	user := anObject

]

{ #category : #accessing }
PulsePermission >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulsePermission >> vhost: anObject [

	<generated>
	vhost := anObject

]

{ #category : #accessing }
PulsePermission >> writeValue [

	<MSEProperty: #writeValue type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ writeValue
]

{ #category : #accessing }
PulsePermission >> writeValue: anObject [

	<generated>
	writeValue := anObject

]
