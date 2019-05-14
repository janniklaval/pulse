Class {
	#name : #ComponentType,
	#superclass : #PulseEnum,
	#instVars : [
		'publisherComponents',
		'consumerComponents'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #'System-FileRegistry' }
ComponentType class >> connector [
	^ self new rmqState: #connector

]

{ #category : #'System-FileRegistry' }
ComponentType class >> database [
	^ self new rmqState: #database

]

{ #category : #'System-FileRegistry' }
ComponentType class >> mediator [
	^ self new rmqState: #mediator

]

{ #category : #'System-FileRegistry' }
ComponentType class >> module [
	^ self new rmqState: #module
]

{ #category : #'System-FileRegistry' }
ComponentType class >> service [
	^ self new rmqState: #service
]

{ #category : #accessing }
ComponentType >> consumerComponents [
	<MSEProperty: #consumerComponents type: #RMQConsumerComponent opposite:#componentType>
	<multivalued>
	^ consumerComponents
]

{ #category : #accessing }
ComponentType >> consumerComponents: anObject [
	consumerComponents := anObject
]

{ #category : #accessing }
ComponentType >> publisherComponents [
	<MSEProperty: #publisherComponents type: #RMQPublisherComponent opposite:#componentType>
	<multivalued>
	^ publisherComponents
]

{ #category : #accessing }
ComponentType >> publisherComponents: anObject [
	publisherComponents := anObject
]
