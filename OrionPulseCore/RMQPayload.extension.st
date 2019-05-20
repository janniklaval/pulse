Extension { #name : #RMQPayload }

{ #category : #'*OrionPulseCore' }
RMQPayload >> privateEncoding [
	^ encoding
]

{ #category : #'*OrionPulseCore' }
RMQPayload >> privateEncoding: anObject [
	encoding := self selectEnum: anObject. 
	encoding payloads add: self.
]

{ #category : #'*OrionPulseCore' }
RMQPayload >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
RMQPayload >> privateMessages: anObject [
	messages := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPayload >> private_size_byte [
	^ size_byte
]

{ #category : #'*OrionPulseCore' }
RMQPayload >> private_size_byte: anObject [
	size_byte := anObject
]
