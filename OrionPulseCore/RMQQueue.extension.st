Extension { #name : #RMQQueue }

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateAutoDelete [
	^ autoDelete
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateAutoDelete: anObject [
	autoDelete := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateConsumerChannels [
	^ consumerChannels
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateConsumerChannels: anObject [
	consumerChannels := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDestinationBindings [
	^ destinationBindings
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDestinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDurability [
	^ durability
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateDurability: anObject [
	durability := anObject. 
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateExclusive [
	^ exclusive
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateExclusive: anObject [
	exclusive := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateExpiresAfter [
	^ expiresAfter
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateExpiresAfter: anObject [
	expiresAfter := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateIdleSince [
	^ idleSince
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateIdleSince: anObject [
	idleSince := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxLength [
	^ maxLength
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxLength: anObject [
	maxLength := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxLengthBytes [
	^ maxLengthBytes
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxLengthBytes: anObject [
	maxLengthBytes := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxPriority [
	^ maxPriority
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMaxPriority: anObject [
	maxPriority := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMessageTTL [
	^ messageTTL
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMessageTTL: anObject [
	messageTTL := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateMessages: anObject [
	messages := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateRmqState [
	^ rmqState ifNil: [ self rmqState: State idle.  rmqState]
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateRmqState: anObject [
	rmqState := self selectEnum: anObject. 
	rmqState queues add: self.
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateSendedMessages [
	^ sendedMessages
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateSendedMessages: anObject [
	sendedMessages := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> private_dead_letter_exchange [
	^ dead_letter_exchange
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> private_dead_letter_exchange: anObject [
	dead_letter_exchange := anObject
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> private_dead_letter_routing_key [
	^ dead_letter_routing_key
]

{ #category : #'*OrionPulseCore' }
RMQQueue >> private_dead_letter_routing_key: anObject [
	dead_letter_routing_key := anObject
]
