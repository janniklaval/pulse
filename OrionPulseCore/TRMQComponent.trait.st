Trait {
	#name : #TRMQComponent,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQComponent classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQComponent >> ackRequired [
	^ self ackRequiredOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> ackRequiredOR: aVersion [
	^ self privateAckRequired versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> adress [
	^ self adressOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> adressOR: aVersion [
	^ self privateAdress versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> author [
	^ self authorOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> authorOR: aVersion [
	^ self privateAuthor versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> componentType [
	^ self componentTypeOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> componentTypeOR: aVersion [
	^ self privateComponentType versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> consumerTag [
	^ self consumerTagOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> consumerTagOR: aVersion [
	^ self privateConsumerTag versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> deletionDate [
	^ self deletionDateOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> deploymentMode [
	^ self deploymentModeOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> deploymentModeOR: aVersion [
	^ self privateDeploymentMode versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> exchanges [
	^ self exchangesOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> exclusive [
	^ self exclusiveOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> exclusiveOR: aVersion [
	^ self privateExclusive versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> guid [
	^ self guidOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> guidOR: aVersion [
	^ self privateGuid versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> owner [
	^ self ownerOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> ownerOR: aVersion [
	^ self privateOwner versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> platform [
	^ self platformOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> platformOR: aVersion [
	^ self privatePlatform versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> rmqState [
	^ self rmqStateOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> senderMessages [
	^ self senderMessagesOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> senderMessagesOR: aVersion [
	^ self privateSenderMessages versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> subscribedChannels [
	^ self subscribedChannelsOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> subscribedChannelsOR: aVersion [
	^ self privateSubscribedChannels versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> tenants [
	^ self tenantsOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> tenantsOR: aVersion [
	^ self privateTenants versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> version [
	^ self versionOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> versionOR: aVersion [
	^ self privateVersion versionIn: aVersion
]
