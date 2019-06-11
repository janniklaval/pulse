Trait {
	#name : #TRMQBindingWithExchange,
	#traits : 'TRMQBinding',
	#classTraits : 'TRMQBinding classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQBindingWithExchange classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQBindingWithExchange >> destination [
	^ self destinationOR: self currentContext
]

{ #category : #accessing }
TRMQBindingWithExchange >> destinationOR: aVersion [
	^ self privateDestination versionIn: aVersion
]
