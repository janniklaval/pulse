Trait {
	#name : #TRMQBinding,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQBinding classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQBinding >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQBinding >> deletionDate [
	^ self deletionDateOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQBinding >> pulseName [
	^ self pulseNameOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> pulseNameOR: aVersion [
	^ self privatePulseName versionIn: aVersion
]

{ #category : #accessing }
TRMQBinding >> routingKey [
	^ self routingKeyOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> routingKeyOR: aVersion [
	^ self privateRoutingKey versionIn: aVersion
]

{ #category : #accessing }
TRMQBinding >> source [
	^ self sourceOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> sourceOR: aVersion [
	^ self privateSource versionIn: aVersion
]

{ #category : #accessing }
TRMQBinding >> vhost [
	^ self vhostOR: self currentContext
]

{ #category : #accessing }
TRMQBinding >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion
]
