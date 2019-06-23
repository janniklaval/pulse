Extension { #name : #PulseTenant }

{ #category : #'*OrionPulseCore' }
PulseTenant >> privateTenantId [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
PulseTenant >> privateTenantId: anObject [
	self pulseName: anObject
]
