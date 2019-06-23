Extension { #name : #PulseComponentType }

{ #category : #'*OrionPulseCore' }
PulseComponentType >> privateConsumerComponents [
	^ consumerComponents
]

{ #category : #'*OrionPulseCore' }
PulseComponentType >> privateConsumerComponents: anObject [
	consumerComponents := anObject
]

{ #category : #'*OrionPulseCore' }
PulseComponentType >> privatePublisherComponents [
	^ publisherComponents
]

{ #category : #'*OrionPulseCore' }
PulseComponentType >> privatePublisherComponents: anObject [
	publisherComponents := anObject
]
