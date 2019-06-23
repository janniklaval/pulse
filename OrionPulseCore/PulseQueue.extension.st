Extension { #name : #PulseQueue }

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateAutoDelete [
	^ autoDelete
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateAutoDelete: anObject [
	autoDelete := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateConsumerChannels [
	^ consumerChannels
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateConsumerChannels: anObject [
	consumerChannels := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDestinationBindings [
	^ destinationBindings
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDestinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDurability [
	^ durability
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateDurability: anObject [
	durability := anObject. 
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateExclusive [
	^ exclusive
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateExclusive: anObject [
	exclusive := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateExpiresAfter [
	^ expiresAfter
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateExpiresAfter: anObject [
	expiresAfter := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateIdleSince [
	^ idleSince
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateIdleSince: anObject [
	idleSince := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxLength [
	^ maxLength
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxLength: anObject [
	maxLength := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxLengthBytes [
	^ maxLengthBytes
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxLengthBytes: anObject [
	maxLengthBytes := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxPriority [
	^ maxPriority
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMaxPriority: anObject [
	maxPriority := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMessageTTL [
	^ messageTTL
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateMessageTTL: anObject [
	messageTTL := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> private_dead_letter_exchange [
	^ dead_letter_exchange
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> private_dead_letter_exchange: anObject [
	dead_letter_exchange := anObject
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> private_dead_letter_routing_key [
	^ dead_letter_routing_key
]

{ #category : #'*OrionPulseCore' }
PulseQueue >> private_dead_letter_routing_key: anObject [
	dead_letter_routing_key := anObject
]
