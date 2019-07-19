Class {
	#name : #PulsePublisherComponent,
	#superclass : #PulseEntity,
	#instVars : [
		'#address',
		'#appId',
		'#author',
		'#guid',
		'#owner',
		'#platform',
		'#tenantId',
		'#version',
		'#componentType => FMOne type: #PulseComponentType opposite: #publisherComponents',
		'#deploymentMode => FMOne type: #PulseDeploymentMode opposite: #publisherComponents',
		'#pulseState => FMOne type: #PulseState opposite: #publisherComponents',
		'#usedChannels => FMMany type: #PulseChannel opposite: #publisherComponent',
		'#exchanges => FMMany type: #PulseExchange opposite: #publisherComponents',
		'#messagesFromPublisher => FMMany type: #PulseMessage opposite: #publisherComponent'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulsePublisherComponent class >> annotation [

	<MSEClass: #PublisherComponent super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulsePublisherComponent class >> generatedSlotNames [
	<generated>
	'PulsePublisherComponent class>>#generatedSlotNames'.
	^ #(address appId author componentType deploymentMode exchanges guid messagesFromPublisher owner platform pulseState tenantId usedChannels version)
]

{ #category : #generator }
PulsePublisherComponent class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulsePublisherComponent class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulsePublisherComponent >> address [

	<MSEProperty: #address type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ address
]

{ #category : #accessing }
PulsePublisherComponent >> address: anObject [

	<generated>
	address := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> appId [

	<MSEProperty: #appId type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ appId
]

{ #category : #accessing }
PulsePublisherComponent >> appId: anObject [

	<generated>
	appId := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> author [

	<MSEProperty: #author type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ author
]

{ #category : #accessing }
PulsePublisherComponent >> author: anObject [

	<generated>
	author := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> componentType [

	<generated>
	<MSEComment: 'TODO'>
	^ componentType
]

{ #category : #accessing }
PulsePublisherComponent >> componentType: anObject [

	<generated>
	componentType := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> deploymentMode [

	<generated>
	<MSEComment: 'TODO'>
	^ deploymentMode
]

{ #category : #accessing }
PulsePublisherComponent >> deploymentMode: anObject [

	<generated>
	deploymentMode := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> exchanges [

	<generated>
	<MSEComment: 'TODO'>
	^ exchanges
]

{ #category : #accessing }
PulsePublisherComponent >> exchanges: anObject [

	<generated>
	exchanges value: anObject

]

{ #category : #accessing }
PulsePublisherComponent >> guid [

	<MSEProperty: #guid type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ guid
]

{ #category : #accessing }
PulsePublisherComponent >> guid: anObject [

	<generated>
	guid := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> messagesFromPublisher [

	<generated>
	<MSEComment: 'TODO'>
	^ messagesFromPublisher
]

{ #category : #accessing }
PulsePublisherComponent >> messagesFromPublisher: anObject [

	<generated>
	messagesFromPublisher value: anObject

]

{ #category : #accessing }
PulsePublisherComponent >> owner [

	<MSEProperty: #owner type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ owner
]

{ #category : #accessing }
PulsePublisherComponent >> owner: anObject [

	<generated>
	owner := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> platform [

	<MSEProperty: #platform type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ platform
]

{ #category : #accessing }
PulsePublisherComponent >> platform: anObject [

	<generated>
	platform := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulsePublisherComponent >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> tenantId [

	<MSEProperty: #tenantId type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ tenantId
]

{ #category : #accessing }
PulsePublisherComponent >> tenantId: anObject [

	<generated>
	tenantId := anObject

]

{ #category : #accessing }
PulsePublisherComponent >> usedChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ usedChannels
]

{ #category : #accessing }
PulsePublisherComponent >> usedChannels: anObject [

	<generated>
	usedChannels value: anObject

]

{ #category : #accessing }
PulsePublisherComponent >> version [

	<MSEProperty: #version type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ version
]

{ #category : #accessing }
PulsePublisherComponent >> version: anObject [

	<generated>
	version := anObject

]
