Class {
	#name : #ORPulseRMQNode,
	#superclass : #PulseNode,
	#traits : 'TRMQNode',
	#classTraits : 'TRMQNode classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQNode class >> isOrionClass [
	^ true
]
