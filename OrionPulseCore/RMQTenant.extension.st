Extension { #name : #RMQTenant }

{ #category : #'*OrionPulseCore' }
RMQTenant >> privateComponent [
	^ component
]

{ #category : #'*OrionPulseCore' }
RMQTenant >> privateComponent: anObject [
	component := anObject
]

{ #category : #'*OrionPulseCore' }
RMQTenant >> privateTenantId [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
RMQTenant >> privateTenantId: anObject [
	self pulseName: anObject
]
