Extension { #name : #PulseRoutingKey }

{ #category : #'*OrionPulseCore' }
PulseRoutingKey >> privateBinding [
	^ binding
]

{ #category : #'*OrionPulseCore' }
PulseRoutingKey >> privateBinding: anObject [
	binding := anObject
]

{ #category : #'*OrionPulseCore' }
PulseRoutingKey >> private_queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #'*OrionPulseCore' }
PulseRoutingKey >> private_queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]
