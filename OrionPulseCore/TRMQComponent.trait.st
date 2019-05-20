Trait {
	#name : #TRMQComponent,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQComponent classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQComponent >> exchanges [
	^ self exchangesOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> exchangesOR: aVersion [
	^ self privateExchanges versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> exclusive [
	^ self exclusiveOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> exclusiveOR: aVersion [
	^ self privateExclusive versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> guid [
	^ self guidOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> guidOR: aVersion [
	^ self privateGuid versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> owner [
	^ self ownerOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> ownerOR: aVersion [
	^ self privateOwner versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> platform [
	^ self platformOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> platformOR: aVersion [
	^ self privatePlatform versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> pulseName [
	^ self pulseNameOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> pulseNameOR: aVersion [
	^ self privatePulseName versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> rmqState [
	^ self rmqStateOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> senderMessages [
	^ self senderMessagesOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> senderMessagesOR: aVersion [
	^ self privateSenderMessages versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> subscribedChannels [
	^ self subscribedMessagesOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> subscribedChannelsOR: aVersion [
	^ self privateSubscribedChannels versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> tenants [
	^ self tenantsOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> tenantsOR: aVersion [
	^ self privateTenants versionIn: aVersion
]

{ #category : #accessing }
TRMQComponent >> version [
	^ self versionOR: self currentContext
]

{ #category : #accessing }
TRMQComponent >> versionOR: aVersion [
	^ self privateVersion versionIn: aVersion
]
