Extension { #name : #MooseModel }

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allDeliveryModes [
	<navigation: 'All delivery modes group'>
	^self allWithType: DeliveryMode
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: MessageType
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQAuthentification [
	<navigation: 'All RMQ authentification group'>
	^self allWithType: RMQAuthentification
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQBindings [
	<navigation: 'All RMQ Bindings group'>
	^self allWithType: RMQBinding
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQChannels [
	<navigation: 'All RMQ channels group'>
	^self allWithType: RMQChannel
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQClusters [
	<navigation: 'All RMQ clusters group'>
	^self allWithType: RMQCluster
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQComponents [
	<navigation: 'All RMQ components group'>
	^self allWithType: RMQComponent
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQConnections [
	<navigation: 'All RMQ connections group'>
	^self allWithType: RMQConnection
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQExchangeFormats [
	<navigation: 'All RMQ exchange formats group'>
	^self allWithType: RMQExchangeFormat
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQExchanges [
	<navigation: 'All RMQ exchanges group'>
	^self allWithType: RMQExchange
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQHeaders [
	<navigation: 'All RMQ headers group'>
	^self allWithType: RMQHeader
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQMessages [
	<navigation: 'All RMQ messages group'>
	^self allWithType: RMQMessage
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQNodes [
	<navigation: 'All RMQ nodes group'>
	^self allWithType: RMQNode
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQPayloads [
	<navigation: 'All RMQ payloads group'>
	^self allWithType: RMQPayload
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQPermissions [
	<navigation: 'All RMQ permissions group'>
	^self allWithType: RMQPermission
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQProperties [
	<navigation: 'All RMQ properties group'>
	^self allWithType: RMQProperty
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQQueues [
	<navigation: 'All RMQ queues group'>
	^self allWithType: RMQQueue
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQRoles [
	<navigation: 'All RMQ roles group'>
	^self allWithType: RMQRole
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQRoutingKeys [
	<navigation: 'All RMQ routing keys group'>
	^self allWithType: RMQRoutingKey
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQUsers [
	<navigation: 'All RMQ users group'>
	^self allWithType: RMQUser
]

{ #category : #'*RMQ-Core-Model' }
MooseModel >> allRMQVHosts [
	<navigation: 'All RMQ vhosts group'>
	^self allWithType: RMQVHost
]
