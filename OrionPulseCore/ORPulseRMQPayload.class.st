Class {
	#name : #ORPulseRMQPayload,
	#superclass : #PulsePayload,
	#traits : 'TRMQPayload',
	#classTraits : 'TRMQPayload classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQPayload class >> isOrionClass [
	^ true
]
