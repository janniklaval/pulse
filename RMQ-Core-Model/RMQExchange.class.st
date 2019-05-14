Class {
	#name : #RMQExchange,
	#superclass : #PulseEntity,
	#instVars : [
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
		'user_who_performed_action',
		'publishedMessages',
		'publisherComponents',
		'topicID'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQExchange >> alternate_exchange_for [
	<MSEProperty: #alternate_exchange_for type: #RMQExchange opposite:#my_alternate_exchange>
	<multivalued>
	^ alternate_exchange_for
]

{ #category : #accessing }
RMQExchange >> alternate_exchange_for: anObject [
	alternate_exchange_for := anObject
]

{ #category : #accessing }
RMQExchange >> autoDelete [
	<MSEProperty: #autoDelete type: #Boolean>
	^ autoDelete
]

{ #category : #accessing }
RMQExchange >> autoDelete: anObject [
	autoDelete := anObject
]

{ #category : #accessing }
RMQExchange >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQExchange >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQExchange >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQExchange >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQExchange >> destinationBindings [
	<MSEProperty: #destinationBindings type: #RMQBindingWithExchange opposite:#destination>
	<multivalued>
	^ destinationBindings
]

{ #category : #accessing }
RMQExchange >> destinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #accessing }
RMQExchange >> durability [
	<MSEProperty: #durability type: #Durability opposite: #exchanges>
	^ durability
]

{ #category : #accessing }
RMQExchange >> durability: anObject [
	durability := self selectEnum: anObject.
	durability exchanges add: self. 
]

{ #category : #accessing }
RMQExchange >> initialize [

	super initialize.
	sourceBindings := Set new.
	destinationBindings := Set new.
	publisherComponents := Set new.
	publishedMessages := Set new.
	queues_for_dead_letter := Set new.
	alternate_exchange_for := Set new.
]

{ #category : #accessing }
RMQExchange >> internal [
	<MSEProperty: #internal type: #Boolean>
	^ internal
]

{ #category : #accessing }
RMQExchange >> internal: anObject [
	internal := anObject
]

{ #category : #accessing }
RMQExchange >> my_alternate_exchange [
	<MSEProperty: #my_alternate_exchange type: #RMQExchange opposite:#alternate_exchange_for>
	^ my_alternate_exchange
]

{ #category : #accessing }
RMQExchange >> my_alternate_exchange: anObject [
	my_alternate_exchange := anObject
]

{ #category : #accessing }
RMQExchange >> publishedMessages [
	<MSEProperty: #publishedMessages type: #RMQMessage opposite:#publishedToExchange>
	<multivalued>
	^ publishedMessages
]

{ #category : #accessing }
RMQExchange >> publishedMessages: anObject [
	publishedMessages := anObject
]

{ #category : #accessing }
RMQExchange >> publisherComponents [
	<MSEProperty: #publisherComponents type: #RMQPublisherComponent opposite:#exchanges>
	<multivalued>
	^ publisherComponents
]

{ #category : #accessing }
RMQExchange >> publisherComponents: anObject [
	publisherComponents := anObject
]

{ #category : #accessing }
RMQExchange >> queues_for_dead_letter [
	<MSEProperty: #queues_for_dead_letter type: #RMQQueue opposite:#dead_letter_exchange>
	<multivalued>
	^ queues_for_dead_letter
]

{ #category : #accessing }
RMQExchange >> queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #accessing }
RMQExchange >> sourceBindings [
	<MSEProperty: #sourceBindings type: #RMQBinding opposite:#source>
	<multivalued>
	^ sourceBindings
]

{ #category : #accessing }
RMQExchange >> sourceBindings: anObject [
	sourceBindings := anObject
]

{ #category : #accessing }
RMQExchange >> topicID [
	^ topicID
]

{ #category : #accessing }
RMQExchange >> topicID: anObject [
	topicID := anObject
]

{ #category : #accessing }
RMQExchange >> type [
	<MSEProperty: #type type: #ExchangeType opposite: #exchanges>
	^ type
]

{ #category : #accessing }
RMQExchange >> type: anObject [
	"| obj |
	obj := ExchangeType perform: anObject asSymbol."
	type := self selectEnum: anObject. 
	type exchanges add: self.
	

]

{ #category : #accessing }
RMQExchange >> user_who_performed_action [
	<MSEProperty: #user_who_performed_action type: #RMQUser opposite:#initializedExchanges>
	^ user_who_performed_action
]

{ #category : #accessing }
RMQExchange >> user_who_performed_action: anObject [
	user_who_performed_action := anObject
]

{ #category : #accessing }
RMQExchange >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#exchanges>
	^ vhost
]

{ #category : #accessing }
RMQExchange >> vhost: anObject [
	vhost := anObject
]
