Class {
	#name : #ORActionAddPulseRMQExchange,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'type',
		'durability',
		'autoDelete',
		'internal',
		'vhost',
		'sourceBindings',
		'destinationBindings',
		'queues_for_dead_letter',
		'my_alternate_exchange',
		'alternate_exchange_for',
		'creationDate',
		'deletionDate',
		'messages',
		'components',
		'user_who_performed_action'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQExchange >> alternate_exchange_for [
	^ alternate_exchange_for
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> alternate_exchange_for: anObject [
	alternate_exchange_for := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> autoDelete [
	^ autoDelete
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> autoDelete: anObject [
	autoDelete := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> components [
	^ components
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> components: anObject [
	components := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> destinationBindings [
	^ destinationBindings
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> destinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> durability [
	^ durability
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> durability: anObject [
	durability := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> internal [
	^ internal
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> internal: anObject [
	internal := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> messages [
	^ messages
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> my_alternate_exchange [
	^ my_alternate_exchange
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> my_alternate_exchange: anObject [
	my_alternate_exchange := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQExchange >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQExchange new.
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
	
	self internal ifNotNil: [ :e |
		newEntity privateInternal: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self alternate_exchange_for
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self alternate_exchange_for collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity private_alternate_exchange_for: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_my_alternate_exchange: newEntity ] ].
		
	self components
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self components collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateComponents: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateExchanges: (e privateExchanges orionCopy unsafeAdd: newEntity) ] ].
		
	self destinationBindings
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self destinationBindings collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateDestinationBindings: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateDestination: newEntity ] ].
	
	self durability
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self durability.
			newEntity privateDurability: theNewEntity orionCopy.
			theNewEntity privateExchanges: (theNewEntity privateExchanges orionCopy unsafeAdd: newEntity)].
		
	self messages
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self messages collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateMessages: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateExchange: newEntity ] ].
		
	self my_alternate_exchange
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self my_alternate_exchange.
			newEntity private_my_alternate_exchange: theNewEntity orionCopy.
			theNewEntity private_alternate_exchange_for: newEntity orionCopy].
		
	self queues_for_dead_letter
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self queues_for_dead_letter collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity private_queues_for_dead_letter: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_dead_letter_exchange: newEntity ] ].
		
	self sourceBindings
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self sourceBindings collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateSourceBindings: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateSource: newEntity ] ].
				
	self type
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self type.
			newEntity privateType: theNewEntity orionCopy.
			theNewEntity privateExchanges: (theNewEntity privateExchanges orionCopy unsafeAdd: newEntity)].
		
	self user_who_performed_action
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user_who_performed_action.
			newEntity private_user_who_performed_action: theNewEntity orionCopy.
			theNewEntity privateInitializedExchanges: (theNewEntity privateInitializedExchanges orionCopy unsafeAdd: newEntity)].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateExchanges: (theNewEntity privateExchanges orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> sourceBindings [
	^ sourceBindings
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> sourceBindings: anObject [
	sourceBindings := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> type [
	^ type
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> type: anObject [
	type := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> user_who_performed_action [
	^ user_who_performed_action
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> user_who_performed_action: anObject [
	user_who_performed_action := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQExchange >> vhost: anObject [
	vhost := anObject
]
