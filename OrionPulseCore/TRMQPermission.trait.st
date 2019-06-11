Trait {
	#name : #TRMQPermission,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQPermission classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQPermission >> configureValue [
	^ self configureValueOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> configureValueOR: aVersion [
	^ self privateConfigureValue versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> creationDate [
	^ self creationDateOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> deletionDate [
	^ self deletionDateOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQPermission >> name [
	^ self nameOR: self currentContext
]

{ #category : #accessing }
TRMQPermission >> nameOR: aVersion [
	^ self privateName versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> readValue [
	^ self readValueOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> readValueOR: aVersion [
	^ self privateReadValue versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> user [
	^ self userOR: self currentContext
]

{ #category : #accessing }
TRMQPermission >> userOR: aVersion [
	^ self privateUser versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> vhost [
	^ self vhostOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion 
]

{ #category : #accessing }
TRMQPermission >> writeValue [
	^ self writeValueOR: self currentContext 
]

{ #category : #accessing }
TRMQPermission >> writeValueOR: aVersion [
	^ self privateWriteValue versionIn: aVersion 
]
