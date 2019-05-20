Extension { #name : #AuthMechanism }

{ #category : #'*OrionPulseCore' }
AuthMechanism >> privateConnections [
	^ connections
]

{ #category : #'*OrionPulseCore' }
AuthMechanism >> privateConnections: anObject [
	connections := anObject
]
