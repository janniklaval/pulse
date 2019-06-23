Extension { #name : #PulsePublisherComponent }

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateAuthor [
	^ author
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateAuthor: anObject [
	author := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateComponentType [
	^ componentType
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateComponentType: anObject [
	componentType := self selectEnum: anObject. 
	componentType components add: self.
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateDeploymentMode [
	^ deploymentMode
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateDeploymentMode: anObject [
	deploymentMode := self selectEnum: anObject. 
	deploymentMode components add: self.
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateExchanges [
	^ exchanges
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateExchanges: anObject [
	exchanges := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateGuid [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateGuid: anObject [
	self pulseName: anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateOwner [
	^ owner
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateOwner: anObject [
	owner := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privatePlatform [
	^ platform
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privatePlatform: anObject [
	platform := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privatePulseName: anObject [
	pulseName := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privatePulseState [
	^ pulseState
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privatePulseState: anObject [
	pulseState := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateVersion [
	^ version
]

{ #category : #'*OrionPulseCore' }
PulsePublisherComponent >> privateVersion: anObject [
	version := anObject
]
