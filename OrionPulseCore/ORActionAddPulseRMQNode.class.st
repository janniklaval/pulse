Class {
	#name : #ORActionAddPulseRMQNode,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'type',
		'running',
		'cluster',
		'vhosts',
		'host',
		'port',
		'creationDate',
		'deletionDate'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQNode >> cluster [
	^ cluster
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> cluster: anObject [
	cluster := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> host [
	^ host
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> host: anObject [
	host := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> port [
	^ port
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> port: anObject [
	port := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQNode >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQNode new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self host ifNotNil: [ :e |
		newEntity privateHost: e orionCopy ].
	
	self port ifNotNil: [ :e |
		newEntity privatePort: e orionCopy ].
	
	self running ifNotNil: [ :e |
		newEntity privateRunning: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self type
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self type.
			newEntity privateType: theNewEntity orionCopy.
			theNewEntity privateNodes: (theNewEntity privateNodes orionCopy unsafeAdd: newEntity)].
		
	self vhosts
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self vhosts collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateVhosts: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateNode: (e privateNodes orionCopy unsafeAdd: newEntity) ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> running [
	^ running
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> running: anObject [
	running := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> type [
	^ type
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> type: anObject [
	type := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> vhosts [
	^ vhosts
]

{ #category : #accessing }
ORActionAddPulseRMQNode >> vhosts: anObject [
	vhosts := anObject
]
