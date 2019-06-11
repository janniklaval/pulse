Extension { #name : #RMQBinding }

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateDestination: anObject [
	destination := anObject
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privatePulseName [

	pulseName ifNil: [ 
		(self source isNil or: [ self destination isNil ]) ifFalse: [ self pulseName: (self source name, '>', self destination name) ]  ].
	^ pulseName
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateRoutingKey [
	^ routingKey
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateRoutingKey: anObject [
	routingKey := anObject
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateSource [
	^ source
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateSource: anObject [
	source := anObject
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQBinding >> privateVhost: anObject [
	vhost := anObject
]
