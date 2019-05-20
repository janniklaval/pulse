Extension { #name : #RMQExchange }

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateAutoDelete [
	^ autoDelete
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateAutoDelete: anObject [
	autoDelete := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateComponents [
	^ components
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateComponents: anObject [
	components := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDestinationBindings [
	^ destinationBindings
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDestinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDurability [
	^ durability
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateDurability: anObject [
	durability := self selectEnum: anObject.
	durability exchanges add: self. 
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateInternal [
	^ internal
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateInternal: anObject [
	internal := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateMessages [
	^ messages
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateMessages: anObject [
	messages := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateSourceBindings [
	^ sourceBindings
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateSourceBindings: anObject [
	sourceBindings := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateType [
	^ type
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateType: anObject [
	"| obj |
	obj := ExchangeType perform: anObject asSymbol."
	type := self selectEnum: anObject. 
	type exchanges add: self.
	

]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_alternate_exchange_for [
	^ alternate_exchange_for
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_alternate_exchange_for: anObject [
	alternate_exchange_for := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_my_alternate_exchange [
	^ my_alternate_exchange
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_my_alternate_exchange: anObject [
	my_alternate_exchange := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_user_who_performed_action [
	^ user_who_performed_action
]

{ #category : #'*OrionPulseCore' }
RMQExchange >> private_user_who_performed_action: anObject [
	user_who_performed_action := anObject
]
