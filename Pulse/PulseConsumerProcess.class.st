Class {
	#name : #PulseConsumerProcess,
	#superclass : #PulseEntity,
	#instVars : [
		'#ackRequired',
		'#consumerTag',
		'#creationDate',
		'#deletionDate',
		'#exclusive',
		'#guid',
		'#pulseState => FMOne type: #PulseState opposite: #consumerProcesses',
		'#subscribedChannels => FMMany type: #PulseChannel opposite: #consumerProcess',
		'#consumerComponent => FMOne type: #PulseConsumerComponent opposite: #consumerProcesses'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseConsumerProcess class >> annotation [

	<MSEClass: #ConsumerProcess super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseConsumerProcess class >> generatedSlotNames [
	<generated>
	'PulseConsumerProcess class>>#generatedSlotNames'.
	^ #(ackRequired consumerComponent consumerTag creationDate deletionDate exclusive guid pulseState subscribedChannels)
]

{ #category : #generator }
PulseConsumerProcess class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseConsumerProcess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseConsumerProcess >> ackRequired [

	<MSEProperty: #ackRequired type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ ackRequired
]

{ #category : #accessing }
PulseConsumerProcess >> ackRequired: anObject [

	<generated>
	ackRequired := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> consumerComponent [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerComponent
]

{ #category : #accessing }
PulseConsumerProcess >> consumerComponent: anObject [

	<generated>
	consumerComponent := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> consumerTag [

	<MSEProperty: #consumerTag type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ consumerTag
]

{ #category : #accessing }
PulseConsumerProcess >> consumerTag: anObject [

	<generated>
	consumerTag := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseConsumerProcess >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseConsumerProcess >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> exclusive [

	<MSEProperty: #exclusive type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ exclusive
]

{ #category : #accessing }
PulseConsumerProcess >> exclusive: anObject [

	<generated>
	exclusive := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> guid [

	<MSEProperty: #guid type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ guid
]

{ #category : #accessing }
PulseConsumerProcess >> guid: anObject [

	<generated>
	guid := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> pulseName [
	^ consumerTag
]

{ #category : #accessing }
PulseConsumerProcess >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseConsumerProcess >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulseConsumerProcess >> subscribedChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ subscribedChannels
]

{ #category : #accessing }
PulseConsumerProcess >> subscribedChannels: anObject [

	<generated>
	subscribedChannels value: anObject

]
