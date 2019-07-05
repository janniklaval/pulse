Class {
	#name : #PulsePayload,
	#superclass : #PulseEntity,
	#instVars : [
		'#encoding => FMOne type: #PulseEncoding opposite: #payloads',
		'#messages => FMMany type: #PulseMessage opposite: #payload'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulsePayload class >> annotation [

	<MSEClass: #Payload super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #meta }
PulsePayload class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulsePayload >> encoding [

	<generated>
	<MSEComment: 'TODO'>
	^ encoding
]

{ #category : #accessing }
PulsePayload >> encoding: anObject [

	<generated>
	encoding := anObject

]

{ #category : #accessing }
PulsePayload >> messages [

	<generated>
	<MSEComment: 'TODO'>
	^ messages
]

{ #category : #accessing }
PulsePayload >> messages: anObject [

	<generated>
	messages value: anObject

]
