Extension { #name : #PulseExchange }

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateAutoDelete [
	^ autoDelete
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateAutoDelete: anObject [
	autoDelete := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDestinationBindings [
	^ destinationBindings
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDestinationBindings: anObject [
	destinationBindings := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDurability [
	^ durability
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateDurability: anObject [
	durability := self selectEnum: anObject.
	durability exchanges add: self. 
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateInternal [
	^ internal
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateInternal: anObject [
	internal := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateSourceBindings [
	^ sourceBindings
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateSourceBindings: anObject [
	sourceBindings := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateType [
	^ type
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateType: anObject [
	"| obj |
	obj := ExchangeType perform: anObject asSymbol."
	type := self selectEnum: anObject. 
	type exchanges add: self.
	

]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateVhost [
	^ vhost
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> privateVhost: anObject [
	vhost := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_alternate_exchange_for [
	^ alternate_exchange_for
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_alternate_exchange_for: anObject [
	alternate_exchange_for := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_my_alternate_exchange [
	^ my_alternate_exchange
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_my_alternate_exchange: anObject [
	my_alternate_exchange := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_queues_for_dead_letter [
	^ queues_for_dead_letter
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_queues_for_dead_letter: anObject [
	queues_for_dead_letter := anObject
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_user_who_performed_action [
	^ user_who_performed_action
]

{ #category : #'*OrionPulseCore' }
PulseExchange >> private_user_who_performed_action: anObject [
	user_who_performed_action := anObject
]
