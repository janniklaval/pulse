Extension { #name : #State }

{ #category : #'*OrionPulseCore' }
State >> privateChannels [
	^ channels
]

{ #category : #'*OrionPulseCore' }
State >> privateChannels: anObject [
	channels := anObject
]

{ #category : #'*OrionPulseCore' }
State >> privateConnections [
	^ connections
]

{ #category : #'*OrionPulseCore' }
State >> privateConnections: anObject [
	connections := anObject
]

{ #category : #'*OrionPulseCore' }
State >> privateQueues [
	^ queues
]

{ #category : #'*OrionPulseCore' }
State >> privateQueues: anObject [
	queues := anObject
]
