Extension { #name : #RMQChannel }

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateClosingDate [
	^ closingDate
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateClosingDate: anObject [
	closingDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateConnection [
	^ connection
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateConnection: anObject [
	connection := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateConsumedQueues [
	^ consumedQueues
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateConsumedQueues: anObject [
	consumedQueues := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateGlobalPrefetchCount [
	^ globalPrefetchCount
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateGlobalPrefetchCount: anObject [
	globalPrefetchCount := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateGuaranteeMode [
	^ guaranteeMode ifNil: [ self guaranteeMode: GuaranteeMode none.  guaranteeMode]
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateGuaranteeMode: anObject [
	guaranteeMode := self selectEnum: anObject. 
	guaranteeMode channels add: self.
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateIdleSince [
	^ idleSince
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateIdleSince: anObject [
	idleSince := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privatePid [
	^ pid
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privatePid: anObject [
	pid := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privatePrefetchCount [
	^ prefetchCount
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privatePrefetchCount: anObject [
	prefetchCount := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateRmqState [
	^ rmqState ifNil: [ self rmqState: State idle.  rmqState]
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateRmqState: anObject [
	rmqState := self selectEnum: anObject. 
	rmqState channels add: self.
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateSubscribedComponent [
	^ subscribedComponent
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateSubscribedComponent: anObject [
	subscribedComponent := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> private_user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #'*OrionPulseCore' }
RMQChannel >> private_user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]
