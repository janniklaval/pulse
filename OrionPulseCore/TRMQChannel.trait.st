Trait {
	#name : #TRMQChannel,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQChannel classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQChannel >> closingDate [
	^ self closingDateOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> closingDateOR: aVersion [
	^ self privateClosingDate versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> connection [
	^ self connectionOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> connectionOR: aVersion [
	^ self privateConnection versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> consumedQueues [
	^ self consumedQueuesOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> consumedQueuesOR: aVersion [
	^ self privateConsumedQueues versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> globalPrefetchCount [
	^ self globalPrefetchCountOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> globalPrefetchCountOR: aVersion [
	^ self privateGlobalPrefetchCount versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> guaranteeMode [
	^ self guaranteeModeOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> guaranteeModeOR: aVersion [
	^ self privateGuaranteeMode versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> idleSince [
	^ self idleSinceOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> idleSinceOR: aVersion [
	^ self privateIdleSince versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> pid [
	^ self pidOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> pidOR: aVersion [
	^ self privatePid versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> prefetchCount [
	^ self prefetchCountOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> prefetchCountOR: aVersion [
	^ self privatePrefetchCount versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> rmqState [
	^ self rmqStateOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> subscribedComponent [
	^ self subscribedComponentOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> subscribedComponentOR: aVersion [
	^ self privateSubscribedComponent versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> user [
	^ self userOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> userOR: aVersion [
	^ self privateUser versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> user_who_performed_connection [
	^ self user_who_performed_connectionOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> user_who_performed_connectionOR: aVersion [
	^ self private_user_who_performed_connection versionIn: aVersion
]

{ #category : #accessing }
TRMQChannel >> vhost [
	^ self vhostOR: self currentContext
]

{ #category : #accessing }
TRMQChannel >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion
]
