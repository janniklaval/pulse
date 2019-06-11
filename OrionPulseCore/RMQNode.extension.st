Extension { #name : #RMQNode }

{ #category : #'*OrionPulseCore' }
RMQNode >> privateCluster [
	^ cluster
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateCluster: anObject [
	cluster := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateCreationDate [
	^ creationDate
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateCreationDate: anObject [
	creationDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateDeletionDate [
	^ deletionDate
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateDeletionDate: anObject [
	deletionDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateHost [
	^ host
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateHost: anObject [
	host := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privatePort [
	^ port
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privatePort: anObject [
	port := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateRunning [
	^ running
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateRunning: anObject [
	running := anObject
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateType [
	^ type
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateType: anObject [
	type := self selectEnum: anObject. 
	type nodes add: self.
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateVhosts [
	^ vhosts
]

{ #category : #'*OrionPulseCore' }
RMQNode >> privateVhosts: anObject [
	vhosts := anObject
]
