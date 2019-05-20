Extension { #name : #MessageType }

{ #category : #'*OrionPulseCore' }
MessageType >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
MessageType >> privateMessages: anObject [
	messages := anObject
]

{ #category : #'*OrionPulseCore' }
MessageType >> privateName [
	^ self rmqState.
]
