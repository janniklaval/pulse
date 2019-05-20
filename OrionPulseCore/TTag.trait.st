Trait {
	#name : #TTag,
	#traits : 'TPulseEnum',
	#classTraits : 'TPulseEnum classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TTag classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TTag >> roles [
	^ self rolesOR: self currentContext
]

{ #category : #accessing }
TTag >> rolesOR: aVersion [
	^ self privateRoles versionIn: aVersion
]
