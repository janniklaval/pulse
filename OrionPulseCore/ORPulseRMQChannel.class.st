Class {
	#name : #ORPulseRMQChannel,
	#superclass : #RMQChannel,
	#traits : 'TRMQChannel',
	#classTraits : 'TRMQChannel classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQChannel class >> isOrionClass [
	^ true
]
