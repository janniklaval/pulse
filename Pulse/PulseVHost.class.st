Class {
	#name : #PulseVHost,
	#superclass : #PulseEntity,
	#instVars : [
		'#bindings => FMMany type: #PulseBinding opposite: #vhost',
		'#channels => FMMany type: #PulseChannel opposite: #vhost',
		'#connections => FMMany type: #PulseConnection opposite: #vhost',
		'#creationDate',
		'#deletionDate',
		'#exchanges => FMMany type: #PulseExchange opposite: #vhost',
		'#node => FMOne type: #PulseNode opposite: #vhosts',
		'#permissions => FMMany type: #PulsePermission opposite: #vhost',
		'#queues => FMMany type: #PulseQueue opposite: #vhost',
		'#tracing',
		'#users => FMMany type: #PulseUser opposite: #vhosts'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseVHost class >> annotation [

	<MSEClass: #VHost super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseVHost class >> generatedSlotNames [
	<generated>
	'PulseVHost class>>#generatedSlotNames'.
	^ #(bindings channels connections creationDate deletionDate exchanges node permissions queues tracing users)
]

{ #category : #generator }
PulseVHost class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseVHost class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseVHost >> bindings [

	<generated>
	<MSEComment: 'TODO'>
	^ bindings
]

{ #category : #accessing }
PulseVHost >> bindings: anObject [

	<generated>
	bindings value: anObject

]

{ #category : #accessing }
PulseVHost >> channels [

	<generated>
	<MSEComment: 'TODO'>
	^ channels
]

{ #category : #accessing }
PulseVHost >> channels: anObject [

	<generated>
	channels value: anObject

]

{ #category : #accessing }
PulseVHost >> connections [

	<generated>
	<MSEComment: 'TODO'>
	^ connections
]

{ #category : #accessing }
PulseVHost >> connections: anObject [

	<generated>
	connections value: anObject

]

{ #category : #accessing }
PulseVHost >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseVHost >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseVHost >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseVHost >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseVHost >> exchanges [

	<generated>
	<MSEComment: 'TODO'>
	^ exchanges
]

{ #category : #accessing }
PulseVHost >> exchanges: anObject [

	<generated>
	exchanges value: anObject

]

{ #category : #accessing }
PulseVHost >> node [

	<generated>
	<MSEComment: 'TODO'>
	^ node
]

{ #category : #accessing }
PulseVHost >> node: anObject [

	<generated>
	node := anObject

]

{ #category : #accessing }
PulseVHost >> permissions [

	<generated>
	<MSEComment: 'TODO'>
	^ permissions
]

{ #category : #accessing }
PulseVHost >> permissions: anObject [

	<generated>
	permissions value: anObject

]

{ #category : #accessing }
PulseVHost >> queues [

	<generated>
	<MSEComment: 'TODO'>
	^ queues
]

{ #category : #accessing }
PulseVHost >> queues: anObject [

	<generated>
	queues value: anObject

]

{ #category : #accessing }
PulseVHost >> tracing [

	<MSEProperty: #tracing type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ tracing
]

{ #category : #accessing }
PulseVHost >> tracing: anObject [

	<generated>
	tracing := anObject

]

{ #category : #accessing }
PulseVHost >> users [

	<generated>
	<MSEComment: 'TODO'>
	^ users
]

{ #category : #accessing }
PulseVHost >> users: anObject [

	<generated>
	users value: anObject

]
