Class {
	#name : #ORPulseConverter,
	#superclass : #Object,
	#classVars : [
		'association',
		'modelShouldHaveOnlyOrionClasses'
	],
	#category : #OrionCore
}

{ #category : #'initialize-release' }
ORPulseConverter class >> buildFromMooseModel: aMooseModel [


	| model system |
	model := ORConverter convertFromMooseModel: aMooseModel.
	system := ORSystem new.
	system sourceModel: model.
	model system: system.
	system name: 'Orion ' , model name.
	ORSystem add: system.
	(MooseModel root includes: aMooseModel)
		ifTrue: [ MooseModel root remove: aMooseModel ].
	^ model
]

{ #category : #'initialize-release' }
ORPulseConverter class >> convertFromMooseModel: aMooseModel [

	| model state |
	model := ORModel new.
	model name: aMooseModel name.
	model sourceLanguage: aMooseModel sourceLanguage.
	aMooseModel entities copy
		do: [ :anEntity | 
			| myNewClass newAtt |
			myNewClass := self mapping at: anEntity class ifAbsent: [ nil ].
			myNewClass
				ifNotNil: [ anEntity primitiveChangeClassTo: myNewClass new.
					state := anEntity privateState.
					state primitiveChangeClassTo: anEntity defaultStateClass new.
					newAtt := SmallDictionary new.
					state privateAttributes do: [ :attr | newAtt at: attr key put: attr value ].
					state privateAttributes: newAtt.
					anEntity privateState: state.
					model add: anEntity ] ].
	^ model
]

{ #category : #'initialize-release' }
ORPulseConverter class >> initConverter [
	
	association := SmallDictionary new.
	association at: AuthMechanism put: ORPulseAuthMechanism.
	association at: ComponentType put: ORPulseComponentType.
	association at: DeliveryMode put: ORPulseDeliveryMode.
	association at: Durability put: ORPulseDurability.
	association at: Encoding put: ORPulseEncoding.
	association at: ExchangeType put: ORPulseExchangeType.
	association at: GuaranteeMode put: ORPulseGuaranteeMode.
	association at: MessageType put: ORPulseMessageType.
	association at: ORPulseNodeType put: ORPulseNodeType.
	association at: RMQAuthentification put: ORPulseRMQAuthentification.
	association at: RMQBinding put: ORPulseRMQBinding.
	association at: RMQBindingWithExchange put: ORPulseRMQBindingWithExchange.
	association at: RMQBindingWithQueue put: ORPulseRMQBindingWithQueue.
	association at: RMQChannel put: ORPulseRMQChannel.
	association at: RMQCluster put: ORPulseRMQCluster.
	association at: RMQComponent put: ORPulseRMQComponent.
	association at: RMQConnection put: ORPulseRMQConnection.
	association at: RMQExchange put: ORPulseRMQExchange.
	association at: RMQExchangeFormat put: ORPulseRMQExchangeFormat.
	association at: RMQMessage put: ORPulseRMQMessage.
	association at: RMQNode put: ORPulseRMQNode.
	association at: RMQPayload put: ORPulseRMQPayload.
	association at: RMQPermission put: ORPulseRMQPermission.
	association at: RMQQueue put: ORPulseRMQQueue.
	association at: RMQRole put: ORPulseRMQRole.
	association at: RMQRoutingKey put: ORPulseRMQRoutingKey.
	association at: RMQTenant put: ORPulseRMQTenant.
	association at: RMQUser put: ORPulseRMQUser.
	association at: RMQVHost put: ORPulseRMQVHost.
	association at: State put: ORPulseState.
	association at: Tag put: ORPulseTag.
	association at: TransportPolitic put: ORPulseTransportPolitic.
	
	^association
]

{ #category : #'initialize-release' }
ORPulseConverter class >> initialize [
	modelShouldHaveOnlyOrionClasses := false.
	association := nil.
]

{ #category : #'initialize-release' }
ORPulseConverter class >> mapping [
	
	^ association ifNil:[ self initConverter ]
]

{ #category : #'initialize-release' }
ORPulseConverter class >> modelShouldHaveOnlyOrionClasses [
	^ modelShouldHaveOnlyOrionClasses
]

{ #category : #'initialize-release' }
ORPulseConverter class >> modelShouldHaveOnlyOrionClasses: aBoolean [
	modelShouldHaveOnlyOrionClasses := aBoolean
]
