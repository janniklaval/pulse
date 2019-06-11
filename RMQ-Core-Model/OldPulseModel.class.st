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
	^self allWithType: PulseDeliveryMode
]

{ #category : #accessing }
OldPulseModel >> allDeploymentModes [
	<navigation: 'All Deployment modes group'>
	^self allWithType: PulseDeploymentMode
]

{ #category : #accessing }
OldPulseModel >> allEPulseSources [
	<navigation: 'All Sources group'>
	^self allWithType: PulseSource
]

{ #category : #accessing }
OldPulseModel >> allEncodings [
	<navigation: 'All Encodings group'>
	^self allWithType: PulseEncoding
]

{ #category : #accessing }
OldPulseModel >> allExchangeTypes [
	<navigation: 'All ExchangeTypes group'>
	^self allWithType: PulseExchangeType
]

{ #category : #accessing }
OldPulseModel >> allGuaranteeModes [
	<navigation: 'All GuaranteeModes group'>
	^self allWithType: PulseGuaranteeMode
]

{ #category : #accessing }
OldPulseModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: PulseMessageType
]

{ #category : #accessing }
OldPulseModel >> allNodeTypes [
	<navigation: 'All NodeTypes group'>
	^self allWithType: PulseNodeType
]

{ #category : #accessing }
OldPulseModel >> allRMQAuthentifications [
	<navigation: 'All RMQ authentification group'>
	^self allWithType: PulseAuthentification
]

{ #category : #accessing }
OldPulseModel >> allRMQBindingWithExchanges [
	<navigation: 'All RMQ Bindings with Exchanges group'>
	^self allWithType: PulseBindingWithExchange
]

{ #category : #accessing }
OldPulseModel >> allRMQBindingWithQueues [
	<navigation: 'All RMQ Bindings with Queues group'>
	^self allWithType: PulseBindingWithQueue
]

{ #category : #accessing }
OldPulseModel >> allRMQBindings [
	<navigation: 'All RMQ Bindings group'>
	^((self allWithType: PulseBindingWithExchange) union: (self allWithType: PulseBindingWithQueue))
]

{ #category : #accessing }
OldPulseModel >> allRMQChannels [
	<navigation: 'All RMQ channels group'>
	^self allWithType: PulseChannel
]

{ #category : #accessing }
OldPulseModel >> allRMQClusters [
	<navigation: 'All RMQ clusters group'>
	^self allWithType: PulseCluster
]

{ #category : #accessing }
OldPulseModel >> allRMQConnections [
	<navigation: 'All RMQ components group'>
	^self allWithType: PulseConnection
]

{ #category : #accessing }
OldPulseModel >> allRMQConsumerComponent [
	<navigation: 'All RMQ consumer components group'>
	^self allWithType: PulseConsumerComponent
]

{ #category : #accessing }
OldPulseModel >> allRMQConsumerProcesses [
	<navigation: 'All RMQ consumer processes group'>
	^self allWithType: PulseConsumerProcess
]

{ #category : #accessing }
OldPulseModel >> allRMQExchangeFormats [
	<navigation: 'All RMQ exchangeFormats group'>
	^self allWithType: PulseExchangeFormat
]

{ #category : #accessing }
OldPulseModel >> allRMQExchanges [
	<navigation: 'All RMQ exchanges group'>
	^self allWithType: PulseExchange
]

{ #category : #accessing }
OldPulseModel >> allRMQMessages [
	<navigation: 'All RMQ messages group'>
	^self allWithType: PulseMessage
]

{ #category : #accessing }
OldPulseModel >> allRMQNodes [
	<navigation: 'All RMQ nodes group'>
	^self allWithType: PulseNode
]

{ #category : #accessing }
OldPulseModel >> allRMQPayloads [
	<navigation: 'All RMQ payloads group'>
	^self allWithType: PulsePayload
]

{ #category : #accessing }
OldPulseModel >> allRMQPermissions [
	<navigation: 'All RMQ permissions group'>
	^self allWithType: PulsePermission
]

{ #category : #accessing }
OldPulseModel >> allRMQPublisherComponent [
	<navigation: 'All RMQ publisher components group'>
	^self allWithType: PulsePublisherComponent
]

{ #category : #accessing }
OldPulseModel >> allRMQQueues [
	<navigation: 'All RMQ queues group'>
	^self allWithType: PulseQueue
]

{ #category : #accessing }
OldPulseModel >> allRMQRoles [
	<navigation: 'All RMQ roles group'>
	^self allWithType: PulseRole
]

{ #category : #accessing }
OldPulseModel >> allRMQRoutingKeys [
	<navigation: 'All RMQ routing keys group'>
	^self allWithType: PulseRoutingKey
]

{ #category : #accessing }
OldPulseModel >> allRMQUsers [
	<navigation: 'All RMQ users group'>
	^self allWithType: PulseUser
]

{ #category : #accessing }
OldPulseModel >> allRMQVHosts [
	<navigation: 'All RMQ vhosts group'>
	^self allWithType: PulseVHost
]

{ #category : #accessing }
OldPulseModel >> allStates [
	<navigation: 'All States group'>
	^self allWithType: PulseState
]

{ #category : #accessing }
OldPulseModel >> allTags [
	<navigation: 'All Tags group'>
	^self allWithType: PulseTag
]

{ #category : #accessing }
OldPulseModel >> allTransportPolitic [ 
	<navigation: 'All Tags group'>
	^self allWithType: PulseTransportPolitic 
]

{ #category : #'initialize-release' }
OldPulseModel >> initialize [
	
   super initialize.
	self sourceLanguage: 'RabbitMQ'.
	self metamodel: PulseMetamodelGenerator metamodel
]

{ #category : #'add-select' }
OldPulseModel >> selectOrAddEntityNamed: aName withType: aType sourceName: aSourceName [ 
	| entity source |
	entity := self entityNamed: aName withType: aType 
			ifAbsent:[ 
				| newEntity |
				newEntity := aType new
					pulseName: aName;
					mooseModel: self.
				newEntity ].
	
	source := self entityNamed: aSourceName withType: PulseSource ifAbsent:[
					| newSource |
					newSource := PulseSource new path: aSourceName; mooseModel: self.
					newSource.
				].
	source entities add: entity.
	entity sources add: source.
				
	^ entity
]
