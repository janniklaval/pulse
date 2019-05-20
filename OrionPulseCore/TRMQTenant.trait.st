Trait {
	#name : #TRMQTenant,
	#traits : 'TPulseEntity',
	#classTraits : 'TPulseEntity classTrait',
	#category : #'OrionPulseCore-Trait'
}

{ #category : #testing }
TRMQTenant classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TRMQTenant >> component [
	^ self componentOR: self currentContext 
]

{ #category : #accessing }
TRMQTenant >> componentOR: aVersion [
	^ self privateComponent versionIn: aVersion 
]

{ #category : #accessing }
TRMQTenant >> tenantId [
	^ self tenantIdOR: self currentContext 
]

{ #category : #accessing }
TRMQTenant >> tenantIdOR: aVersion [
	^ self privateTenantId versionIn: aVersion 
]
