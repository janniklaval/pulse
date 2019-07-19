Class {
	#name : #PulseMessage,
	#superclass : #PulseEntity,
	#instVars : [
		'#encrypted',
		'#messageId',
		'#priority',
		'#redelivered',
		'#timestamp',
		'#deliveryMode => FMOne type: #PulseDeliveryMode opposite: #messages',
		'#messageType => FMOne type: #PulseMessageType opposite: #messages',
		'#publishedToExchange => FMOne type: #PulseExchange opposite: #publishedMessages',
		'#exchangeFormat => FMOne type: #PulseExchangeFormat opposite: #messages',
		'#deliveredFromQueues => FMMany type: #PulseQueue opposite: #deliveredMessages',
		'#payload => FMOne type: #PulsePayload opposite: #messages',
		'#publisherComponent => FMOne type: #PulsePublisherComponent opposite: #messagesFromPublisher',
		'#routedToQueues => FMMany type: #PulseQueue opposite: #routedMessages',
		'#routingKeys => FMMany type: #PulseRoutingKey opposite: #messages'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseMessage class >> annotation [

	<MSEClass: #Message super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseMessage class >> generatedSlotNames [
	<generated>
	'PulseMessage class>>#generatedSlotNames'.
	^ #(deliveredFromQueues deliveryMode encrypted exchangeFormat messageId messageType payload priority publishedToExchange publisherComponent redelivered routedToQueues routingKeys timestamp)
]

{ #category : #generator }
PulseMessage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseMessage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseMessage >> deliveredFromQueues [

	<generated>
	<MSEComment: 'TODO'>
	^ deliveredFromQueues
]

{ #category : #accessing }
PulseMessage >> deliveredFromQueues: anObject [

	<generated>
	deliveredFromQueues value: anObject

]

{ #category : #accessing }
PulseMessage >> deliveryMode [

	<generated>
	<MSEComment: 'TODO'>
	^ deliveryMode
]

{ #category : #accessing }
PulseMessage >> deliveryMode: anObject [

	<generated>
	deliveryMode := anObject

]

{ #category : #accessing }
PulseMessage >> encrypted [

	<MSEProperty: #encrypted type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ encrypted
]

{ #category : #accessing }
PulseMessage >> encrypted: anObject [

	<generated>
	encrypted := anObject

]

{ #category : #accessing }
PulseMessage >> exchangeFormat [

	<generated>
	<MSEComment: 'TODO'>
	^ exchangeFormat
]

{ #category : #accessing }
PulseMessage >> exchangeFormat: anObject [

	<generated>
	exchangeFormat := anObject

]

{ #category : #accessing }
PulseMessage >> messageId [

	<MSEProperty: #messageId type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ messageId
]

{ #category : #accessing }
PulseMessage >> messageId: anObject [

	<generated>
	messageId := anObject

]

{ #category : #accessing }
PulseMessage >> messageType [

	<generated>
	<MSEComment: 'TODO'>
	^ messageType
]

{ #category : #accessing }
PulseMessage >> messageType: anObject [

	<generated>
	messageType := anObject

]

{ #category : #accessing }
PulseMessage >> payload [

	<generated>
	<MSEComment: 'TODO'>
	^ payload
]

{ #category : #accessing }
PulseMessage >> payload: anObject [

	<generated>
	payload := anObject

]

{ #category : #accessing }
PulseMessage >> priority [

	<MSEProperty: #priority type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ priority
]

{ #category : #accessing }
PulseMessage >> priority: anObject [

	<generated>
	priority := anObject

]

{ #category : #accessing }
PulseMessage >> publishedToExchange [

	<generated>
	<MSEComment: 'TODO'>
	^ publishedToExchange
]

{ #category : #accessing }
PulseMessage >> publishedToExchange: anObject [

	<generated>
	publishedToExchange := anObject

]

{ #category : #accessing }
PulseMessage >> publisherComponent [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponent
]

{ #category : #accessing }
PulseMessage >> publisherComponent: anObject [

	<generated>
	publisherComponent := anObject

]

{ #category : #accessing }
PulseMessage >> redelivered [

	<MSEProperty: #redelivered type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ redelivered
]

{ #category : #accessing }
PulseMessage >> redelivered: anObject [

	<generated>
	redelivered := anObject

]

{ #category : #accessing }
PulseMessage >> routedToQueues [

	<generated>
	<MSEComment: 'TODO'>
	^ routedToQueues
]

{ #category : #accessing }
PulseMessage >> routedToQueues: anObject [

	<generated>
	routedToQueues value: anObject

]

{ #category : #accessing }
PulseMessage >> routingKeys [

	<generated>
	<MSEComment: 'TODO'>
	^ routingKeys
]

{ #category : #accessing }
PulseMessage >> routingKeys: anObject [

	<generated>
	routingKeys value: anObject

]

{ #category : #accessing }
PulseMessage >> timestamp [

	<MSEProperty: #timestamp type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ timestamp
]

{ #category : #accessing }
PulseMessage >> timestamp: anObject [

	<generated>
	timestamp := anObject

]
