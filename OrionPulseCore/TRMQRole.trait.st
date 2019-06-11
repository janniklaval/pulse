Trait {
	#name : #TRMQRole,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQRole classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQRole >> settingDate [
	^ self settingDateOR: self currentContext 
]

{ #category : #accessing }
TRMQRole >> settingDateOR: aVersion [
	^ self privateSettingDate versionIn: aVersion
]

{ #category : #accessing }
TRMQRole >> tag [
	^ self tagOR: self currentContext 
]

{ #category : #accessing }
TRMQRole >> tagOR: aVersion [
	^ self privateTag versionIn: aVersion 
]

{ #category : #accessing }
TRMQRole >> user [
	^ self userOR: self currentContext 
]

{ #category : #accessing }
TRMQRole >> userOR: aVersion [
	^ self privateUser versionIn: aVersion 
]
