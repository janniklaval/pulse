Class {
	#name : #ORPulseRMQQueue,
	#superclass : #PulseQueue,
	#traits : 'TRMQQueue',
	#classTraits : 'TRMQQueue classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQQueue class >> isOrionClass [
	^ true
]
