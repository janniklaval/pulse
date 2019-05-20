Trait {
	#name : #TRMQMessage,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQMessage classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQMessage >> deliveryMode [
	^ self deliveryModeOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> deliveryModeOR: aVersion [
	^ self privateDeliveryMode versionIn: aVersion 
]

{ #category : #accessing }
TRMQMessage >> encrypted [
	^ self encryptedOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> encryptedOR: aVersion [
	^ self privateEncrypted versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> exchange [
	^ self exchangeOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> exchangeFormat [
	^ self exchangeFormatOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> exchangeFormatOR: aVersion [
	^ self privateExchangeFormat versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> exchangeOR: aVersion [
	^ self privateExchange versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> messageID [
	^ self messageIDOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> messageIDOR: aVersion [
	^ self privateMessageID versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> messageType [
	^ self messageTypeOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> messageTypeOR: aVersion [
	^ self privateMessageType versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> payload [
	^ self payloadOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> payloadOR: aVersion [
	^ self privatePayload versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> priority [
	^ self priorityOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> priorityOR: aVersion [
	^ self privatePriority versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> queue [
	^ self queueOR: self currentContext
]

{ #category : #accessing }
TRMQMessage >> queueOR: aVersion [
	^ self privateQueue versionIn: aVersion 
]

{ #category : #accessing }
TRMQMessage >> redelivered [
	^ self redeliveredOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> redeliveredOR: aVersion [
	^ self privateRedelivered versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> routedQueues [
	^ self routedQueuesOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> routedQueuesOR: aVersion [
	^ self privateRoutedQueues versionIn: aVersion 
]

{ #category : #accessing }
TRMQMessage >> senderComponent [
	^ self senderComponentOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> senderComponentOR: aVersion [
	^ self privateSenderComponent versionIn: aVersion
]

{ #category : #accessing }
TRMQMessage >> timestamp [
	^ self timestampOR: self currentContext 
]

{ #category : #accessing }
TRMQMessage >> timestampOR: aVersion [
	^ self privateTimestamp versionIn: aVersion
]
