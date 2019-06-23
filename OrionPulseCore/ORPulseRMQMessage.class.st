Class {
	#name : #ORPulseRMQMessage,
	#superclass : #PulseMessage,
	#traits : 'TRMQMessage',
	#classTraits : 'TRMQMessage classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQMessage class >> isOrionClass [
	^ true
]
