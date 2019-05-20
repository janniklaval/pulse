Class {
	#name : #ORPulseRMQQueue,
	#superclass : #RMQQueue,
	#traits : 'TRMQQueue',
	#classTraits : 'TRMQQueue classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQQueue class >> isOrionClass [
	^ true
]
