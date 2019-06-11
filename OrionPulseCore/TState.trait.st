Trait {
	#name : #TState,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TState classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TState >> channels [
	^ self channelsOR: self currentContext
]

{ #category : #accessing }
TState >> channelsOR: aVersion [
	^ self privateChannels versionIn: aVersion
]

{ #category : #accessing }
TState >> connections [
	^ self connectionsOR: self currentContext
]

{ #category : #accessing }
TState >> connectionsOR: aVersion [
	^ self privateConnections versionIn: aVersion
]

{ #category : #accessing }
TState >> queues [
	^ self queuesOR: self currentContext
]

{ #category : #accessing }
TState >> queuesOR: aVersion [
	^ self privateQueues versionIn: aVersion
]
