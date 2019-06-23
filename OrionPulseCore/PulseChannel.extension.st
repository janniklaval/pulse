Extension { #name : #PulseChannel }

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateClosingDate [
	^ closingDate
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateClosingDate: anObject [
	closingDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateConnection [
	^ connection
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateConnection: anObject [
	connection := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateConsumedQueues [
	^ consumedQueues
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateConsumedQueues: anObject [
	consumedQueues := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateGlobalPrefetchCount [
	^ globalPrefetchCount
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateGlobalPrefetchCount: anObject [
	globalPrefetchCount := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateGuaranteeMode [
	^ guaranteeMode ifNil: [ self guaranteeMode: PulseGuaranteeMode none.  guaranteeMode]
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateGuaranteeMode: anObject [
	guaranteeMode := self selectEnum: anObject. 
	guaranteeMode channels add: self.
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateIdleSince [
	^ idleSince
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateIdleSince: anObject [
	idleSince := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privatePid [
	^ pid
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privatePid: anObject [
	pid := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privatePrefetchCount [
	^ prefetchCount
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privatePrefetchCount: anObject [
	prefetchCount := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> private_user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #'*OrionPulseCore' }
PulseChannel >> private_user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]
