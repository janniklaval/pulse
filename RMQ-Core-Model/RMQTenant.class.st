Class {
	#name : #RMQTenant,
	#superclass : #MooseEntity,
	#instVars : [
		'tenantId'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQTenant >> tenantId [
	^ tenantId
]

{ #category : #accessing }
RMQTenant >> tenantId: anObject [
	tenantId := anObject
]
