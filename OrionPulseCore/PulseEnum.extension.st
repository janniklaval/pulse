Extension { #name : #PulseEnum }

{ #category : #'*OrionPulseCore' }
PulseEnum >> privatePulseName [
	^ rmqState
]

{ #category : #'*OrionPulseCore' }
PulseEnum >> privatePulseName: anObject [
	rmqState := anObject

]

{ #category : #'*OrionPulseCore' }
PulseEnum >> privateRmqState [
	^ rmqState
]

{ #category : #'*OrionPulseCore' }
PulseEnum >> privateRmqState: anObject [
	rmqState := anObject
]
