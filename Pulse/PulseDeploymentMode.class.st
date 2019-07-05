Class {
	#name : #PulseDeploymentMode,
	#superclass : #PulseEnum,
	#instVars : [
		'#consumerComponents => FMMany type: #PulseConsumerComponent opposite: #deploymentMode',
		'#publisherComponents => FMMany type: #PulsePublisherComponent opposite: #deploymentMode'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseDeploymentMode class >> annotation [

	<MSEClass: #DeploymentMode super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #'as yet unclassified' }
PulseDeploymentMode class >> cloud [
	^ self new pulseState: #cloud
	
]

{ #category : #'as yet unclassified' }
PulseDeploymentMode class >> onPremise [
	^ self new pulseState: #onPremise
]

{ #category : #meta }
PulseDeploymentMode class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseDeploymentMode class >> server [
	^ self new pulseState: #server
]

{ #category : #accessing }
PulseDeploymentMode >> consumerComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerComponents
]

{ #category : #accessing }
PulseDeploymentMode >> consumerComponents: anObject [

	<generated>
	consumerComponents value: anObject

]

{ #category : #accessing }
PulseDeploymentMode >> publisherComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponents
]

{ #category : #accessing }
PulseDeploymentMode >> publisherComponents: anObject [

	<generated>
	publisherComponents value: anObject

]
