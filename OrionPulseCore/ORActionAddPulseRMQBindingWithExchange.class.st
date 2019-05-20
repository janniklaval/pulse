Class {
	#name : #ORActionAddPulseRMQBindingWithExchange,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'creationDate',
		'deletionDate',
		'pulseName',
		'routingKey',
		'source',
		'vhost',
		'destination'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> destination [
	^ destination
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> routingKey [
	^ routingKey
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> routingKey: anObject [
	routingKey := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQBindingWithExchange >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQBindingWithExchange new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self creationDate ifNotNil: [ :e | 
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e | 
		newEntity privateDeletionDate: e orionCopy ].
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self destination
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self destination.
			newEntity privateDestination: theNewEntity orionCopy.
			theNewEntity privateDestinationBindings: (theNewEntity privateDestinationBindings orionCopy unsafeAdd: newEntity)].
		
	self routingKey
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self routingKey collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateRoutingKey: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateBinding: newEntity ] ].
		
	self source
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self source.
			newEntity privateSource: theNewEntity orionCopy.
			theNewEntity privateSourceBindings: (theNewEntity privateSourceBindings orionCopy unsafeAdd: newEntity)].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateBindings: (theNewEntity privateBindings orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> source [
	^ source
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> source: anObject [
	source := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithExchange >> vhost: anObject [
	vhost := anObject
]
