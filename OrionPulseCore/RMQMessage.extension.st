Extension { #name : #RMQMessage }

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateDeliveryMode [
	^ deliveryMode
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateDeliveryMode: anObject [
	deliveryMode := self selectEnum: anObject. 
	deliveryMode messages add: self.
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateEncrypted [
	^ encrypted
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateEncrypted: anObject [
	encrypted := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateExchange [
	^ exchange
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateExchange: anObject [
	exchange := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateExchangeFormat [
	^ exchangeFormat
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateExchangeFormat: anObject [
	exchangeFormat := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateMessageID [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateMessageID: anObject [
	^ self pulseName: anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateMessageType [
	^ messageType
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateMessageType: anObject [
	messageType := self selectEnum: anObject. 
	messageType messages add: self.
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privatePayload [
	^ payload
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privatePayload: anObject [
	payload := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privatePriority [
	^ priority
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privatePriority: anObject [
	priority := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateQueue [
	^ queue
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateQueue: anObject [
	queue := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateRedelivered [
	^ redelivered
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateRedelivered: anObject [
	redelivered := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateRoutedQueues [
	^ routedQueues
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateRoutedQueues: anObject [
	routedQueues := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateSenderComponent [
	^ senderComponent
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateSenderComponent: anObject [
	senderComponent := anObject
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateTimestamp [
	^ timestamp
]

{ #category : #'*OrionPulseCore' }
RMQMessage >> privateTimestamp: anObject [
	timestamp := anObject
]
