Class {
	#name : #RMQQueue,
	#superclass : #PulseEntity,
	#instVars : [
		'durability',
		'autoDelete',
		'messageTTL',
		'rmqState',
		'exclusive',
		'vhost',
		'destinationBindings',
		'dead_letter_exchange',
		'dead_letter_routing_key',
		'idleSince',
		'expiresAfter',
		'maxLength',
		'maxLengthBytes',
		'maxPriority',
		'creationDate',
		'deletionDate',
		'consumerChannels',
		'routedMessages',
		'deliveredMessages'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQQueue >> autoDelete [
	<MSEProperty: #autoDelete type: #Boolean>
	^ autoDelete
]

{ #category : #accessing }
RMQQueue >> autoDelete: anObject [
	autoDelete := anObject
]

{ #category : #accessing }
RMQQueue >> consumerChannels [
	<MSEProperty: #consumerChannels type: #RMQChannel opposite:#consumedQueues>
	<multivalued>
	^ consumerChannels
]

{ #category : #accessing }
RMQQueue >> consumerChannels: anObject [
	consumerChannels := anObject
]

{ #category : #accessing }
RMQQueue >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQQueue >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQQueue >> dead_letter_exchange [
	<MSEProperty: #dead_letter_exchange type: #RMQExchange opposite:#queues_for_dead_letter>
	^ dead_letter_exchange
]

{ #category : #accessing }
RMQQueue >> dead_letter_exchange: anObject [
	dead_letter_exchange := anObject
]

{ #category : #accessing }
RMQQueue >> dead_letter_routing_key [
	<MSEProperty: #dead_letter_routing_key type: #RMQRoutingKey opposite:#queues_for_dead_letter>
	^ dead_letter_routing_key
]

{ #category : #accessing }
RMQQueue >> dead_letter_routing_key: anObject [
	dead_letter_routing_key := anObject
]

{ #category : #accessing }
RMQQueue >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQQueue >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQQueue >> deliveredMessages [
   <MSEProperty: #deliveredMessages type: #RMQMessage opposite:#deliveredFromQueues>
   <multivalued>
	^ deliveredMessages
]

{ #category : #accessing }
RMQQueue >> deliveredMessages: anObject [
	deliveredMessages := anObject
]

{ #category : #accessing }
RMQQueue >> destinationBindings [
	<MSEProperty: #destinationBindings type: #RMQBindingWithQueue opposite:#destination>
	<multivalued>
	^ destinationBindings
]

{ #category : #accessing }
RMQQueue >> destinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #accessing }
RMQQueue >> durability [
	<MSEProperty: #durability type: #Durability opposite: #queues>
	^ durability
]

{ #category : #accessing }
RMQQueue >> durability: anObject [
	durability := anObject. 
]

{ #category : #accessing }
RMQQueue >> exclusive [
	<MSEProperty: #exclusive type: #Boolean>
	^ exclusive
]

{ #category : #accessing }
RMQQueue >> exclusive: anObject [
	exclusive := anObject
]

{ #category : #accessing }
RMQQueue >> expiresAfter [
	<MSEProperty: #expiresAfter type: #Number>
	^ expiresAfter
]

{ #category : #accessing }
RMQQueue >> expiresAfter: anObject [
	expiresAfter := anObject
]

{ #category : #accessing }
RMQQueue >> idleSince [
	<MSEProperty: #idleSince type: #Number>
	^ idleSince
]

{ #category : #accessing }
RMQQueue >> idleSince: anObject [
	idleSince := anObject
]

{ #category : #accessing }
RMQQueue >> initialize [

	super initialize.
	consumerChannels := Set new.
	destinationBindings := Set new.
	routedMessages := Set new. 
	deliveredMessages := Set new. 
]

{ #category : #accessing }
RMQQueue >> maxLength [
	<MSEProperty: #maxLength type: #Number>
	^ maxLength
]

{ #category : #accessing }
RMQQueue >> maxLength: anObject [
	maxLength := anObject
]

{ #category : #accessing }
RMQQueue >> maxLengthBytes [
	<MSEProperty: #maxLengthBytes type: #Number>
	^ maxLengthBytes
]

{ #category : #accessing }
RMQQueue >> maxLengthBytes: anObject [
	maxLengthBytes := anObject
]

{ #category : #accessing }
RMQQueue >> maxPriority [
	<MSEProperty: #maxPriority type: #Number>
	^ maxPriority
]

{ #category : #accessing }
RMQQueue >> maxPriority: anObject [
	maxPriority := anObject
]

{ #category : #accessing }
RMQQueue >> messageTTL [
	<MSEProperty: #messageTTL type: #Number>
	^ messageTTL
]

{ #category : #accessing }
RMQQueue >> messageTTL: anObject [
	messageTTL := anObject
]

{ #category : #accessing }
RMQQueue >> rmqState [
	<MSEProperty: #rmqState type: #State opposite:#queues>
	^ rmqState ifNil: [ self rmqState: State idle.  rmqState]
]

{ #category : #accessing }
RMQQueue >> rmqState: anObject [
	rmqState := self selectEnum: anObject. 
	rmqState queues add: self.
]

{ #category : #accessing }
RMQQueue >> routedMessages [
   <MSEProperty: #routedMessages type: #RMQMessage opposite:#routedToQueues>
   <multivalued>
	^ routedMessages
]

{ #category : #accessing }
RMQQueue >> routedMessages: anObject [
	routedMessages := anObject
]

{ #category : #accessing }
RMQQueue >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#queues>

	^ vhost
]

{ #category : #accessing }
RMQQueue >> vhost: anObject [
	vhost := anObject
]
