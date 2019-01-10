Class {
	#name : #RMQTenant,
	#superclass : #PulseEntity,
	#instVars : [
		'component'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQTenant >> component [
	<MSEProperty: #component type: #RMQComponent opposite:#tenants>
	^ component
]

{ #category : #accessing }
RMQTenant >> component: anObject [
	component := anObject
]

{ #category : #accessing }
RMQTenant >> tenantId [
	^ self pulseName
]

{ #category : #accessing }
RMQTenant >> tenantId: anObject [
	self pulseName: anObject
]
