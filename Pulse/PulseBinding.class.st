Class {
	#name : #PulseBinding,
	#superclass : #PulseEntity,
	#instVars : [
		'#creationDate',
		'#deletionDate',
		'#routingKey => FMOne type: #PulseRoutingKey opposite: #bindings',
		'#source => FMOne type: #PulseExchange opposite: #sourceBindings',
		'#vhost => FMOne type: #PulseVHost opposite: #bindings'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseBinding class >> annotation [

	<MSEClass: #Binding super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseBinding class >> generatedSlotNames [
	<generated>
	'PulseBinding class>>#generatedSlotNames'.
	^ #(creationDate deletionDate routingKey source vhost)
]

{ #category : #generator }
PulseBinding class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseBinding class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseBinding >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseBinding >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseBinding >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseBinding >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseBinding >> routingKey [

	<generated>
	<MSEComment: 'TODO'>
	^ routingKey
]

{ #category : #accessing }
PulseBinding >> routingKey: anObject [

	<generated>
	routingKey := anObject

]

{ #category : #accessing }
PulseBinding >> source [

	<generated>
	<MSEComment: 'TODO'>
	^ source
]

{ #category : #accessing }
PulseBinding >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
PulseBinding >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulseBinding >> vhost: anObject [

	<generated>
	vhost := anObject

]
