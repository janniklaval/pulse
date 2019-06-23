Extension { #name : #PulseAuthMechanism }

{ #category : #'*OrionPulseCore' }
PulseAuthMechanism >> privateConnections [
	^ connections
]

{ #category : #'*OrionPulseCore' }
PulseAuthMechanism >> privateConnections: anObject [
	connections := anObject
]
