Trait {
	#name : #TRMQConnection,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQConnection classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQConnection >> authMechanism [
	^ self authMechanismOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> authMechanismOR: aVersion [
	^ self privateAuthMechanism versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> channels [
	^ self channelsOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> channelsOR: aVersion [
	^ self privateChannels versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> closingDate [
	^ self closingDateOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> closingDateOR: aVersion [
	^ self privateClosingDate versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> connectedAt [
	^ self connectedAtOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> connectedAtOR: aVersion [
	^ self privateConnectedAt versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> connectionType [
	^ self connectionTypeOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> connectionTypeOR: aVersion [
	^ self privateConnectionType versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> host [
	^ self hostOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> hostOR: aVersion [
	^ self privateHost versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> peerHost [
	^ self peerHostOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> peerHostOR: aVersion [
	^ self privatePeerHost versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> peerPort [
	^ self peerPortOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> peerPortOR: aVersion [
	^ self privatePeerPort versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> pid [
	^ self pidOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> pidOR: aVersion [
	^ self privatePid versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> port [
	^ self portOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> portOR: aVersion [
	^ self privatePort versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> protocol [
	^ self protocolOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> protocolOR: aVersion [
	^ self privateProtocol versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> rmqState [
	^ self rmqStateOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> rmqStateOR: aVersion [
	^ self privateRmqState versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> ssl [
	^ self sslOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> sslHash [
	^ self sslHashOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> sslHashOR: aVersion [
	^ self privateSslHash versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> sslOR: aVersion [
	^ self privateSsl versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> sslProtocol [ 
	^ self sslProtocolOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> sslProtocolOR: aVersion [
	^ self privateSslProtocol versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> user [
	^ self userOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> userOR: aVersion [
	^ self privateUser versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> user_who_performed_connection [
	^ self user_who_performed_connectionOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> user_who_performed_connectionOR: aVersion [
	^ self private_user_who_performed_connection versionIn: aVersion
]

{ #category : #accessing }
TRMQConnection >> vhost [
	^ self vhostOR: self currentContext
]

{ #category : #accessing }
TRMQConnection >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion
]
