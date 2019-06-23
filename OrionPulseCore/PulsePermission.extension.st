Extension { #name : #PulsePermission }

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateConfigureValue [
	^ configureValue
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateConfigureValue: anObject [
	configureValue := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateName [
	^ vhost mooseName, '.', user mooseName, '>', configureValue mooseName, '_', writeValue mooseName, '_', readValue mooseName
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateReadValue [
	^ readValue
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateReadValue: anObject [
	readValue := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateWriteValue [
	^ writeValue
]

{ #category : #'*OrionPulseCore' }
PulsePermission >> privateWriteValue: anObject [
	writeValue := anObject
]
