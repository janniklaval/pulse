Class {
	#name : #RMQExchange,
	#superclass : #MooseEntity,
	#instVars : [
		'exchangeString',
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
RMQExchange >> components [
	<MSEProperty: #components type: #RMQComponent opposite:#exchanges>
	<multivalued>
	^ components
]

{ #category : #accessing }
RMQExchange >> components: anObject [
	components := anObject
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
	<MSEProperty: #destinationBindings type: #RMQBinding opposite:#destinationExchange>
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
	durability := anObject
]

{ #category : #accessing }
RMQExchange >> exchangeString [
	<MSEProperty: #exchangeString type: #String>
	^ exchangeString
]

{ #category : #accessing }
RMQExchange >> exchangeString: anObject [
	exchangeString := anObject
]

{ #category : #accessing }
RMQExchange >> initialize [

	super initialize.
	sourceBindings := OrderedCollection new.
	destinationBindings := OrderedCollection new.
	components := OrderedCollection new.
	messages := OrderedCollection new.
	queues_for_dead_letter := OrderedCollection new.
	alternate_exchange_for := OrderedCollection new.
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
RMQExchange >> messages [
	<MSEProperty: #messages type: #RMQMessage opposite:#exchange>
	<multivalued>
	^ messages
]

{ #category : #accessing }
RMQExchange >> messages: anObject [
	messages := anObject
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
RMQExchange >> name [
	<MSEProperty: #name type: #String>
	^ self exchangeString
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
	<MSEProperty: #sourceBindings type: #RMQBinding opposite:#sourceExchange>
	<multivalued>
	^ sourceBindings
]

{ #category : #accessing }
RMQExchange >> sourceBindings: anObject [
	sourceBindings := anObject
]

{ #category : #accessing }
RMQExchange >> type [
	<MSEProperty: #type type: #ExchangeType opposite: #exchanges>
	^ type
]

{ #category : #accessing }
RMQExchange >> type: anObject [
	type := anObject
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
