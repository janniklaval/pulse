Class {
	#name : #ORPulseRMQConnection,
	#superclass : #PulseConnection,
	#traits : 'TRMQConnection',
	#classTraits : 'TRMQConnection classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQConnection class >> isOrionClass [
	^ true
]
