Class {
	#name : #RMQBinding,
	#superclass : #MooseEntity,
	#instVars : [
		'destinationType',
		'vhost',
		'sourceExchange',
		'destinationExchanges',
		'creationDate',
		'deletionDate',
		'routingKey',
		'destinationQueue'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQBinding >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQBinding >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQBinding >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQBinding >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQBinding >> destinationExchanges [
	<MSEProperty: #destinationExchanges type: #RMQExchange opposite:#destinationBindings>
		<multivalued>
	^ destinationExchanges
]

{ #category : #accessing }
RMQBinding >> destinationExchanges: anObject [
	destinationExchanges := anObject
]

{ #category : #accessing }
RMQBinding >> destinationQueue [
<MSEProperty: #destinationQueue type: #RMQQueue opposite:#destinationBindings>
	^ destinationQueue
]

{ #category : #accessing }
RMQBinding >> destinationQueue: anObject [
	destinationQueue := anObject
]

{ #category : #accessing }
RMQBinding >> destinationType [
	<MSEProperty: #destinationType type: #DestinationType opposite:#bindings>
	^ destinationType
]

{ #category : #accessing }
RMQBinding >> destinationType: anObject [
	destinationType := anObject
]

{ #category : #initialization }
RMQBinding >> initialize [
	
	super initialize.
	routingKeys := OrderedCollection new
]

{ #category : #accessing }
RMQBinding >> name [
	<MSEProperty: #name type: #String>
	^ self sourceExchange asString, '>>', destinationQueues asString
]

{ #category : #accessing }
RMQBinding >> routingKey [
	<MSEProperty: #routingKey type: #RMQRoutingKey opposite:#binding>
	<multivalued>
	^ routingKey
]

{ #category : #accessing }
RMQBinding >> routingKey: anObject [
	routingKey := anObject
]

{ #category : #accessing }
RMQBinding >> sourceExchange [
<MSEProperty: #sourceExchange type: #RMQExchange opposite:#sourceBindings>
	^ sourceExchange
]

{ #category : #accessing }
RMQBinding >> sourceExchange: anObject [
	sourceExchange := anObject
]
