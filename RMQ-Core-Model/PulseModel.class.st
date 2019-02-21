Class {
	#name : #PulseModel,
	#superclass : #MooseModel,
	#category : #'RMQ-Core-Model'
}

{ #category : #testing }
PulseModel class >> isVoyageRoot [

	^true
]

{ #category : #accessing }
PulseModel >> allAuthMechanisms [
	<navigation: 'All AuthMechanisms group'>
	^self allWithType: AuthMechanism
]

{ #category : #accessing }
PulseModel >> allComponentTypes [
	<navigation: 'All ComponentTypes group'>
	^self allWithType: ComponentType
]

{ #category : #accessing }
PulseModel >> allDeliveryModes [
	<navigation: 'All delivery modes group'>
	^self allWithType: DeliveryMode
]

{ #category : #accessing }
PulseModel >> allDeploymentModes [
	<navigation: 'All Deployment modes group'>
	^self allWithType: DeploymentMode
]

{ #category : #accessing }
PulseModel >> allDurabilities [
	<navigation: 'All Durabilities group'>
	^self allWithType: Durability
]

{ #category : #accessing }
PulseModel >> allEncodings [
	<navigation: 'All Encodings group'>
	^self allWithType: Encoding
]

{ #category : #accessing }
PulseModel >> allExchangeTypes [
	<navigation: 'All ExchangeTypes group'>
	^self allWithType: ExchangeType
]

{ #category : #accessing }
PulseModel >> allGuaranteeModes [
	<navigation: 'All GuaranteeModes group'>
	^self allWithType: GuaranteeMode
]

{ #category : #accessing }
PulseModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: MessageType
]

{ #category : #accessing }
PulseModel >> allNodeTypes [
	<navigation: 'All NodeTypes group'>
	^self allWithType: NodeType
]

{ #category : #accessing }
PulseModel >> allRMQAuthentifications [
	<navigation: 'All RMQ authentification group'>
	^self allWithType: RMQAuthentification
]

{ #category : #accessing }
PulseModel >> allRMQBindingWithExchanges [
	<navigation: 'All RMQ Bindings with Exchanges group'>
	^self allWithType: RMQBindingWithExchange
]

{ #category : #accessing }
PulseModel >> allRMQBindingWithQueues [
	<navigation: 'All RMQ Bindings with Queues group'>
	^self allWithType: RMQBindingWithQueue
]

{ #category : #accessing }
PulseModel >> allRMQBindings [
	<navigation: 'All RMQ Bindings group'>
	^((self allWithType: RMQBindingWithExchange) union: (self allWithType: RMQBindingWithQueue))
]

{ #category : #accessing }
PulseModel >> allRMQChannels [
	<navigation: 'All RMQ channels group'>
	^self allWithType: RMQChannel
]

{ #category : #accessing }
PulseModel >> allRMQClusters [
	<navigation: 'All RMQ clusters group'>
	^self allWithType: RMQCluster
]

{ #category : #accessing }
PulseModel >> allRMQComponents [
	<navigation: 'All RMQ components group'>
	^self allWithType: RMQComponent
]

{ #category : #accessing }
PulseModel >> allRMQConnections [
	<navigation: 'All RMQ connections group'>
	^self allWithType: RMQConnection
]

{ #category : #accessing }
PulseModel >> allRMQExchangeFormats [
	<navigation: 'All RMQ exchangeFormats group'>
	^self allWithType: RMQExchangeFormat
]

{ #category : #accessing }
PulseModel >> allRMQExchanges [
	<navigation: 'All RMQ exchanges group'>
	^self allWithType: RMQExchange
]

{ #category : #accessing }
PulseModel >> allRMQHeaders [
	<navigation: 'All RMQ headers group'>
	^self allWithType: RMQHeader
]

{ #category : #accessing }
PulseModel >> allRMQMessages [
	<navigation: 'All RMQ messages group'>
	^self allWithType: RMQMessage
]

{ #category : #accessing }
PulseModel >> allRMQNodes [
	<navigation: 'All RMQ nodes group'>
	^self allWithType: RMQNode
]

{ #category : #accessing }
PulseModel >> allRMQPayloads [
	<navigation: 'All RMQ payloads group'>
	^self allWithType: RMQPayload
]

{ #category : #accessing }
PulseModel >> allRMQPermissions [
	<navigation: 'All RMQ permissions group'>
	^self allWithType: RMQPermission
]

{ #category : #accessing }
PulseModel >> allRMQQueues [
	<navigation: 'All RMQ queues group'>
	^self allWithType: RMQQueue
]

{ #category : #accessing }
PulseModel >> allRMQRoles [
	<navigation: 'All RMQ roles group'>
	^self allWithType: RMQRole
]

{ #category : #accessing }
PulseModel >> allRMQRoutingKeys [
	<navigation: 'All RMQ routing keys group'>
	^self allWithType: RMQRoutingKey
]

{ #category : #accessing }
PulseModel >> allRMQUsers [
	<navigation: 'All RMQ users group'>
	^self allWithType: RMQUser
]

{ #category : #accessing }
PulseModel >> allRMQVHosts [
	<navigation: 'All RMQ vhosts group'>
	^self allWithType: RMQVHost
]

{ #category : #accessing }
PulseModel >> allStates [
	<navigation: 'All States group'>
	^self allWithType: State
]

{ #category : #accessing }
PulseModel >> allTags [
	<navigation: 'All Tags group'>
	^self allWithType: Tag
]

{ #category : #accessing }
PulseModel >> allTransportPolitics [
	<navigation: 'All TransportPolitics group'>
	^self allWithType: TransportPolitic
]

{ #category : #'initialize-release' }
PulseModel >> initialize [
	
   super initialize.
	self sourceLanguage: 'RabbitMQ'
]

{ #category : #'add-select' }
PulseModel >> selectOrAddEntityNamed: aName withType: aType [ 

	^ self entityNamed: aName withType: aType 
			ifAbsent:[ 
				|newEntity |
				newEntity := aType new
					pulseName: aName;
					mooseModel: self.
				
				newEntity ].
]
