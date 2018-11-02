Class {
	#name : #GuaranteeMode,
	#superclass : #Type,
	#instVars : [
		'channels'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #'as yet unclassified' }
GuaranteeMode class >> confirm [
	^ self new state: #confirm
]

{ #category : #'instance creation' }
GuaranteeMode class >> none [
	^ self new state: #none
]

{ #category : #'as yet unclassified' }
GuaranteeMode class >> transactional [
	^ self new state: #transactional
]

{ #category : #accessing }
GuaranteeMode >> channels [
	<MSEProperty: #channels type: #RMQChannel opposite:#guaranteeMode>
	<multivalued>
	^ channels
]

{ #category : #accessing }
GuaranteeMode >> channels: anObject [
	channels := anObject
]
