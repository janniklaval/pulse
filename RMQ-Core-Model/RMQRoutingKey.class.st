Class {
	#name : #RMQRoutingKey,
	#superclass : #PulseEntity,
	#instVars : [
		'value',
		'binding',
		'queues_for_dead_letter',
		'messages'
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
	queues_for_dead_letter := Set new.
	messages := Set new. 
]

{ #category : #accessing }
RMQRoutingKey >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#routingKeys>
	<multivalued>
	^ messages
]

{ #category : #accessing }
RMQRoutingKey >> messages: anObject [
	messages := anObject
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
