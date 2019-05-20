Trait {
	#name : #TRMQUser,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQUser classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQUser >> authentifications [
	^ self authentificationsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> authentificationsOR: aVersion [
	^ self privateAuthentifications versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> creationDate [
	^ self creationDateOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> deletionDate [
	^ self deletionDateOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> hashingAlgorithm [
	^ self hashingAlgorithmOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> hashingAlgorithmOR: aVersion [
	^ self privateHashingAlgorithm versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> initializedChannels [
	^ self initializedChannelsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> initializedChannelsOR: aVersion [
	^ self privateInitializedChannels versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> initializedConnections [
	^ self initializedConnectionsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> initializedConnectionsOR: aVersion [
	^ self privateInitializedConnections versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> initializedExchanges [
	^ self initializedExchangesOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> initializedExchangesOR: aVersion [
	^ self privateInitializedExchanges versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> password [
	^ self passwordOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> passwordChangingDate [
	^ self passwordChangingDateOR: self currentContext
]

{ #category : #accessing }
TRMQUser >> passwordChangingDateOR: aVersion [
	^ self privatePasswordChangingDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> passwordClearingDate [
	^ self passwordClearingDateOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> passwordClearingDateOR: aVersion [
	^ self privatePasswordClearingDate versionIn: aVersion
]

{ #category : #accessing }
TRMQUser >> passwordHash [
	^ self passwordHashOR: self currentContext
]

{ #category : #accessing }
TRMQUser >> passwordHashOR: aVersion [
	^ self privatePasswordHash versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> passwordOR: aVersion [
	^ self privatePassword versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> permissions [
	^ self permissionsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> permissionsOR: aVersion [
	^ self privatePermissions versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> roles [
	^ self rolesOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> rolesOR: aVersion [
	^ self privateRoles versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> usedChannels [
	^ self usedChannelsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> usedChannelsOR: aVersion [
	^ self privateUsedChannels versionIn: aVersion 
]

{ #category : #accessing }
TRMQUser >> usedConnections [
	^ self usedConnectionsOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> usedConnectionsOR: aVersion [
	^ self privateUsedConnections versionIn: aVersion
]

{ #category : #accessing }
TRMQUser >> vhost [
	^self vhostOR: self currentContext 
]

{ #category : #accessing }
TRMQUser >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion 
]
