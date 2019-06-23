Extension { #name : #PulseNode }

{ #category : #'*OrionPulseCore' }
PulseNode >> privateCluster [
	^ cluster
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateCluster: anObject [
	cluster := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateHost [
	^ host
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateHost: anObject [
	host := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privatePort [
	^ port
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privatePort: anObject [
	port := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateRunning [
	^ running
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateRunning: anObject [
	running := anObject
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateType [
	^ type
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateType: anObject [
	type := self selectEnum: anObject. 
	type nodes add: self.
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateVhosts [
	^ vhosts
]

{ #category : #'*OrionPulseCore' }
PulseNode >> privateVhosts: anObject [
	vhosts := anObject
]
