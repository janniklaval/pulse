Extension { #name : #PulseConsumerComponent }

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateAuthor [
	^ author
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateAuthor: anObject [
	author := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateComponentType [
	^ componentType
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateComponentType: anObject [
	componentType := self selectEnum: anObject. 
	componentType components add: self.
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateDeploymentMode [
	^ deploymentMode
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateDeploymentMode: anObject [
	deploymentMode := self selectEnum: anObject. 
	deploymentMode components add: self.
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateGuid [
	^ self pulseName
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateGuid: anObject [
	self pulseName: anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateOwner [
	^ owner
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateOwner: anObject [
	owner := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privatePlatform [
	^ platform
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privatePlatform: anObject [
	platform := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privatePulseName: anObject [
	pulseName := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateSubscribedChannels [
	^ subscribedChannels
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateSubscribedChannels: anObject [
	subscribedChannels := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateVersion [
	^ version
]

{ #category : #'*OrionPulseCore' }
PulseConsumerComponent >> privateVersion: anObject [
	version := anObject
]
