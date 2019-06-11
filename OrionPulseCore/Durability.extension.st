Extension { #name : #Durability }

{ #category : #'*OrionPulseCore' }
Durability >> privateExchanges [
	^ exchanges
]

{ #category : #'*OrionPulseCore' }
Durability >> privateExchanges: anObject [
	exchanges := anObject
]

{ #category : #'*OrionPulseCore' }
Durability >> privateQueues [
	^ queues
]

{ #category : #'*OrionPulseCore' }
Durability >> privateQueues: anObject [
	queues := anObject
]
