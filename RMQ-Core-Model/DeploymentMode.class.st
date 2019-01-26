Class {
	#name : #DeploymentMode,
	#superclass : #PulseEnum,
	#instVars : [
		'components'
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
DeploymentMode >> components [
	<MSEProperty: #components type: #RMQComponent opposite:#deploymentMode>
	<multivalued>
	^ components
]

{ #category : #accessing }
DeploymentMode >> components: anObject [
	components := anObject
]
