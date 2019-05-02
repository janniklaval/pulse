Class {
	#name : #DeploymentMode,
	#superclass : #PulseEnum,
	#instVars : [
		'consumerComponents',
		'publisherComponents'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #'as yet unclassified' }
DeploymentMode class >> cloud [
	^ self new rmqState: #cloud
	
]

{ #category : #'as yet unclassified' }
DeploymentMode class >> onPremise [
	^ self new rmqState: #onPremise
]

{ #category : #accessing }
DeploymentMode class >> server [
	^ self new rmqState: #server
]

{ #category : #accessing }
DeploymentMode >> consumerComponents [
	<MSEProperty: #consumerComponents type: #RMQConsumerComponent opposite:#deploymentMode>
	<multivalued>
	^ consumerComponents
]

{ #category : #accessing }
DeploymentMode >> consumerComponents: anObject [
	consumerComponents := anObject
]

{ #category : #accessing }
DeploymentMode >> publisherComponents [
	<MSEProperty: #publisherComponents type: #RMQPublisherComponent opposite:#deploymentMode>
	<multivalued>
	^ publisherComponents
]

{ #category : #accessing }
DeploymentMode >> publisherComponents: anObject [
	publisherComponents := anObject
]
