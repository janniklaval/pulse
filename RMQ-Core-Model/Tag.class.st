Class {
	#name : #Tag,
	#superclass : #PulseEnum,
	#instVars : [
		'roles'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #'as yet unclassified' }
Tag class >> administrator [
	^self new rmqState: #administrator
]

{ #category : #'as yet unclassified' }
Tag class >> management [
	^ self new rmqState: #management
]

{ #category : #'as yet unclassified' }
Tag class >> monitoring [
	^ self new rmqState: #monitoring
]

{ #category : #'instance creation' }
Tag class >> none [
	^ self new rmqState: #none
]

{ #category : #'as yet unclassified' }
Tag class >> policymaker [
	^ self new rmqState: #policymaker
]

{ #category : #initialization }
Tag >> initialize [

	super initialize.
	roles := Set new.
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
