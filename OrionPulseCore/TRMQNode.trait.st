Trait {
	#name : #TRMQNode,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQNode classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQNode >> cluster [
	^ self clusterOR: self currentContext
]

{ #category : #accessing }
TRMQNode >> clusterOR: aVersion [
	^ self privateCluster versionIn: aVersion
]

{ #category : #accessing }
TRMQNode >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQNode >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQNode >> deletionDate [
	^ self deletionDateOR: self currentContext
]

{ #category : #accessing }
TRMQNode >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQNode >> host [
	^ self hostOR: self currentContext 
]

{ #category : #accessing }
TRMQNode >> hostOR: aVersion [
	^ self privateHost versionIn: aVersion 
]

{ #category : #accessing }
TRMQNode >> port [
	^ self portOR: self currentContext
]

{ #category : #accessing }
TRMQNode >> portOR: aVersion [
	^ self privatePort versionIn: aVersion 
]

{ #category : #accessing }
TRMQNode >> running [
	^ self runningOR: self currentContext 
]

{ #category : #accessing }
TRMQNode >> runningOR: aVersion [
	^ self privateRunning versionIn: aVersion 
]

{ #category : #accessing }
TRMQNode >> type [
	^ self typeOR: self currentContext 
]

{ #category : #accessing }
TRMQNode >> typeOR: aVersion [
	^ self privateType versionIn: aVersion
]

{ #category : #accessing }
TRMQNode >> vhost [
	^self vhostOR: self currentContext 
]

{ #category : #accessing }
TRMQNode >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion 
]
