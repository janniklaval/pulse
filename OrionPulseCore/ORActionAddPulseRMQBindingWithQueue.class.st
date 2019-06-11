Class {
	#name : #ORActionAddPulseRMQBindingWithQueue,
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
ORActionAddPulseRMQBindingWithQueue >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> destination [
	^ destination
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> routingKey [
	^ routingKey
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> routingKey: anObject [
	routingKey := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQBindingWithQueue >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQBindingWithQueue new.
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
			theNewEntity privateDestinationBindings: (theNewEntity privateDestinationBindings orionCopy add: newEntity)].
		
	self routingKey
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self routingKey collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateRoutingKey: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateBinding: newEntity ] ].
		
	self source
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self source.
			newEntity privateSource: theNewEntity orionCopy.
			theNewEntity privateSourceBindings: (theNewEntity privateSourceBindings orionCopy add: newEntity)].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privateBindings: (theNewEntity privateBindings orionCopy add: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> source [
	^ source
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> source: anObject [
	source := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQBindingWithQueue >> vhost: anObject [
	vhost := anObject
]
