Extension { #name : #Encoding }

{ #category : #'*OrionPulseCore' }
Encoding >> privatePayloads [
	^ payloads
]

{ #category : #'*OrionPulseCore' }
Encoding >> privatePayloads: anObject [
	payloads := anObject
]
