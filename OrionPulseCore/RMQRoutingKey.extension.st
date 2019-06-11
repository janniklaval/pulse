Extension { #name : #RMQRoutingKey }

{ #category : #'*OrionPulseCore' }
RMQRoutingKey >> privateBinding [
	^ binding
]

{ #category : #'*OrionPulseCore' }
RMQRoutingKey >> privateBinding: anObject [
	binding := anObject
]

{ #category : #'*OrionPulseCore' }
RMQRoutingKey >> private_queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #'*OrionPulseCore' }
RMQRoutingKey >> private_queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]
