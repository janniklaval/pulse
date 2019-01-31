Class {
	#name : #Durability,
	#superclass : #Type,
	#instVars : [
		'queues',
		'exchanges'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #accessing }
Durability class >> durable [
	^self new rmqState: #durable	
]

{ #category : #accessing }
Durability class >> transient [
	^ self new rmqState: #transient
]

{ #category : #accessing }
Durability >> exchanges [
	<MSEProperty: #exchanges type: #RMQExchange opposite:#durability>
	<multivalued>
	^ exchanges
]

{ #category : #accessing }
Durability >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #initialization }
Durability >> initialize [
	super initialize.
	exchanges := Set new.
	queues := Set new.
]

{ #category : #accessing }
Durability >> queues [
	<MSEProperty: #queues type: #RMQQueue opposite:#durability>
	<multivalued>
	^ queues
]

{ #category : #accessing }
Durability >> queues: anObject [
	queues := anObject
]
