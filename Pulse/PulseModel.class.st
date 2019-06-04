Class {
	#name : #PulseModel,
	#superclass : #MooseModel,
	#category : #'Pulse-Model'
}

{ #category : #testing }
PulseModel class >> annotation [

	<MSEClass: #PulseModel super: #MooseModel>
	<package: #Pulse>
	^self
]

{ #category : #testing }
PulseModel class >> isVoyageRoot [

	^true
]

{ #category : #accessing }
PulseModel >> allPulseAuthMechanisms [
	^self allWithType: PulseAuthMechanism
]

{ #category : #accessing }
PulseModel >> allPulseBindingWithExchanges [
	^self allWithType: PulseBindingWithExchange
]

{ #category : #accessing }
PulseModel >> allPulseBindingWithQueues [
	^self allWithType: PulseBindingWithQueue
]

{ #category : #accessing }
PulseModel >> allPulseBindings [
	^((self allWithType: PulseBindingWithExchange) union: (self allWithType: PulseBindingWithQueue))
]

{ #category : #accessing }
PulseModel >> allPulseChannels [
	^self allWithType: PulseChannel
]

{ #category : #accessing }
PulseModel >> allPulseClusters [
	^self allWithType: PulseCluster
]

{ #category : #accessing }
PulseModel >> allPulseComponentTypes [
	^self allWithType: PulseComponentType
]

{ #category : #accessing }
PulseModel >> allPulseConnections [
	^self allWithType: PulseConnection
]

{ #category : #accessing }
PulseModel >> allPulseConsumerComponent [
	^self allWithType: PulseConsumerComponent
]

{ #category : #accessing }
PulseModel >> allPulseConsumerProcesses [
	^self allWithType: PulseConsumerProcess
]

{ #category : #accessing }
PulseModel >> allPulseDeliveryModes [
	^self allWithType: PulseDeliveryMode
]

{ #category : #accessing }
PulseModel >> allPulseDeploymentModes [
	^self allWithType: PulseDeploymentMode
]

{ #category : #accessing }
PulseModel >> allPulseEncodings [
	^self allWithType: PulseEncoding
]

{ #category : #accessing }
PulseModel >> allPulseExchangeFormats [
	^self allWithType: PulseExchangeFormat
]

{ #category : #accessing }
PulseModel >> allPulseExchangeTypes [
	^self allWithType: PulseExchangeType
]

{ #category : #accessing }
PulseModel >> allPulseExchanges [
	^self allWithType: PulseExchange
]

{ #category : #accessing }
PulseModel >> allPulseGuaranteeModes [
	^self allWithType: PulseGuaranteeMode
]

{ #category : #accessing }
PulseModel >> allPulseMessageTypes [
	^self allWithType: PulseMessageType
]

{ #category : #accessing }
PulseModel >> allPulseMessages [
	^self allWithType: PulseMessage

]

{ #category : #accessing }
PulseModel >> allPulseNodeTypes [
	^self allWithType: PulseNodeType
]

{ #category : #accessing }
PulseModel >> allPulseNodes [
	^self allWithType: PulseNode
]

{ #category : #accessing }
PulseModel >> allPulsePayloads [
	^self allWithType: PulsePayload
]

{ #category : #accessing }
PulseModel >> allPulsePermissions [
	^self allWithType: PulsePermission
]

{ #category : #accessing }
PulseModel >> allPulsePublisherComponent [
	^self allWithType: PulsePublisherComponent
]

{ #category : #accessing }
PulseModel >> allPulseQueues [
	^self allWithType: PulseQueue
]

{ #category : #accessing }
PulseModel >> allPulseRoles [
	^self allWithType: PulseRole
]

{ #category : #accessing }
PulseModel >> allPulseRoutingKeys [
	^self allWithType: PulseRoutingKey
]

{ #category : #accessing }
PulseModel >> allPulseSources [
	^self allWithType: PulseSource
]

{ #category : #accessing }
PulseModel >> allPulseUsers [
	^self allWithType: PulseUser
]

{ #category : #accessing }
PulseModel >> allPulseVHosts [
	^self allWithType: PulseVHost
]

{ #category : #'initialize-release' }
PulseModel >> initialize [
	
   super initialize.
	self sourceLanguage: 'RabbitMQ'.
	self metamodel: PulseMetamodelGenerator metamodel
]

{ #category : #'add-select' }
PulseModel >> selectOrAddEntityNamed: aName withType: aType sourceName: aSourceName [ 
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
