Trait {
	#name : #TRMQHost,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQHost classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQHost >> bindings [
	^ self bindingsOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> bindingsOR: aVersion [
	^ self privateBindings versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> channels [
	^ self channelsOR: self currentContext
]

{ #category : #accessing }
TRMQHost >> channelsOR: aVersion [
	^ self privateChannels versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> connections [
	^ self connectionsOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> connectionsOR: aVersion [
	^ self privateConnections versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> creationDate [
	^ self creationDateOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQHost >> deletionDate [
	^ self deletionDateOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> exchanges [
	^ self exchangesOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> node [
	^ self nodeOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> nodeOR: aVersion [
	^ self privateNode versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> permissions [
	^ self permissionsOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> permissionsOR: aVersion [
	^ self privatePermissions versionIn: aVersion
]

{ #category : #accessing }
TRMQHost >> queues [
	^ self queuesOR: self currentContext
]

{ #category : #accessing }
TRMQHost >> queuesOR: aVersion [
	^ self privateQueues versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> tracing [
	^ self tracingOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> tracingOR: aVersion [
	^ self privateTracing versionIn: aVersion 
]

{ #category : #accessing }
TRMQHost >> users [
	^ self usersOR: self currentContext 
]

{ #category : #accessing }
TRMQHost >> usersOR: aVersion [
	^ self privateUsers versionIn: aVersion 
]
