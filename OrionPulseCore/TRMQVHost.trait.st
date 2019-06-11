Trait {
	#name : #TRMQVHost,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQVHost classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQVHost >> bindings [
	^ self bindingsOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> bindingsOR: aVersion [
	^ self privateBindings versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> channels [
	^ self channelsOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> channelsOR: aVersion [
	^ self privateChannels versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> connections [
	^ self connectionsOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> connectionsOR: aVersion [
	^ self privateConnections versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQVHost >> deletionDate [
	^ self deletionDateOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> exchanges [
	^ self exchangesOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion 
]

{ #category : #accessing }
TRMQVHost >> node [
	^ self nodeOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> nodeOR: aVersion [
	^ self privateNode versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> permissions [
	^ self permissionsOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> permissionsOR: aVersion [
	^ self privatePermissions versionIn: aVersion
]

{ #category : #accessing }
TRMQVHost >> queues [
	^ self queuesOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> queuesOR: aVersion [
	^ self privateQueues versionIn: aVersion 
]

{ #category : #accessing }
TRMQVHost >> tracing [
	^ self tracingOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> tracingOR: aVersion [
	^ self privateTracing versionIn: aVersion 
]

{ #category : #accessing }
TRMQVHost >> users [
	^ self usersOR: self currentContext
]

{ #category : #accessing }
TRMQVHost >> usersOR: aVersion [
	^ self privateUsers versionIn: aVersion
]
