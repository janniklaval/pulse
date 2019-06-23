Class {
	#name : #ORPulseRMQChannel,
	#superclass : #PulseChannel,
	#traits : 'TRMQChannel',
	#classTraits : 'TRMQChannel classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQChannel class >> isOrionClass [
	^ true
]
