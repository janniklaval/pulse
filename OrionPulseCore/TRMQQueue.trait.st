Trait {
	#name : #TRMQQueue,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQQueue classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQQueue >> autoDelete [
	^ self autoDeleteOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> autoDeleteOR: aVersion [
	^ self privateAutoDelete versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> consumerChannels [
	^ self consumerChannelsOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> consumerChannelsOR: aVersion [
	^ self privateConsumerChannels versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQQueue >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQQueue >> dead_letter_exchange [
	^ self dead_letter_exchangeOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> dead_letter_exchangeOR: aVersion [
	^ self private_dead_letter_exchange versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> dead_letter_routing_key [
	^ self dead_letter_routing_keyOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> dead_letter_routing_keyOR: aVersion [
	^ self private_dead_letter_routing_key versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> deletionDate [
	^ self deletionDateOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> destinationBindings [
	^ self destinationBindingsOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> destinationBindingsOR: aVersion [
	^ self privateDestinationBindings versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> durability [
	^ self durabilityOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> durabilityOR: aVersion [
	^ self privateDurability versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> exclusive [
	^ self exclusiveOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> exclusiveOR: aVersion [
	^ self privateExclusive versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> expiresAfter [
	^ self expiresAfterOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> expiresAfterOR: aVersion [
	^ self privateExpiresAfter versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> idleSince [
	^ self idleSinceOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> idleSinceOR: aVersion [
	^ self privateIdleSince versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> maxLength [
	^ self maxLengthOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> maxLengthBytes [
	^ self maxLengthBytesOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> maxLengthBytesOR: aVersion [
	^ self privateMaxLengthBytes versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> maxLengthOR: aVersion [
	^ self privateMaxLength versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> maxPriority [
	^ self maxPriorityOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> maxPriorityOR: aVersion [
	^ self privateMaxPriority versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> messageTTL [
	^ self messageTTLOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> messageTTLOR: aVersion [
	^ self privateMessageTTL versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> messages [
	^ self messagesOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> rmqState [
	^ self rmqStateOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> sendedMessages [
	^ self sendedMessagesOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> sendedMessagesOR: aVersion [
	^ self privateSendedMessages versionIn: aVersion 
]

{ #category : #accessing }
TRMQQueue >> vhost [
	^ self vhostOR: self currentContext 
]

{ #category : #accessing }
TRMQQueue >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion
]
