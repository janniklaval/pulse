Class {
	#name : #PulseRoutingKey,
	#superclass : #PulseEntity,
	#instVars : [
		'#binding => FMOne type: #PulseBinding opposite: #routingKey',
		'#messages => FMMany type: #PulseMessage opposite: #routingKeys',
		'#queues_for_dead_letter => FMMany type: #PulseQueue opposite: #dead_letter_routing_key'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseRoutingKey class >> annotation [

	<MSEClass: #RoutingKey super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseRoutingKey class >> generatedSlotNames [
	<generated>
	'PulseRoutingKey class>>#generatedSlotNames'.
	^ #(binding messages queues_for_dead_letter)
]

{ #category : #generator }
PulseRoutingKey class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseRoutingKey class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseRoutingKey >> binding [

	<generated>
	<MSEComment: 'TODO'>
	^ binding
]

{ #category : #accessing }
PulseRoutingKey >> binding: anObject [

	<generated>
	binding := anObject

]

{ #category : #accessing }
PulseRoutingKey >> messages [

	<generated>
	<MSEComment: 'TODO'>
	^ messages
]

{ #category : #accessing }
PulseRoutingKey >> messages: anObject [

	<generated>
	messages value: anObject

]

{ #category : #accessing }
PulseRoutingKey >> queues_for_dead_letter [

	<generated>
	<MSEComment: 'TODO'>
	^ queues_for_dead_letter
]

{ #category : #accessing }
PulseRoutingKey >> queues_for_dead_letter: anObject [

	<generated>
	queues_for_dead_letter value: anObject

]