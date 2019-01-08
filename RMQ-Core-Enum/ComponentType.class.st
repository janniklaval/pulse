Class {
	#name : #ComponentType,
	#superclass : #Type,
	#instVars : [
		'components'
	],
	#category : #'RMQ-Core-Enum'
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
ComponentType >> components [
	<MSEProperty: #components type: #RMQComponent opposite:#componentType>
	<multivalued>
	^ components
]

{ #category : #accessing }
ComponentType >> components: anObject [
	components := anObject
]
