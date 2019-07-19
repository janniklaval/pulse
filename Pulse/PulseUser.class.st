Class {
	#name : #PulseUser,
	#superclass : #PulseEntity,
	#instVars : [
		'#creationDate',
		'#deletionDate',
		'#hashingAlgorithm',
		'#password',
		'#passwordChangingDate',
		'#passwordClearingDate',
		'#passwordHash',
		'#authentifications => FMMany type: #PulseAuthentification opposite: #user',
		'#usedChannels => FMMany type: #PulseChannel opposite: #user',
		'#initializedChannels => FMMany type: #PulseChannel opposite: #user_who_performed_connection',
		'#usedConnections => FMMany type: #PulseConnection opposite: #user',
		'#initializedConnections => FMMany type: #PulseConnection opposite: #user_who_performed_connection',
		'#initializedExchanges => FMMany type: #PulseExchange opposite: #user_who_performed_action',
		'#permissions => FMMany type: #PulsePermission opposite: #user',
		'#roles => FMMany type: #PulseRole opposite: #users',
		'#vhosts => FMMany type: #PulseVHost opposite: #users'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseUser class >> annotation [

	<MSEClass: #User super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseUser class >> generatedSlotNames [
	<generated>
	'PulseUser class>>#generatedSlotNames'.
	^ #(authentifications creationDate deletionDate hashingAlgorithm initializedChannels initializedConnections initializedExchanges password passwordChangingDate passwordClearingDate passwordHash permissions roles usedChannels usedConnections vhosts)
]

{ #category : #generator }
PulseUser class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseUser class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseUser >> authentifications [

	<generated>
	<MSEComment: 'TODO'>
	^ authentifications
]

{ #category : #accessing }
PulseUser >> authentifications: anObject [

	<generated>
	authentifications value: anObject

]

{ #category : #accessing }
PulseUser >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseUser >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseUser >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseUser >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseUser >> hashingAlgorithm [

	<MSEProperty: #hashingAlgorithm type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ hashingAlgorithm
]

{ #category : #accessing }
PulseUser >> hashingAlgorithm: anObject [

	<generated>
	hashingAlgorithm := anObject

]

{ #category : #accessing }
PulseUser >> initializedChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ initializedChannels
]

{ #category : #accessing }
PulseUser >> initializedChannels: anObject [

	<generated>
	initializedChannels value: anObject

]

{ #category : #accessing }
PulseUser >> initializedConnections [

	<generated>
	<MSEComment: 'TODO'>
	^ initializedConnections
]

{ #category : #accessing }
PulseUser >> initializedConnections: anObject [

	<generated>
	initializedConnections value: anObject

]

{ #category : #accessing }
PulseUser >> initializedExchanges [

	<generated>
	<MSEComment: 'TODO'>
	^ initializedExchanges
]

{ #category : #accessing }
PulseUser >> initializedExchanges: anObject [

	<generated>
	initializedExchanges value: anObject

]

{ #category : #accessing }
PulseUser >> password [

	<MSEProperty: #password type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ password
]

{ #category : #accessing }
PulseUser >> password: anObject [

	<generated>
	password := anObject

]

{ #category : #accessing }
PulseUser >> passwordChangingDate [

	<MSEProperty: #passwordChangingDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ passwordChangingDate
]

{ #category : #accessing }
PulseUser >> passwordChangingDate: anObject [

	<generated>
	passwordChangingDate := anObject

]

{ #category : #accessing }
PulseUser >> passwordClearingDate [

	<MSEProperty: #passwordClearingDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ passwordClearingDate
]

{ #category : #accessing }
PulseUser >> passwordClearingDate: anObject [

	<generated>
	passwordClearingDate := anObject

]

{ #category : #accessing }
PulseUser >> passwordHash [

	<MSEProperty: #passwordHash type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ passwordHash
]

{ #category : #accessing }
PulseUser >> passwordHash: anObject [

	<generated>
	passwordHash := anObject

]

{ #category : #accessing }
PulseUser >> permissions [

	<generated>
	<MSEComment: 'TODO'>
	^ permissions
]

{ #category : #accessing }
PulseUser >> permissions: anObject [

	<generated>
	permissions value: anObject

]

{ #category : #accessing }
PulseUser >> roles [

	<generated>
	<MSEComment: 'TODO'>
	^ roles
]

{ #category : #accessing }
PulseUser >> roles: anObject [

	<generated>
	roles value: anObject

]

{ #category : #accessing }
PulseUser >> usedChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ usedChannels
]

{ #category : #accessing }
PulseUser >> usedChannels: anObject [

	<generated>
	usedChannels value: anObject

]

{ #category : #accessing }
PulseUser >> usedConnections [

	<generated>
	<MSEComment: 'TODO'>
	^ usedConnections
]

{ #category : #accessing }
PulseUser >> usedConnections: anObject [

	<generated>
	usedConnections value: anObject

]

{ #category : #accessing }
PulseUser >> vhosts [

	<generated>
	<MSEComment: 'TODO'>
	^ vhosts
]

{ #category : #accessing }
PulseUser >> vhosts: anObject [

	<generated>
	vhosts value: anObject

]
