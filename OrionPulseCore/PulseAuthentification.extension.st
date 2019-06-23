Extension { #name : #PulseAuthentification }

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateFailureError [
	^ failureError
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateFailureError: anObject [
	failureError := anObject
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateSuccess [
	^ success
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateSuccess: anObject [
	success := anObject
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateTimestamp [
	^ timestamp
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateTimestamp: anObject [
	timestamp := anObject
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
PulseAuthentification >> privateUser: anObject [
	user := anObject
]
