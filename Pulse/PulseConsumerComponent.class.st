Class {
	#name : #PulseConsumerComponent,
	#superclass : #PulseEntity,
	#instVars : [
		'#address',
		'#appId',
		'#author',
		'#componentType => FMOne type: #PulseComponentType opposite: #consumerComponents',
		'#consumerProcesses => FMMany type: #PulseConsumerProcess opposite: #consumerComponent',
		'#deploymentMode => FMOne type: #PulseDeploymentMode opposite: #consumerComponents',
		'#guid',
		'#owner',
		'#platform',
		'#pulseState => FMOne type: #PulseState opposite: #consumerComponents',
		'#subscribedChannels => FMMany type: #PulseChannel opposite: #consumerComponent',
		'#tenantId',
		'#version'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseConsumerComponent class >> annotation [

	<MSEClass: #ConsumerComponent super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseConsumerComponent class >> generatedSlotNames [
	<generated>
	'PulseConsumerComponent class>>#generatedSlotNames'.
	^ #(address appId author componentType consumerProcesses deploymentMode guid owner platform pulseState subscribedChannels tenantId version)
]

{ #category : #generator }
PulseConsumerComponent class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseConsumerComponent class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseConsumerComponent >> address [

	<MSEProperty: #address type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ address
]

{ #category : #accessing }
PulseConsumerComponent >> address: anObject [

	<generated>
	address := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> appId [

	<MSEProperty: #appId type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ appId
]

{ #category : #accessing }
PulseConsumerComponent >> appId: anObject [

	<generated>
	appId := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> author [

	<MSEProperty: #author type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ author
]

{ #category : #accessing }
PulseConsumerComponent >> author: anObject [

	<generated>
	author := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> componentType [

	<generated>
	<MSEComment: 'TODO'>
	^ componentType
]

{ #category : #accessing }
PulseConsumerComponent >> componentType: anObject [

	<generated>
	componentType := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> consumerProcesses [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerProcesses
]

{ #category : #accessing }
PulseConsumerComponent >> consumerProcesses: anObject [

	<generated>
	consumerProcesses value: anObject

]

{ #category : #accessing }
PulseConsumerComponent >> deploymentMode [

	<generated>
	<MSEComment: 'TODO'>
	^ deploymentMode
]

{ #category : #accessing }
PulseConsumerComponent >> deploymentMode: anObject [

	<generated>
	deploymentMode := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> guid [

	<MSEProperty: #guid type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ guid
]

{ #category : #accessing }
PulseConsumerComponent >> guid: anObject [

	<generated>
	guid := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> owner [

	<MSEProperty: #owner type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ owner
]

{ #category : #accessing }
PulseConsumerComponent >> owner: anObject [

	<generated>
	owner := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> platform [

	<MSEProperty: #platform type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ platform
]

{ #category : #accessing }
PulseConsumerComponent >> platform: anObject [

	<generated>
	platform := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseConsumerComponent >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> subscribedChannels [

	<generated>
	<MSEComment: 'TODO'>
	^ subscribedChannels
]

{ #category : #accessing }
PulseConsumerComponent >> subscribedChannels: anObject [

	<generated>
	subscribedChannels value: anObject

]

{ #category : #accessing }
PulseConsumerComponent >> tenantId [

	<MSEProperty: #tenantId type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ tenantId
]

{ #category : #accessing }
PulseConsumerComponent >> tenantId: anObject [

	<generated>
	tenantId := anObject

]

{ #category : #accessing }
PulseConsumerComponent >> version [

	<MSEProperty: #version type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ version
]

{ #category : #accessing }
PulseConsumerComponent >> version: anObject [

	<generated>
	version := anObject

]
