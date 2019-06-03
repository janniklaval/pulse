Class {
	#name : #PulseChannel,
	#superclass : #PulseEntity,
	#instVars : [
		'#closingDate',
		'#connection => FMOne type: #PulseConnection opposite: #channels',
		'#consumedQueues => FMMany type: #PulseQueue opposite: #consumerChannels',
		'#consumerComponent => FMOne type: #PulseConsumerComponent opposite: #subscribedChannels',
		'#consumerProcess => FMOne type: #PulseConsumerProcess opposite: #subscribedChannels',
		'#creationDate',
		'#globalPrefetchCount',
		'#guaranteeMode => FMOne type: #PulseGuaranteeMode opposite: #channels',
		'#idleSince',
		'#pid',
		'#prefetchCount',
		'#publisherComponent => FMOne type: #PulsePublisherComponent opposite: #usedChannels',
		'#pulseState => FMOne type: #PulseState opposite: #channels',
		'#user => FMOne type: #PulseUser opposite: #usedChannels',
		'#user_who_performed_connection => FMOne type: #PulseUser opposite: #initializedChannels',
		'#vhost => FMOne type: #PulseVHost opposite: #channels'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseChannel class >> annotation [

	<MSEClass: #Channel super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseChannel class >> generatedSlotNames [
	<generated>
	'PulseChannel class>>#generatedSlotNames'.
	^ #(closingDate connection consumedQueues consumerComponent consumerProcess creationDate globalPrefetchCount guaranteeMode idleSince pid prefetchCount publisherComponent pulseState user user_who_performed_connection vhost)
]

{ #category : #generator }
PulseChannel class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseChannel class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseChannel >> closingDate [

	<MSEProperty: #closingDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ closingDate
]

{ #category : #accessing }
PulseChannel >> closingDate: anObject [

	<generated>
	closingDate := anObject

]

{ #category : #accessing }
PulseChannel >> connection [

	<generated>
	<MSEComment: 'TODO'>
	^ connection
]

{ #category : #accessing }
PulseChannel >> connection: anObject [

	<generated>
	connection := anObject

]

{ #category : #accessing }
PulseChannel >> consumedQueues [

	<generated>
	<MSEComment: 'TODO'>
	^ consumedQueues
]

{ #category : #accessing }
PulseChannel >> consumedQueues: anObject [

	<generated>
	consumedQueues value: anObject

]

{ #category : #accessing }
PulseChannel >> consumerComponent [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerComponent
]

{ #category : #accessing }
PulseChannel >> consumerComponent: anObject [

	<generated>
	consumerComponent := anObject

]

{ #category : #accessing }
PulseChannel >> consumerProcess [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerProcess
]

{ #category : #accessing }
PulseChannel >> consumerProcess: anObject [

	<generated>
	consumerProcess := anObject

]

{ #category : #accessing }
PulseChannel >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseChannel >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseChannel >> globalPrefetchCount [

	<MSEProperty: #globalPrefetchCount type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ globalPrefetchCount
]

{ #category : #accessing }
PulseChannel >> globalPrefetchCount: anObject [

	<generated>
	globalPrefetchCount := anObject

]

{ #category : #accessing }
PulseChannel >> guaranteeMode [

	<generated>
	<MSEComment: 'TODO'>
	^ guaranteeMode
]

{ #category : #accessing }
PulseChannel >> guaranteeMode: anObject [

	<generated>
	guaranteeMode := anObject

]

{ #category : #accessing }
PulseChannel >> idleSince [

	<MSEProperty: #idleSince type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ idleSince
]

{ #category : #accessing }
PulseChannel >> idleSince: anObject [

	<generated>
	idleSince := anObject

]

{ #category : #accessing }
PulseChannel >> pid [

	<MSEProperty: #pid type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ pid
]

{ #category : #accessing }
PulseChannel >> pid: anObject [

	<generated>
	pid := anObject

]

{ #category : #accessing }
PulseChannel >> prefetchCount [

	<MSEProperty: #prefetchCount type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ prefetchCount
]

{ #category : #accessing }
PulseChannel >> prefetchCount: anObject [

	<generated>
	prefetchCount := anObject

]

{ #category : #accessing }
PulseChannel >> publisherComponent [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponent
]

{ #category : #accessing }
PulseChannel >> publisherComponent: anObject [

	<generated>
	publisherComponent := anObject

]

{ #category : #accessing }
PulseChannel >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseChannel >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulseChannel >> user [

	<generated>
	<MSEComment: 'TODO'>
	^ user
]

{ #category : #accessing }
PulseChannel >> user: anObject [

	<generated>
	user := anObject

]

{ #category : #accessing }
PulseChannel >> user_who_performed_connection [

	<generated>
	<MSEComment: 'TODO'>
	^ user_who_performed_connection
]

{ #category : #accessing }
PulseChannel >> user_who_performed_connection: anObject [

	<generated>
	user_who_performed_connection := anObject

]

{ #category : #accessing }
PulseChannel >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulseChannel >> vhost: anObject [

	<generated>
	vhost := anObject

]
