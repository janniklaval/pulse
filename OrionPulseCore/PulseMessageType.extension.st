Extension { #name : #PulseMessageType }

{ #category : #'*OrionPulseCore' }
PulseMessageType >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
PulseMessageType >> privateMessages: anObject [
	messages := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessageType >> privateName [
	^ self rmqState.
]
