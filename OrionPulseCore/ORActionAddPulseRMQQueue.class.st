Class {
	#name : #ORActionAddPulseRMQQueue,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'durability',
		'autoDelete',
		'messageTTL',
		'rmqState',
		'exclusive',
		'vhost',
		'messages',
		'destinationBindings',
		'sendedMessages',
		'dead_letter_exchange',
		'dead_letter_routing_key',
		'idleSince',
		'expiresAfter',
		'maxLength',
		'maxLengthBytes',
		'maxPriority',
		'creationDate',
		'deletionDate',
		'consumerChannels'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQQueue >> autoDelete [
	^ autoDelete
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> autoDelete: anObject [
	autoDelete := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> consumerChannels [
	^ consumerChannels
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> consumerChannels: anObject [
	consumerChannels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> dead_letter_exchange [
	^ dead_letter_exchange
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> dead_letter_exchange: anObject [
	dead_letter_exchange := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> dead_letter_routing_key [
	^ dead_letter_routing_key
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> dead_letter_routing_key: anObject [
	dead_letter_routing_key := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> destinationBindings [
	^ destinationBindings
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> destinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> durability [
	^ durability
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> durability: anObject [
	durability := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> exclusive [
	^ exclusive
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> exclusive: anObject [
	exclusive := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> expiresAfter [
	^ expiresAfter
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> expiresAfter: anObject [
	expiresAfter := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> idleSince [
	^ idleSince
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> idleSince: anObject [
	idleSince := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxLength [
	^ maxLength
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxLength: anObject [
	maxLength := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxLengthBytes [
	^ maxLengthBytes
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxLengthBytes: anObject [
	maxLengthBytes := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxPriority [
	^ maxPriority
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> maxPriority: anObject [
	maxPriority := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> messageTTL [
	^ messageTTL
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> messageTTL: anObject [
	messageTTL := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQQueue >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQQueue new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self autoDelete ifNotNil: [ :e |
		newEntity privateAutoDelete: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self exclusive ifNotNil: [ :e |
		newEntity privateExclusive: e orionCopy ].
	
	self expiresAfter ifNotNil: [ :e |
		newEntity privateExpiresAfter: e orionCopy ].
	
	self idleSince ifNotNil: [ :e |
		newEntity privateIdleSince: e orionCopy ].
	
	self maxLength ifNotNil: [ :e |
		newEntity privateMaxLength: e orionCopy ].
	
	self maxLengthBytes ifNotNil: [ :e |
		newEntity privateMaxLengthBytes: e orionCopy ].
	
	self maxPriority ifNotNil: [ :e |
		newEntity privateMaxPriority: e orionCopy ].
	
	self messageTTL ifNotNil: [ :e |
		newEntity privateMessageTTL: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self consumerChannels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self consumerChannels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateConsumerChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateConsumedQueues: (e privateConsumedQueues orionCopy unsafeAdd: newEntity) ] ].
	
	self dead_letter_exchange
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self dead_letter_exchange.
			newEntity private_dead_letter_exchange: theNewEntity orionCopy.
			theNewEntity private_queues_for_dead_letter: (theNewEntity private_queues_for_dead_letter orionCopy unsafeAdd: newEntity)].
		
	self dead_letter_routing_key
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self dead_letter_routing_key.
			newEntity private_dead_letter_routing_key: theNewEntity orionCopy.
			theNewEntity private_queues_for_dead_letter: (theNewEntity private_queues_for_dead_letter orionCopy unsafeAdd: newEntity)].
		
	self destinationBindings
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self destinationBindings collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateDestinationBindings: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateDestination: newEntity ] ].
		
	self durability
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self durability.
			newEntity privateDurability: theNewEntity orionCopy.
			theNewEntity privateQueues: (theNewEntity privateQueues orionCopy unsafeAdd: newEntity)].
		
	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateRoutedQueues: (e privateRoutedQueues orionCopy unsafeAdd: newEntity) ] ].
		
	self rmqState
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self rmqState.
			newEntity privateRmqState: theNewEntity orionCopy.
			theNewEntity privateQueues: (theNewEntity privateQueues orionCopy unsafeAdd: newEntity)].
		
	self sendedMessages
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self sendedMessages.
			newEntity privateSendedMessages: theNewEntity orionCopy.
			theNewEntity privateQueue: newEntity orionCopy].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateQueues: (theNewEntity privateQueues orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> sendedMessages [
	^ sendedMessages
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> sendedMessages: anObject [
	sendedMessages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQQueue >> vhost: anObject [
	vhost := anObject
]
