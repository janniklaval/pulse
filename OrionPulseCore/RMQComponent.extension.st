Extension { #name : #RMQComponent }

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAckRequired [
	^ ackRequired
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAckRequired: anObject [
	ackRequired := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAdress [
	^ adress
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAdress: anObject [
	adress := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAuthor [
	^ author
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateAuthor: anObject [
	author := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateComponentType [
	^ componentType
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateComponentType: anObject [
	componentType := self selectEnum: anObject. 
	componentType components add: self.
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateConsumerTag [
	^ consumerTag
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateConsumerTag: anObject [
	consumerTag := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateDeploymentMode [
	^ deploymentMode
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateDeploymentMode: anObject [
	deploymentMode := self selectEnum: anObject. 
	deploymentMode components add: self.
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateExchanges [
	^ exchanges
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateExchanges: anObject [
	exchanges := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateExclusive [
	^ exclusive
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateExclusive: anObject [
	exclusive := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateGuid [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateGuid: anObject [
	self pulseName: anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateOwner [
	^ owner
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateOwner: anObject [
	owner := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privatePlatform [
	^ platform
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privatePlatform: anObject [
	platform := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privatePulseName [
	^ consumerTag
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privatePulseName: anObject [
	pulseName := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateRmqState [
	^ rmqState
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateRmqState: anObject [
	rmqState := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateSenderMessages [
	^ senderMessages
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateSenderMessages: anObject [
	senderMessages := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateSubscribedChannels [
	^ subscribedChannels
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateSubscribedChannels: anObject [
	subscribedChannels := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateTenants [
	^ tenants
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateTenants: anObject [
	tenants := anObject
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateVersion [
	^ version
]

{ #category : #'*OrionPulseCore' }
RMQComponent >> privateVersion: anObject [
	version := anObject
]
