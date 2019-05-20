Extension { #name : #RMQPermission }

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateConfigureValue [
	^ configureValue
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateConfigureValue: anObject [
	configureValue := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateName [
	^ vhost mooseName, '.', user mooseName, '>', configureValue mooseName, '_', writeValue mooseName, '_', readValue mooseName
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateReadValue [
	^ readValue
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateReadValue: anObject [
	readValue := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateWriteValue [
	^ writeValue
]

{ #category : #'*OrionPulseCore' }
RMQPermission >> privateWriteValue: anObject [
	writeValue := anObject
]
