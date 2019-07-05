Class {
	#name : #PulseQueue,
	#superclass : #PulseEntity,
	#instVars : [
		'#autoDelete => FMProperty',
		'#consumerChannels => FMMany type: #PulseChannel opposite: #consumedQueues',
		'#creationDate => FMProperty',
		'#dead_letter_exchange => FMOne type: #PulseExchange opposite: #queues_for_dead_letter',
		'#dead_letter_routing_key => FMOne type: #PulseRoutingKey opposite: #queues_for_dead_letter',
		'#deletionDate => FMProperty',
		'#deliveredMessages => FMMany type: #PulseMessage opposite: #deliveredFromQueues',
		'#destinationBindings => FMMany type: #PulseBindingWithQueue opposite: #destination',
		'#durability => FMProperty',
		'#exclusive => FMProperty',
		'#expiresAfter => FMProperty',
		'#idleSince => FMProperty',
		'#maxLength => FMProperty',
		'#maxLengthBytes => FMProperty',
		'#maxPriority => FMProperty',
		'#messageTTL => FMProperty',
		'#pulseState => FMOne type: #PulseState opposite: #queues',
		'#routedMessages => FMMany type: #PulseMessage opposite: #routedToQueues',
		'#vhost => FMOne type: #PulseVHost opposite: #queues'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseQueue class >> annotation [

	<MSEClass: #Queue super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #meta }
PulseQueue class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseQueue >> autoDelete [

	<MSEProperty: #autoDelete type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ autoDelete
]

{ #category : #accessing }
PulseQueue >> autoDelete: anObject [

	<generated>
	autoDelete := anObject

]

{ #category : #accessing }
PulseQueue >> consumerChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerChannels
]

{ #category : #accessing }
PulseQueue >> consumerChannels: anObject [

	<generated>
	consumerChannels value: anObject

]

{ #category : #accessing }
PulseQueue >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseQueue >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseQueue >> dead_letter_exchange [

	<generated>
	<MSEComment: 'TODO'>
	^ dead_letter_exchange
]

{ #category : #accessing }
PulseQueue >> dead_letter_exchange: anObject [

	<generated>
	dead_letter_exchange := anObject

]

{ #category : #accessing }
PulseQueue >> dead_letter_routing_key [

	<generated>
	<MSEComment: 'TODO'>
	^ dead_letter_routing_key
]

{ #category : #accessing }
PulseQueue >> dead_letter_routing_key: anObject [

	<generated>
	dead_letter_routing_key := anObject

]

{ #category : #accessing }
PulseQueue >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseQueue >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseQueue >> deliveredMessages [

	<generated>
	<MSEComment: 'TODO'>
	^ deliveredMessages
]

{ #category : #accessing }
PulseQueue >> deliveredMessages: anObject [

	<generated>
	deliveredMessages value: anObject

]

{ #category : #accessing }
PulseQueue >> destinationBindings [

	<generated>
	<MSEComment: 'TODO'>
	^ destinationBindings
]

{ #category : #accessing }
PulseQueue >> destinationBindings: anObject [

	<generated>
	destinationBindings value: anObject

]

{ #category : #accessing }
PulseQueue >> durability [

	<MSEProperty: #durability type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ durability
]

{ #category : #accessing }
PulseQueue >> durability: anObject [

	<generated>
	durability := anObject

]

{ #category : #accessing }
PulseQueue >> exclusive [

	<MSEProperty: #exclusive type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ exclusive
]

{ #category : #accessing }
PulseQueue >> exclusive: anObject [

	<generated>
	exclusive := anObject

]

{ #category : #accessing }
PulseQueue >> expiresAfter [

	<MSEProperty: #expiresAfter type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ expiresAfter
]

{ #category : #accessing }
PulseQueue >> expiresAfter: anObject [

	<generated>
	expiresAfter := anObject

]

{ #category : #accessing }
PulseQueue >> idleSince [

	<MSEProperty: #idleSince type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ idleSince
]

{ #category : #accessing }
PulseQueue >> idleSince: anObject [

	<generated>
	idleSince := anObject

]

{ #category : #accessing }
PulseQueue >> maxLength [

	<MSEProperty: #maxLength type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ maxLength
]

{ #category : #accessing }
PulseQueue >> maxLength: anObject [

	<generated>
	maxLength := anObject

]

{ #category : #accessing }
PulseQueue >> maxLengthBytes [

	<MSEProperty: #maxLengthBytes type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ maxLengthBytes
]

{ #category : #accessing }
PulseQueue >> maxLengthBytes: anObject [

	<generated>
	maxLengthBytes := anObject

]

{ #category : #accessing }
PulseQueue >> maxPriority [

	<MSEProperty: #maxPriority type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ maxPriority
]

{ #category : #accessing }
PulseQueue >> maxPriority: anObject [

	<generated>
	maxPriority := anObject

]

{ #category : #accessing }
PulseQueue >> messageTTL [

	<MSEProperty: #messageTTL type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ messageTTL
]

{ #category : #accessing }
PulseQueue >> messageTTL: anObject [

	<generated>
	messageTTL := anObject

]

{ #category : #accessing }
PulseQueue >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseQueue >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulseQueue >> routedMessages [

	<generated>
	<MSEComment: 'TODO'>
	^ routedMessages
]

{ #category : #accessing }
PulseQueue >> routedMessages: anObject [

	<generated>
	routedMessages value: anObject

]

{ #category : #accessing }
PulseQueue >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulseQueue >> vhost: anObject [

	<generated>
	vhost := anObject

]
