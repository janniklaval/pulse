Class {
	#name : #PulseConnection,
	#superclass : #PulseEntity,
	#instVars : [
		'#closingDate',
		'#connectedAt',
		'#connectionType',
		'#creationDate',
		'#host',
		'#peerHost',
		'#peerPort',
		'#pid',
		'#port',
		'#protocol',
		'#ssl',
		'#sslHash',
		'#sslProtocol',
		'#authMechanism => FMOne type: #PulseAuthMechanism opposite: #connections',
		'#pulseState => FMOne type: #PulseState opposite: #connections',
		'#channels => FMMany type: #PulseChannel opposite: #connection',
		'#user => FMOne type: #PulseUser opposite: #usedConnections',
		'#user_who_performed_connection => FMOne type: #PulseUser opposite: #initializedConnections',
		'#vhost => FMOne type: #PulseVHost opposite: #connections'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseConnection class >> annotation [

	<MSEClass: #Connection super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseConnection class >> generatedSlotNames [
	<generated>
	'PulseConnection class>>#generatedSlotNames'.
	^ #(authMechanism channels closingDate connectedAt connectionType creationDate host peerHost peerPort pid port protocol pulseState ssl sslHash sslProtocol user user_who_performed_connection vhost)
]

{ #category : #generator }
PulseConnection class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseConnection class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseConnection >> authMechanism [

	<generated>
	<MSEComment: 'TODO'>
	^ authMechanism
]

{ #category : #accessing }
PulseConnection >> authMechanism: anObject [

	<generated>
	authMechanism := anObject

]

{ #category : #accessing }
PulseConnection >> channels [

	<generated>
	<MSEComment: 'TODO'>
	^ channels
]

{ #category : #accessing }
PulseConnection >> channels: anObject [

	<generated>
	channels value: anObject

]

{ #category : #accessing }
PulseConnection >> closingDate [

	<MSEProperty: #closingDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ closingDate
]

{ #category : #accessing }
PulseConnection >> closingDate: anObject [

	<generated>
	closingDate := anObject

]

{ #category : #accessing }
PulseConnection >> connectedAt [

	<MSEProperty: #connectedAt type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ connectedAt
]

{ #category : #accessing }
PulseConnection >> connectedAt: anObject [

	<generated>
	connectedAt := anObject

]

{ #category : #accessing }
PulseConnection >> connectionType [

	<MSEProperty: #connectionType type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ connectionType
]

{ #category : #accessing }
PulseConnection >> connectionType: anObject [

	<generated>
	connectionType := anObject

]

{ #category : #accessing }
PulseConnection >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseConnection >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseConnection >> host [

	<MSEProperty: #host type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ host
]

{ #category : #accessing }
PulseConnection >> host: anObject [

	<generated>
	host := anObject

]

{ #category : #accessing }
PulseConnection >> peerHost [

	<MSEProperty: #peerHost type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ peerHost
]

{ #category : #accessing }
PulseConnection >> peerHost: anObject [

	<generated>
	peerHost := anObject

]

{ #category : #accessing }
PulseConnection >> peerPort [

	<MSEProperty: #peerPort type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ peerPort
]

{ #category : #accessing }
PulseConnection >> peerPort: anObject [

	<generated>
	peerPort := anObject

]

{ #category : #accessing }
PulseConnection >> pid [

	<MSEProperty: #pid type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ pid
]

{ #category : #accessing }
PulseConnection >> pid: anObject [

	<generated>
	pid := anObject

]

{ #category : #accessing }
PulseConnection >> port [

	<MSEProperty: #port type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ port
]

{ #category : #accessing }
PulseConnection >> port: anObject [

	<generated>
	port := anObject

]

{ #category : #accessing }
PulseConnection >> protocol [

	<MSEProperty: #protocol type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ protocol
]

{ #category : #accessing }
PulseConnection >> protocol: anObject [

	<generated>
	protocol := anObject

]

{ #category : #accessing }
PulseConnection >> pulseState [

	<generated>
	<MSEComment: 'TODO'>
	^ pulseState
]

{ #category : #accessing }
PulseConnection >> pulseState: anObject [

	<generated>
	pulseState := anObject

]

{ #category : #accessing }
PulseConnection >> ssl [

	<MSEProperty: #ssl type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ ssl
]

{ #category : #accessing }
PulseConnection >> ssl: anObject [

	<generated>
	ssl := anObject

]

{ #category : #accessing }
PulseConnection >> sslHash [

	<MSEProperty: #sslHash type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ sslHash
]

{ #category : #accessing }
PulseConnection >> sslHash: anObject [

	<generated>
	sslHash := anObject

]

{ #category : #accessing }
PulseConnection >> sslProtocol [

	<MSEProperty: #sslProtocol type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ sslProtocol
]

{ #category : #accessing }
PulseConnection >> sslProtocol: anObject [

	<generated>
	sslProtocol := anObject

]

{ #category : #accessing }
PulseConnection >> user [

	<generated>
	<MSEComment: 'TODO'>
	^ user
]

{ #category : #accessing }
PulseConnection >> user: anObject [

	<generated>
	user := anObject

]

{ #category : #accessing }
PulseConnection >> user_who_performed_connection [

	<generated>
	<MSEComment: 'TODO'>
	^ user_who_performed_connection
]

{ #category : #accessing }
PulseConnection >> user_who_performed_connection: anObject [

	<generated>
	user_who_performed_connection := anObject

]

{ #category : #accessing }
PulseConnection >> vhost [

	<generated>
	<MSEComment: 'TODO'>
	^ vhost
]

{ #category : #accessing }
PulseConnection >> vhost: anObject [

	<generated>
	vhost := anObject

]
