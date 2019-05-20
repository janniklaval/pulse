Trait {
	#name : #TRMQRoutingKey,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQRoutingKey classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQRoutingKey >> binding [
	^ self bindingOR: self currentContext 
]

{ #category : #accessing }
TRMQRoutingKey >> bindingOR: aVersion [
	^ self privateBinding versionIn: aVersion 
]

{ #category : #accessing }
TRMQRoutingKey >> queues_for_dead_letter [
	^ self queues_for_dead_letterOR: self currentContext 
]

{ #category : #accessing }
TRMQRoutingKey >> queues_for_dead_letterOR: aVersion [
	^ self private_queues_for_dead_letter versionIn: aVersion 
]
