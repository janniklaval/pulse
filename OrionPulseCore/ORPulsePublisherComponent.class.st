Class {
	#name : #ORPulsePublisherComponent,
	#superclass : #PulsePublisherComponent,
	#traits : 'TRMQComponent',
	#classTraits : 'TRMQComponent classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulsePublisherComponent class >> isOrionClass [
	^ true
]
