Extension { #name : #PulseBinding }

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privatePulseName [

	pulseName ifNil: [ 
		(self source isNil or: [ self destination isNil ]) ifFalse: [ self pulseName: (self source name, '>', self destination name) ]  ].
	^ pulseName
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateRoutingKey [
	^ routingKey
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateRoutingKey: anObject [
	routingKey := anObject
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateSource [
	^ source
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateSource: anObject [
	source := anObject
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulseBinding >> privateVhost: anObject [
	vhost := anObject
]
