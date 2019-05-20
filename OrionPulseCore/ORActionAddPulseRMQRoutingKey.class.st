Class {
	#name : #ORActionAddPulseRMQRoutingKey,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'binding',
		'queues_for_dead_letter'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> binding [
	^ binding
]

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> binding: anObject [
	binding := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #accessing }
ORActionAddPulseRMQRoutingKey >> queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQRoutingKey >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQRoutingKey new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self binding
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self binding.
			newEntity privateBinding: theNewEntity orionCopy.
			theNewEntity privateRoutingKey: newEntity orionCopy].
		
	self queues_for_dead_letter
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self queues_for_dead_letter collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity private_queues_for_dead_letter: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_dead_letter_routing_key: newEntity ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
