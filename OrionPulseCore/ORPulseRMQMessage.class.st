Class {
	#name : #ORPulseRMQMessage,
	#superclass : #RMQMessage,
	#traits : 'TRMQMessage',
	#classTraits : 'TRMQMessage classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQMessage class >> isOrionClass [
	^ true
]
