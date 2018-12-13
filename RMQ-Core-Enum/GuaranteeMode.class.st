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
	^ self new rmqState: #confirm
]

{ #category : #'instance creation' }
GuaranteeMode class >> none [
	^ self new rmqState: #none
]

{ #category : #'as yet unclassified' }
GuaranteeMode class >> transactional [
	^ self new rmqState: #transactional
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

{ #category : #initialization }
GuaranteeMode >> initialize [

	super initialize.
	channels := OrderedCollection new.
]
