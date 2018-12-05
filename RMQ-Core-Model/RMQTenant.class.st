Class {
	#name : #RMQTenant,
	#superclass : #PulseEntity,
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQTenant >> tenantId [
	^ self pulseName
]

{ #category : #accessing }
RMQTenant >> tenantId: anObject [
	self pulseName: anObject
]
