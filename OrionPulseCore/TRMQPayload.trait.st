Trait {
	#name : #TRMQPayload,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQPayload classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQPayload >> encoding [
	^ self encodingOR: self currentContext 
]

{ #category : #accessing }
TRMQPayload >> encodingOR: aVersion [
	^ self privateEncoding versionIn: aVersion 
]

{ #category : #accessing }
TRMQPayload >> messages [
	^ self messagesOR: self currentContext 
]

{ #category : #accessing }
TRMQPayload >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion 
]

{ #category : #accessing }
TRMQPayload >> size_byte [
	^ self size_byteOR: self currentContext 
]

{ #category : #accessing }
TRMQPayload >> size_byteOR: aVersion [
	^ self private_size_byte versionIn: aVersion 
]
