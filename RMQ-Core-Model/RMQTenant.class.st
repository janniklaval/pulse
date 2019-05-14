Class {
	#name : #RMQTenant,
	#superclass : #PulseEntity,
	#instVars : [
		'component'
	],
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
