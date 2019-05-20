Trait {
	#name : #TRMQAuthentification,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQAuthentification classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQAuthentification >> failureError [
	^ self failureErrorOR: self currentContext
]

{ #category : #accessing }
TRMQAuthentification >> failureErrorOR: aVersion [
	^ self privateFailureError versionIn: aVersion
]

{ #category : #accessing }
TRMQAuthentification >> success [
	^ self successOR: self currentContext
]

{ #category : #accessing }
TRMQAuthentification >> successOR: aVersion [
	^ self privateSuccess versionIn: aVersion
]

{ #category : #accessing }
TRMQAuthentification >> timeStamp [
	^ self timeStampOR: self currentContext
]

{ #category : #accessing }
TRMQAuthentification >> timeStampOR: aVersion [
	^ self privateTimestamp versionIn: aVersion
]

{ #category : #accessing }
TRMQAuthentification >> user [
	^ self userOR: self currentContext
]

{ #category : #accessing }
TRMQAuthentification >> userOR: aVersion [
	^ self privateUser versionIn: aVersion
]
