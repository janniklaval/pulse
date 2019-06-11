Trait {
	#name : #TGuaranteeMode,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TGuaranteeMode classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TGuaranteeMode >> channels [
	^ self channelsOR: self currentContext
]

{ #category : #accessing }
TGuaranteeMode >> channelsOR: aVersion [
	^ self privateChannels versionIn: aVersion
]
