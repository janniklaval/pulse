Class {
	#name : #RMQMessage,
	#superclass : #PulseEntity,
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
		'publisherComponent',
		'routedQueues',
		'routingKeys',
		'publishedToExchange',
		'routedToQueues',
		'deliveredFromQueues'
	],
	#classInstVars : [
		'received'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQMessage >> deliveredFromQueues [
   <MSEProperty: #deliveredFromQueues type: #RMQQueue opposite:#deliveredMessages>
   <multivalued>
	^ deliveredFromQueues
]

{ #category : #accessing }
RMQMessage >> deliveredFromQueues: anObject [
	deliveredFromQueues := anObject
]

{ #category : #accessing }
RMQMessage >> deliveryMode [
	<MSEProperty: #deliveryMode type: #DeliveryMode opposite:#messages>
	^ deliveryMode
]

{ #category : #accessing }
RMQMessage >> deliveryMode: anObject [
	deliveryMode := self selectEnum: anObject. 
	deliveryMode messages add: self.
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
	routedToQueues := Set new.
	deliveredFromQueues := Set new.
	routingKeys := Set new.  
]

{ #category : #accessing }
RMQMessage >> messageID [
	<MSEProperty: #messageID type: #String>
	^ self pulseName
]

{ #category : #accessing }
RMQMessage >> messageID: anObject [
	^self pulseName: anObject
]

{ #category : #accessing }
RMQMessage >> messageType [
	<MSEProperty: #messageType type: #MessageType opposite:#messages>
	^ messageType
]

{ #category : #accessing }
RMQMessage >> messageType: anObject [
	messageType := self selectEnum: anObject. 
	messageType messages add: self.
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
RMQMessage >> publishedToExchange [
<MSEProperty: #publishedToExchange type: #RMQExchange opposite:#publishedMessages>
	^ publishedToExchange
]

{ #category : #accessing }
RMQMessage >> publishedToExchange: anObject [
	publishedToExchange := anObject
]

{ #category : #accessing }
RMQMessage >> publisherComponent [
	<MSEProperty: #publisherComponent type: #RMQPublisherComponent opposite:#messagesFromPublisher>
	^ publisherComponent
]

{ #category : #accessing }
RMQMessage >> publisherComponent: anObject [
	publisherComponent := anObject
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
RMQMessage >> routedToQueues [
   <MSEProperty: #routedToQueues type: #RMQQueue opposite:#routedMessages>
   <multivalued>
	^ routedToQueues
]

{ #category : #accessing }
RMQMessage >> routedToQueues: anObject [
	routedToQueues := anObject
]

{ #category : #accessing }
RMQMessage >> routingKeys [
	<MSEProperty: #routingKey type: #RMQRoutingKey opposite:#messages>
	^ routingKeys
]

{ #category : #accessing }
RMQMessage >> routingKeys: anObject [
	routingKeys := anObject
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
