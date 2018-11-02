Class {
	#name : #Tag,
	#superclass : #Type,
	#instVars : [
		'roles'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
Tag class >> administrator [
	^ self new state: #administrator
]

{ #category : #'as yet unclassified' }
Tag class >> management [
	^ self new state: #management
]

{ #category : #'as yet unclassified' }
Tag class >> monitoring [
	^ self new state: #monitoring
]

{ #category : #'instance creation' }
Tag class >> none [
	^ self new state: #none
]

{ #category : #'as yet unclassified' }
Tag class >> policymaker [
	^ self new state: #policymaker
]

{ #category : #accessing }
Tag >> roles [
	<MSEProperty: #roles type: #RMQRole opposite:#tag>
	<multivalued>
	^ roles
]

{ #category : #accessing }
Tag >> roles: anObject [
	roles := anObject
]
