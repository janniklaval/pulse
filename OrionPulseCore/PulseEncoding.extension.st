Extension { #name : #PulseEncoding }

{ #category : #'*OrionPulseCore' }
PulseEncoding >> privatePayloads [
	^ payloads
]

{ #category : #'*OrionPulseCore' }
PulseEncoding >> privatePayloads: anObject [
	payloads := anObject
]
