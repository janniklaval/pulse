Class {
	#name : #PulseExchange,
	#superclass : #PulseEntity,
	#instVars : [
		'#autoDelete',
		'#creationDate',
		'#deletionDate',
		'#internal',
		'#topicID',
		'#durability',
		'#type => FMOne type: #PulseExchangeType opposite: #exchanges',
		'#sourceBindings => FMMany type: #PulseBinding opposite: #source',
		'#destinationBindings => FMMany type: #PulseBindingWithExchange opposite: #destination',
		'#alternate_exchange_for => FMMany type: #PulseExchange opposite: #my_alternate_exchange',
		'#my_alternate_exchange => FMOne type: #PulseExchange opposite: #alternate_exchange_for',
		'#publishedMessages => FMMany type: #PulseMessage opposite: #publishedToExchange',
		'#publisherComponents => FMMany type: #PulsePublisherComponent opposite: #exchanges',
		'#queues_for_dead_letter => FMMany type: #PulseQueue opposite: #dead_letter_exchange',
		'#user_who_performed_action => FMOne type: #PulseUser opposite: #initializedExchanges',
		'#vhost => FMOne type: #PulseVHost opposite: #exchanges'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseExchange class >> annotation [

	<MSEClass: #Exchange super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseExchange class >> generatedSlotNames [
	<generated>
	'PulseExchange class>>#generatedSlotNames'.
	^ #(alternate_exchange_for autoDelete creationDate deletionDate destinationBindings durability internal my_alternate_exchange publishedMessages publisherComponents queues_for_dead_letter sourceBindings topicID type user_who_performed_action vhost)
]

{ #category : #generator }
PulseExchange class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseExchange class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseExchange >> alternate_exchange_for [

	<generated>
	<MSEComment: 'TODO'>
	^ alternate_exchange_for
]

{ #category : #accessing }
PulseExchange >> alternate_exchange_for: anObject [

	<generated>
	alternate_exchange_for value: anObject

]

{ #category : #accessing }
PulseExchange >> autoDelete [

	<MSEProperty: #autoDelete type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ autoDelete
]

{ #category : #accessing }
PulseExchange >> autoDelete: anObject [

	<generated>
	autoDelete := anObject

]

{ #category : #accessing }
PulseExchange >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseExchange >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseExchange >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseExchange >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseExchange >> destinationBindings [

	<generated>
	<MSEComment: 'TODO'>
	^ destinationBindings
]

{ #category : #accessing }
PulseExchange >> destinationBindings: anObject [

	<generated>
	destinationBindings value: anObject

]

{ #category : #accessing }
PulseExchange >> durability [

	<MSEProperty: #durability type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ durability
]

{ #category : #accessing }
PulseExchange >> durability: anObject [

	<generated>
	durability := anObject

]

{ #category : #accessing }
PulseExchange >> internal [

	<MSEProperty: #internal type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ internal
]

{ #category : #accessing }
PulseExchange >> internal: anObject [

	<generated>
	internal := anObject

]

{ #category : #accessing }
PulseExchange >> my_alternate_exchange [

	<generated>
	<MSEComment: 'TODO'>
	^ my_alternate_exchange
]

{ #category : #accessing }
PulseExchange >> my_alternate_exchange: anObject [

	<generated>
	my_alternate_exchange := anObject

]

{ #category : #accessing }
PulseExchange >> publishedMessages [

	<generated>
	<MSEComment: 'TODO'>
	^ publishedMessages
]

{ #category : #accessing }
PulseExchange >> publishedMessages: anObject [

	<generated>
	publishedMessages value: anObject

]

{ #category : #accessing }
PulseExchange >> publisherComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponents
]

{ #category : #accessing }
PulseExchange >> publisherComponents: anObject [

	<generated>
	publisherComponents value: anObject

]

{ #category : #accessing }
PulseExchange >> queues_for_dead_letter [

	<generated>
	<MSEComment: 'TODO'>
	^ queues_for_dead_letter
]

{ #category : #accessing }
PulseExchange >> queues_for_dead_letter: anObject [

	<generated>
	queues_for_dead_letter value: anObject

]

{ #category : #accessing }
PulseExchange >> sourceBindings [

	<generated>
	<MSEComment: 'TODO'>
	^ sourceBindings
]

{ #category : #accessing }
PulseExchange >> sourceBindings: anObject [

	<generated>
	sourceBindings value: anObject

]

{ #category : #accessing }
PulseExchange >> topicID [

	<MSEProperty: #topicID type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ topicID
]

{ #category : #accessing }
PulseExchange >> topicID: anObject [

	<generated>
	topicID := anObject

]

{ #category : #accessing }
PulseExchange >> type [

	<generated>
	<MSEComment: 'TODO'>
	^ type
]

{ #category : #accessing }
PulseExchange >> type: anObject [

	<generated>
	type := anObject

]

{ #category : #accessing }
PulseExchange >> user_who_performed_action [

	<generated>
	<MSEComment: 'TODO'>
	^ user_who_performed_action
]

{ #category : #accessing }
PulseExchange >> user_who_performed_action: anObject [

	<generated>
	user_who_performed_action := anObject

]

{ #category : #accessing }
PulseExchange >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulseExchange >> vhost: anObject [

	<generated>
	vhost := anObject

]
