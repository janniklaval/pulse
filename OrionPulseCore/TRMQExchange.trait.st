Trait {
	#name : #TRMQExchange,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQExchange classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQExchange >> alternate_exchange_for [
	^ self alternate_exchange_forOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> alternate_exchange_forOR: aVersion [
	^ self private_alternate_exchange_for versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> autoDelete [
	^ self autoDeleteOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> autoDeleteOR: aVersion [
	^ self privateAutoDelete versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> components [
	^ self componentsOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> componentsOR: aVersion [
	^ self privateComponents versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> creationDate [
	^ self creationDateOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> creationDateOR: aVersion [
	^ self privateCreationDate versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> deletionDate [
	^ self deletionDateOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> deletionDateOR: aVersion [
	^ self privateDeletionDate versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> destinationBindings [
	^ self destinationBindingsOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> destinationBindingsOR: aVersion [
	^ self privateDestinationBindings versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> durability [
	^ self durabilityOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> durabilityOR: aVersion [
	^ self privateDurability versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> internal [
	^ self internalOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> internalOR: aVersion [
	^ self privateInternal versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> messages [
	^ self messagesOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> messagesOR: aVersion [
	^ self privateMessages versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> my_alternate_exchange [
	^ self my_alternate_exchangeOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> my_alternate_exchangeOR: aVersion [
	^ self private_my_alternate_exchange versionIn: aVersion 
]

{ #category : #accessing }
TRMQExchange >> queues_for_dead_letter [
	^ self queues_for_dead_letterOR: self currentContext 
]

{ #category : #accessing }
TRMQExchange >> queues_for_dead_letterOR: aVersion [
	^ self private_queues_for_dead_letter versionIn: aVersion
]

{ #category : #accessing }
TRMQExchange >> sourceBindings [
	^ self sourceBindingsOR: self currentContext 
]

{ #category : #accessing }
TRMQExchange >> sourceBindingsOR: aVersion [
	^ self privateSourceBindings versionIn: aVersion 
]

{ #category : #accessing }
TRMQExchange >> type [
	^ self typeOR: self currentContext
]

{ #category : #accessing }
TRMQExchange >> typeOR: aVersion [
	^ self privateType versionIn: aVersion 
]

{ #category : #accessing }
TRMQExchange >> user_who_performed_action [
	^ self user_who_performed_actionOR: self currentContext 
]

{ #category : #accessing }
TRMQExchange >> user_who_performed_actionOR: aVersion [
	^ self private_user_who_performed_action versionIn: aVersion 
]

{ #category : #accessing }
TRMQExchange >> vhost [
	^ self vhostOR: self currentContext 
]

{ #category : #accessing }
TRMQExchange >> vhostOR: aVersion [
	^ self privateVhost versionIn: aVersion
]
