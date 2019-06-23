Class {
	#name : #ORPulseRMQUser,
	#superclass : #PulseUser,
	#traits : 'TRMQUser',
	#classTraits : 'TRMQUser classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQUser class >> isOrionClass [
	^ true
]
