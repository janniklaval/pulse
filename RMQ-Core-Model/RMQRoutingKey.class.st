Class {
	#name : #RMQRoutingKey,
	#superclass : #MooseEntity,
	#instVars : [
		'routingKeyString',
		'binding',
		'queues_for_dead_letter'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQRoutingKey >> binding [
	<MSEProperty: #binding type: #RMQBinding opposite:#routingKey>
	^ binding
]

{ #category : #accessing }
RMQRoutingKey >> binding: anObject [
	binding := anObject
]

{ #category : #accessing }
RMQRoutingKey >> initialize [
	super initialize.
]

{ #category : #accessing }
RMQRoutingKey >> name [
	<MSEProperty: #name type: #String>
	^ self routingKeyString
]

{ #category : #accessing }
RMQRoutingKey >> queues_for_dead_letter [
	<MSEProperty: #queues_for_dead_letter type: #RMQQueue opposite:#dead_letter_routing_key>
	<multivalued>
	^ queues_for_dead_letter
]

{ #category : #accessing }
RMQRoutingKey >> queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #accessing }
RMQRoutingKey >> routingKeyString [
	<MSEProperty: #routingKey type: #String>
	^ routingKeyString
]

{ #category : #accessing }
RMQRoutingKey >> routingKeyString: anObject [
	routingKeyString := anObject
]
