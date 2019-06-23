Extension { #name : #PulseState }

{ #category : #'*OrionPulseCore' }
PulseState >> privateChannels [
	^ channels
]

{ #category : #'*OrionPulseCore' }
PulseState >> privateChannels: anObject [
	channels := anObject
]

{ #category : #'*OrionPulseCore' }
PulseState >> privateConnections [
	^ connections
]

{ #category : #'*OrionPulseCore' }
PulseState >> privateConnections: anObject [
	connections := anObject
]

{ #category : #'*OrionPulseCore' }
PulseState >> privateQueues [
	^ queues
]

{ #category : #'*OrionPulseCore' }
PulseState >> privateQueues: anObject [
	queues := anObject
]
