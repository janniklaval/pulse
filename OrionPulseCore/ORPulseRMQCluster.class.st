Class {
	#name : #ORPulseRMQCluster,
	#superclass : #PulseCluster,
	#traits : 'TRMQCluster',
	#classTraits : 'TRMQCluster classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQCluster class >> isOrionClass [
	^ true
]
