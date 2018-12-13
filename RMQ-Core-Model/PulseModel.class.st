Class {
	#name : #PulseModel,
	#superclass : #MooseModel,
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
PulseModel >> allDeliveryModes [
	<navigation: 'All delivery modes group'>
	^self allWithType: DeliveryMode
]

{ #category : #accessing }
PulseModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: MessageType
]

{ #category : #accessing }
PulseModel >> allRMQAuthentification [
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
	<navigation: 'All RMQ exchange formats group'>
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
PulseModel >> allRMQProperties [
	<navigation: 'All RMQ properties group'>
	^self allWithType: RMQProperty
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

{ #category : #'add-select' }
PulseModel >> selectOrAddEntityNamed: aName withType: aType [ 

	^ self entityNamed: aName withType: aType 
			ifAbsent:[ 
				|newEntity |
				newEntity := aType new
					pulseName: aName.
				self add: newEntity.
				
				newEntity ].
]
