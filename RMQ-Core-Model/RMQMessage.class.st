Class {
	#name : #RMQMessage,
	#superclass : #MooseEntity,
	#instVars : [
		'messageID',
		'messageType',
		'payload',
		'encrypted',
		'timestamp',
		'deliveryMode',
		'redelivered',
		'priority',
		'exchangeFormat',
		'queue',
		'senderComponent',
		'routedQueues',
		'exchange'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQMessage >> deliveryMode [
	<MSEProperty: #deliveryMode type: #DeliveryMode opposite:#messages>
	^ deliveryMode
]

{ #category : #accessing }
RMQMessage >> deliveryMode: anObject [
	deliveryMode := anObject
]

{ #category : #accessing }
RMQMessage >> encrypted [
	<MSEProperty: #encrypted type: #Boolean>
	^ encrypted
]

{ #category : #accessing }
RMQMessage >> encrypted: anObject [
	encrypted := anObject
]

{ #category : #accessing }
RMQMessage >> exchange [
<MSEProperty: #exchange type: #RMQExchange opposite:#messages>
	^ exchange
]

{ #category : #accessing }
RMQMessage >> exchange: anObject [
	exchange := anObject
]

{ #category : #accessing }
RMQMessage >> exchangeFormat [
<MSEProperty: #exchangeFormat type: #RMQExchangeFormat opposite:#messages>
	^ exchangeFormat
]

{ #category : #accessing }
RMQMessage >> exchangeFormat: anObject [
	exchangeFormat := anObject
]

{ #category : #accessing }
RMQMessage >> initialize [

	super initialize.
	routedQueues := OrderedCollection new.
]

{ #category : #accessing }
RMQMessage >> messageID [
	<MSEProperty: #messageID type: #String>
	^ messageID
]

{ #category : #accessing }
RMQMessage >> messageID: anObject [
	messageID := anObject
]

{ #category : #accessing }
RMQMessage >> messageType [
	<MSEProperty: #messageType type: #MessageType opposite:#messages>
	^ messageType
]

{ #category : #accessing }
RMQMessage >> messageType: anObject [
	messageType := anObject
]

{ #category : #accessing }
RMQMessage >> payload [
	<MSEProperty: #payload type: #RMQPayload opposite:#messages>
	^ payload
]

{ #category : #accessing }
RMQMessage >> payload: anObject [
	payload := anObject
]

{ #category : #accessing }
RMQMessage >> priority [
	<MSEProperty: #priority type: #Number>
	^ priority
]

{ #category : #accessing }
RMQMessage >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
RMQMessage >> queue [
	<MSEProperty: #queue type: #RMQQueue opposite:#sendedMessages>
	^ queue
]

{ #category : #accessing }
RMQMessage >> queue: anObject [
	queue := anObject
]

{ #category : #accessing }
RMQMessage >> redelivered [
	<MSEProperty: #redelivered type: #Boolean>
	^ redelivered
]

{ #category : #accessing }
RMQMessage >> redelivered: anObject [
	redelivered := anObject
]

{ #category : #accessing }
RMQMessage >> routedQueues [
	<MSEProperty: #routedQueues type: #RMQQueue opposite:#messages>
	<multivalued>
	^ routedQueues
]

{ #category : #accessing }
RMQMessage >> routedQueues: anObject [
	routedQueues := anObject
]

{ #category : #accessing }
RMQMessage >> senderComponent [
	<MSEProperty: #senderComponent type: #RMQComponent opposite:#senderMessages>
	^ senderComponent
]

{ #category : #accessing }
RMQMessage >> senderComponent: anObject [
	senderComponent := anObject
]

{ #category : #accessing }
RMQMessage >> timestamp [
	<MSEProperty: #timestamp type: #Number>
	^ timestamp
]

{ #category : #accessing }
RMQMessage >> timestamp: anObject [
	timestamp := anObject
]
