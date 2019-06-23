Class {
	#name : #ORPulseRMQRoutingKey,
	#superclass : #PulseRoutingKey,
	#traits : 'TRMQRoutingKey',
	#classTraits : 'TRMQRoutingKey classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQRoutingKey class >> isOrionClass [
	^ true
]
