Class {
	#name : #ORPulseRMQConnection,
	#superclass : #RMQConnection,
	#traits : 'TRMQConnection',
	#classTraits : 'TRMQConnection classTrait',
	#category : #'OrionPulseCore-Class'
}

{ #category : #testing }
ORPulseRMQConnection class >> isOrionClass [
	^ true
]
