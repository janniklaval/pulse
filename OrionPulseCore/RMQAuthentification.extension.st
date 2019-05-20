Extension { #name : #RMQAuthentification }

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateFailureError [
	^ failureError
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateFailureError: anObject [
	failureError := anObject
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateSuccess [
	^ success
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateSuccess: anObject [
	success := anObject
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateTimestamp [
	^ timestamp
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateTimestamp: anObject [
	timestamp := anObject
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
RMQAuthentification >> privateUser: anObject [
	user := anObject
]
