Class {
	#name : #ORPulseRMQBinding,
	#superclass : #PulseBinding,
	#traits : 'TRMQBinding',
	#classTraits : 'TRMQBinding classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQBinding class >> isOrionClass [
	^ true
]
