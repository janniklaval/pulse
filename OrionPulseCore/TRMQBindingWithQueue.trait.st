Trait {
	#name : #TRMQBindingWithQueue,
	#traits : 'TRMQBinding',
	#classTraits : 'TRMQBinding classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQBindingWithQueue classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQBindingWithQueue >> destination [
	^ self destinationOR: self currentContext
]

{ #category : #accessing }
TRMQBindingWithQueue >> destinationOR: aVersion [
	^ self privateDestination versionIn: aVersion
]
