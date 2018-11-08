Class {
	#name : #RMQBinding,
	#superclass : #MooseEntity,
	#instVars : [
		'destinationType',
		'vhost',
		'sourceExchange',
		'creationDate',
		'deletionDate',
		'routingKey',
		'destinationQueue',
		'destinationExchange'
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
RMQBinding >> destinationExchange [
	<MSEProperty: #destinationExchange type: #RMQExchange opposite:#destinationBindings>
	^ destinationExchange
]

{ #category : #accessing }
RMQBinding >> destinationExchange: anObject [
	destinationExchange := anObject
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
]

{ #category : #accessing }
RMQBinding >> name [
	<MSEProperty: #name type: #String>
	
	^destinationType = 'exchange' ifTrue: [ 
		sourceExchange name, '>', destinationExchange name
		 ]
	ifFalse: [ 
		sourceExchange name, '>', destinationQueue name
		 ]
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

{ #category : #accessing }
RMQBinding >> vhost [

	<MSEProperty: #vhost type: #RMQVHost opposite:#bindings>
	^ vhost
]

{ #category : #accessing }
RMQBinding >> vhost: anObject [
	vhost := anObject
]
