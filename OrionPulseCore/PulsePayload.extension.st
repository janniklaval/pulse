Extension { #name : #PulsePayload }

{ #category : #'*OrionPulseCore' }
PulsePayload >> privateEncoding [
	^ encoding
]

{ #category : #'*OrionPulseCore' }
PulsePayload >> privateEncoding: anObject [
	encoding := self selectEnum: anObject. 
	encoding payloads add: self.
]

{ #category : #'*OrionPulseCore' }
PulsePayload >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
PulsePayload >> privateMessages: anObject [
	messages := anObject
]
