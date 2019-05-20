Class {
	#name : #ORActionAddPulseRMQComponent,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'guid',
		'adress',
		'rmqState',
		'componentType',
		'owner',
		'author',
		'senderMessages',
		'subscribedChannels',
		'consumerTag',
		'exclusive',
		'platform',
		'version',
		'deploymentMode',
		'ackRequired',
		'deletionDate',
		'creationDate',
		'exchanges',
		'tenants'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQComponent >> ackRequired [
	^ ackRequired
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> ackRequired: anObject [
	ackRequired := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> adress [
	^ adress
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> adress: anObject [
	adress := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> author [
	^ author
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> author: anObject [
	author := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> componentType [
	^ componentType
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> componentType: anObject [
	componentType := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> consumerTag [
	^ consumerTag
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> consumerTag: anObject [
	consumerTag := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> deploymentMode [
	^ deploymentMode
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> deploymentMode: anObject [
	deploymentMode := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> exchanges [
	^ exchanges
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> exclusive [
	^ exclusive
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> exclusive: anObject [
	exclusive := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> guid [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> guid: anObject [
	self pulseName: anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> owner [
	^ owner
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> platform [
	^ platform
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> platform: anObject [
	platform := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> rmqState [
	^ rmqState
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQComponent >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQComponent new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self guid ifNotNil: [ :e |
		newEntity privateGuid: e orionCopy ].
	
	self ackRequired ifNotNil: [ :e |
		newEntity privateAckRequired: e orionCopy ].
	
	self adress ifNotNil: [ :e |
		newEntity privateAdress: e orionCopy ].
	
	self author ifNotNil: [ :e |
		newEntity privateAuthor: e orionCopy ].
	
	self consumerTag ifNotNil: [ :e |
		newEntity privateConsumerTag: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self exclusive ifNotNil: [ :e |
		newEntity privateExclusive: e orionCopy ].
	
	self owner ifNotNil: [ :e |
		newEntity privateOwner: e orionCopy ].
	
	self platform ifNotNil: [ :e |
		newEntity privatePlatform: e orionCopy ].
	
	self rmqState ifNotNil: [ :e |
		newEntity privateRmqState: e orionCopy ].
	
	self version ifNotNil: [ :e |
		newEntity privateVersion: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self componentType
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self componentType.
			newEntity privateComponentType: theNewEntity orionCopy.
			theNewEntity privateComponents: (theNewEntity privateComponents orionCopy unsafeAdd: newEntity)].
		
	self deploymentMode
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self deploymentMode.
			newEntity privateDeploymentMode: theNewEntity orionCopy.
			theNewEntity privateComponents: (theNewEntity privateComponents orionCopy unsafeAdd: newEntity)].
		
	
	self exchanges
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self exchanges collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateExchanges: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateComponents: (e privateComponents orionCopy unsafeAdd: newEntity) ] ].
		
	self senderMessages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self senderMessages collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateSenderMessages: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateSenderComponent: newEntity ] ].
		
	self subscribedChannels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self subscribedChannels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateSubscribedChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateSubscribedComponent: newEntity ] ].
		
	self tenants
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self tenants collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateTenants: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateComponent: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> senderMessages [
	^ senderMessages
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> senderMessages: anObject [
	senderMessages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> subscribedChannels [
	^ subscribedChannels
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> subscribedChannels: anObject [
	subscribedChannels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> tenants [
	^ tenants
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> tenants: anObject [
	tenants := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> version [
	^ version
]

{ #category : #accessing }
ORActionAddPulseRMQComponent >> version: anObject [
	version := anObject
]
