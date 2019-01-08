Class {
	#name : #AuthMechanism,
	#superclass : #Type,
	#instVars : [
		'connections'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #configuration }
AuthMechanism class >> amqPlain [
	^  self new rmqState: #amqPlain
]

{ #category : #configuration }
AuthMechanism class >> plain [
	^ self new rmqState: #plain
]

{ #category : #configuration }
AuthMechanism class >> rabbit_cr_demo [
		^ self new rmqState: #rabbit_cr_demo
]

{ #category : #accessing }
AuthMechanism >> connections [
	<MSEProperty: #connections type: #RMQConnection opposite:#authMechanism>
	<multivalued>
	^ connections
]

{ #category : #accessing }
AuthMechanism >> connections: anObject [
	connections := anObject
]

{ #category : #initialization }
AuthMechanism >> initialize [

	super initialize.
	connections := Set new.
]
