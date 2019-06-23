Class {
	#name : #ORPulseRMQTenant,
	#superclass : #PulseTenant,
	#traits : 'TRMQTenant',
	#classTraits : 'TRMQTenant classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQTenant class >> isOrionClass [
	^ true
]
