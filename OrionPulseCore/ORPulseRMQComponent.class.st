Class {
	#name : #ORPulseRMQComponent,
	#superclass : #PulseConsumerComponent,
	#traits : 'TRMQComponent',
	#classTraits : 'TRMQComponent classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQComponent class >> isOrionClass [
	^ true
]
