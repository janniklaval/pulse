Class {
	#name : #OldPulseModel,
	#superclass : #MooseModel,
	#category : #'RMQ-Core-Model'
}

{ #category : #testing }
OldPulseModel class >> annotation [

	<MSEClass: #OldPulseModel super: #MooseModel>
	<package: #Pulse>
	^self
]

{ #category : #testing }
OldPulseModel class >> isVoyageRoot [

	^true
]

{ #category : #accessing }
OldPulseModel >> allAuthMechanisms [
	<navigation: 'All AuthMechanisms group'>
	^self allWithType: AuthMechanism
]

{ #category : #accessing }
OldPulseModel >> allComponentTypes [
	<navigation: 'All ComponentTypes group'>
	^self allWithType: ComponentType
]

{ #category : #accessing }
OldPulseModel >> allDeliveryModes [
	<navigation: 'All delivery modes group'>
	^self allWithType: DeliveryMode
]

{ #category : #accessing }
OldPulseModel >> allDeploymentModes [
	<navigation: 'All Deployment modes group'>
	^self allWithType: DeploymentMode
]

{ #category : #accessing }
OldPulseModel >> allDurabilities [
	<navigation: 'All Durabilities group'>
	^self allWithType: Durability
]

{ #category : #accessing }
OldPulseModel >> allEncodings [
	<navigation: 'All Encodings group'>
	^self allWithType: Encoding
]

{ #category : #accessing }
OldPulseModel >> allExchangeTypes [
	<navigation: 'All ExchangeTypes group'>
	^self allWithType: ExchangeType
]

{ #category : #accessing }
OldPulseModel >> allGuaranteeModes [
	<navigation: 'All GuaranteeModes group'>
	^self allWithType: GuaranteeMode
]

{ #category : #accessing }
OldPulseModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: MessageType
]

{ #category : #accessing }
OldPulseModel >> allNodeTypes [
	<navigation: 'All NodeTypes group'>
	^self allWithType: NodeType
]

{ #category : #accessing }
OldPulseModel >> allRMQAuthentifications [
	<navigation: 'All RMQ authentification group'>
	^self allWithType: RMQAuthentification
]

{ #category : #accessing }
OldPulseModel >> allRMQBindingWithExchanges [
	<navigation: 'All RMQ Bindings with Exchanges group'>
	^self allWithType: RMQBindingWithExchange
]

{ #category : #accessing }
OldPulseModel >> allRMQBindingWithQueues [
	<navigation: 'All RMQ Bindings with Queues group'>
	^self allWithType: RMQBindingWithQueue
]

{ #category : #accessing }
OldPulseModel >> allRMQBindings [
	<navigation: 'All RMQ Bindings group'>
	^((self allWithType: RMQBindingWithExchange) union: (self allWithType: RMQBindingWithQueue))
]

{ #category : #accessing }
OldPulseModel >> allRMQChannels [
	<navigation: 'All RMQ channels group'>
	^self allWithType: RMQChannel
]

{ #category : #accessing }
OldPulseModel >> allRMQClusters [
	<navigation: 'All RMQ clusters group'>
	^self allWithType: RMQCluster
]

{ #category : #accessing }
OldPulseModel >> allRMQConnections [
	<navigation: 'All RMQ components group'>
	^self allWithType: RMQConnection
]

{ #category : #accessing }
OldPulseModel >> allRMQConsumerComponent [
	<navigation: 'All RMQ consumer components group'>
	^self allWithType: RMQConsumerComponent
]

{ #category : #accessing }
OldPulseModel >> allRMQConsumerProcesses [
	<navigation: 'All RMQ consumer processes group'>
	^self allWithType: RMQConsumerProcess
]

{ #category : #accessing }
OldPulseModel >> allRMQExchangeFormats [
	<navigation: 'All RMQ exchangeFormats group'>
	^self allWithType: RMQExchangeFormat
]

{ #category : #accessing }
OldPulseModel >> allRMQExchanges [
	<navigation: 'All RMQ exchanges group'>
	^self allWithType: RMQExchange
]

{ #category : #accessing }
OldPulseModel >> allRMQMessages [
	<navigation: 'All RMQ messages group'>
	^self allWithType: RMQMessage
]

{ #category : #accessing }
OldPulseModel >> allRMQNodes [
	<navigation: 'All RMQ nodes group'>
	^self allWithType: RMQNode
]

{ #category : #accessing }
OldPulseModel >> allRMQPayloads [
	<navigation: 'All RMQ payloads group'>
	^self allWithType: RMQPayload
]

{ #category : #accessing }
OldPulseModel >> allRMQPermissions [
	<navigation: 'All RMQ permissions group'>
	^self allWithType: RMQPermission
]

{ #category : #accessing }
OldPulseModel >> allRMQPublisherComponent [
	<navigation: 'All RMQ publisher components group'>
	^self allWithType: RMQPublisherComponent
]

{ #category : #accessing }
OldPulseModel >> allRMQQueues [
	<navigation: 'All RMQ queues group'>
	^self allWithType: RMQQueue
]

{ #category : #accessing }
OldPulseModel >> allRMQRoles [
	<navigation: 'All RMQ roles group'>
	^self allWithType: RMQRole
]

{ #category : #accessing }
OldPulseModel >> allRMQRoutingKeys [
	<navigation: 'All RMQ routing keys group'>
	^self allWithType: RMQRoutingKey
]

{ #category : #accessing }
OldPulseModel >> allRMQUsers [
	<navigation: 'All RMQ users group'>
	^self allWithType: RMQUser
]

{ #category : #accessing }
OldPulseModel >> allRMQVHosts [
	<navigation: 'All RMQ vhosts group'>
	^self allWithType: RMQVHost
]

{ #category : #accessing }
OldPulseModel >> allStates [
	<navigation: 'All States group'>
	^self allWithType: State
]

{ #category : #accessing }
OldPulseModel >> allTags [
	<navigation: 'All Tags group'>
	^self allWithType: Tag
]

{ #category : #accessing }
OldPulseModel >> allTransportPolitics [
	<navigation: 'All TransportPolitics group'>
	^self allWithType: TransportPolitic
]

{ #category : #'initialize-release' }
OldPulseModel >> initialize [
	
   super initialize.
	self sourceLanguage: 'RabbitMQ'
]

{ #category : #'add-select' }
OldPulseModel >> selectOrAddEntityNamed: aName withType: aType sourceName: anObject [ 

	^ self entityNamed: aName withType: aType 
			ifAbsent:[ 
				|newEntity |
				newEntity := aType new
					pulseName: aName;
					mooseModel: self.
				
				newEntity ].
]
