Class {
	#name : #ORActionAddPulseRMQMessage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'messageID',
		'messageType',
		'payload',
		'encrypted',
		'timestamp',
		'deliveryMode',
		'redelivered',
		'priority',
		'exchangeFormat',
		'queue',
		'senderComponent',
		'routedQueues',
		'exchange'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQMessage >> deliveryMode [
	^ deliveryMode
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> deliveryMode: anObject [
	deliveryMode := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> encrypted [
	^ encrypted
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> encrypted: anObject [
	encrypted := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> exchange [
	^ exchange
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> exchange: anObject [
	exchange := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> exchangeFormat [
	^ exchangeFormat
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> exchangeFormat: anObject [
	exchangeFormat := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> messageID [
	^ messageID
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> messageID: anObject [
	messageID := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> messageType [
	^ messageType
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> messageType: anObject [
	messageType := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> payload [
	^ payload
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> payload: anObject [
	payload := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> priority [
	^ priority
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> queue [
	^ queue
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> queue: anObject [
	queue := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> redelivered [
	^ redelivered
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> redelivered: anObject [
	redelivered := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> routedQueues [
	^ routedQueues
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> routedQueues: anObject [
	routedQueues := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQMessage >> run [

	| newEntity var |
	super run.
	newEntity := ORPulseRMQMessage new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self encrypted ifNotNil: [ :e |
		newEntity privateEncrypted: e orionCopy ].
	
	self messageID ifNotNil: [ :e |
		newEntity privateMessageID: e orionCopy ].
	
	self priority ifNotNil: [ :e |
		newEntity privatePriority: e orionCopy ].
	
	self redelivered ifNotNil: [ :e |
		newEntity privateRedelivered: e orionCopy ].
	
	self timestamp ifNotNil: [ :e |
		newEntity privateTimestamp: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self deliveryMode
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self deliveryMode.
			newEntity privateDeliveryMode: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity)].
		
	self exchange
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exchange.
			newEntity privateExchange: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity)].
		
	self exchangeFormat
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self exchangeFormat.
			newEntity privateExchangeFormat: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity)].
		
	self messageType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self messageType.
			newEntity privateMessageType: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity) ].
		
	self payload
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self payload.
			newEntity privatePayload: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity)].
		
	self queue
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self queue.
			newEntity privateQueue: theNewEntity orionCopy.
			theNewEntity privateMessages: (theNewEntity privateMessages orionCopy add: newEntity)].
		
	self routedQueues
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self routedQueues collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateRoutedQueues: theNewEntities orionCopy.
			"theNewEntities do: [ :e | e privateMessages: ( e privateMessages orionCopy add: newEntity) ]".
			(var := theNewEntities at: 1) privateMessages: (var privateMessages asOrderedCollection orionCopy add: newEntity) ].
		
	self senderComponent
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self senderComponent.
			newEntity privateSenderComponent: theNewEntity orionCopy.
			theNewEntity privateSenderMessages: (theNewEntity privateSenderMessages orionCopy add: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> senderComponent [
	^ senderComponent
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> senderComponent: anObject [
	senderComponent := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> timestamp [
	^ timestamp
]

{ #category : #accessing }
ORActionAddPulseRMQMessage >> timestamp: anObject [
	timestamp := anObject
]
