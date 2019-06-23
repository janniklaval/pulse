Extension { #name : #PulseMessage }

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateDeliveryMode [
	^ deliveryMode
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateDeliveryMode: anObject [
	deliveryMode := self selectEnum: anObject. 
	deliveryMode messages add: self.
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateEncrypted [
	^ encrypted
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateEncrypted: anObject [
	encrypted := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateExchangeFormat [
	^ exchangeFormat
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateExchangeFormat: anObject [
	exchangeFormat := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateMessageID [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateMessageID: anObject [
	^ self pulseName: anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateMessageType [
	^ messageType
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateMessageType: anObject [
	messageType := self selectEnum: anObject. 
	messageType messages add: self.
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privatePayload [
	^ payload
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privatePayload: anObject [
	payload := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privatePriority [
	^ priority
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privatePriority: anObject [
	priority := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateRedelivered [
	^ redelivered
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateRedelivered: anObject [
	redelivered := anObject
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateTimestamp [
	^ timestamp
]

{ #category : #'*OrionPulseCore' }
PulseMessage >> privateTimestamp: anObject [
	timestamp := anObject
]
