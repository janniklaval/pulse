Extension { #name : #RMQConnection }

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateAuthMechanism [
	^ authMechanism
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateAuthMechanism: anObject [
	authMechanism := self selectEnum: anObject. 
	authMechanism connections add: self.
	

]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateChannels [
	^ channels
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateChannels: anObject [
	channels := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateClosingDate [
	^ closingDate
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateClosingDate: anObject [
	closingDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateConnectedAt [
	^ connectedAt
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateConnectedAt: anObject [
	connectedAt := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateConnectionType [
	^ connectionType
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateConnectionType: anObject [
	connectionType := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateHost [
	^ host
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateHost: anObject [
	host := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePeerHost [
	^ peerHost
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePeerHost: anObject [
	peerHost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePeerPort [
	^ peerPort
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePeerPort: anObject [
	peerPort := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePid [
	^ pid
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePid: anObject [
	pid := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePort [
	^ port
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privatePort: anObject [
	port := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateProtocol [
	^ protocol
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateProtocol: anObject [
	protocol := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateRmqState [
	^ rmqState ifNil: [ self rmqState: State idle.  rmqState]
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateRmqState: anObject [
	rmqState := self selectEnum: anObject. 
	rmqState connections add: self.
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSsl [
	^ ssl
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSsl: anObject [
	ssl := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSslHash [
	^ sslHash
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSslHash: anObject [
	sslHash := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSslProtocol [
	^ sslProtocol
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateSslProtocol: anObject [
	sslProtocol := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateUser: anObject [
	user := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> private_user_who_performed_connection [
	^ user_who_performed_connection
]

{ #category : #'*OrionPulseCore' }
RMQConnection >> private_user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]
