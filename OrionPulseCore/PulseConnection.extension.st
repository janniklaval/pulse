Extension { #name : #PulseConnection }

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateAuthMechanism [
	^ authMechanism
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateAuthMechanism: anObject [
	authMechanism := self selectEnum: anObject. 
	authMechanism connections add: self.
	

]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateChannels [
	^ channels
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateChannels: anObject [
	channels := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateClosingDate [
	^ closingDate
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateClosingDate: anObject [
	closingDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateConnectedAt [
	^ connectedAt
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateConnectedAt: anObject [
	connectedAt := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateConnectionType [
	^ connectionType
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateConnectionType: anObject [
	connectionType := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateHost [
	^ host
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateHost: anObject [
	host := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePeerHost [
	^ peerHost
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePeerHost: anObject [
	peerHost := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePeerPort [
	^ peerPort
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePeerPort: anObject [
	peerPort := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePid [
	^ pid
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePid: anObject [
	pid := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePort [
	^ port
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privatePort: anObject [
	port := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateProtocol [
	^ protocol
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateProtocol: anObject [
	protocol := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSsl [
	^ ssl
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSsl: anObject [
	ssl := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSslHash [
	^ sslHash
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSslHash: anObject [
	sslHash := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSslProtocol [
	^ sslProtocol
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateSslProtocol: anObject [
	sslProtocol := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> private_user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #'*OrionPulseCore' }
PulseConnection >> private_user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]
