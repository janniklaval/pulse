Class {
	#name : #PulseAuthentification,
	#superclass : #PulseEntity,
	#instVars : [
		'#failureError => FMProperty',
		'#success => FMProperty',
		'#timestamp => FMProperty',
		'#user => FMOne type: #PulseUser opposite: #authentifications'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseAuthentification class >> annotation [

	<MSEClass: #Authentification super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #meta }
PulseAuthentification class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseAuthentification >> failureError [

	<MSEProperty: #failureError type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ failureError
]

{ #category : #accessing }
PulseAuthentification >> failureError: anObject [

	<generated>
	failureError := anObject

]

{ #category : #accessing }
PulseAuthentification >> success [

	<MSEProperty: #success type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ success
]

{ #category : #accessing }
PulseAuthentification >> success: anObject [

	<generated>
	success := anObject

]

{ #category : #accessing }
PulseAuthentification >> timestamp [

	<MSEProperty: #timestamp type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ timestamp
]

{ #category : #accessing }
PulseAuthentification >> timestamp: anObject [

	<generated>
	timestamp := anObject

]

{ #category : #accessing }
PulseAuthentification >> user [

	<generated>
	<MSEComment: 'TODO'>
	^ user
]

{ #category : #accessing }
PulseAuthentification >> user: anObject [

	<generated>
	user := anObject

]
