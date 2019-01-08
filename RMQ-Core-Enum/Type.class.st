Class {
	#name : #Type,
	#superclass : #PulseEntity,
	#instVars : [
		'rmqState'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #comparing }
Type >> = anEnum [
    ^ self class = anEnum class and: [ self rmqState = anEnum rmqState ]
]

{ #category : #comparing }
Type >> hash [
    ^ self class hash bitXor: self rmqState hash
]

{ #category : #printing }
Type >> printOn: aStream [
    super printOn: aStream.
    aStream << '(' << self rmqState asString << ')'
]

{ #category : #accessing }
Type >> pulseName [
	^ rmqState
]

{ #category : #accessing }
Type >> pulseName: anObject [
	rmqState := anObject

]

{ #category : #accessing }
Type >> rmqState [
	^ rmqState
]

{ #category : #accessing }
Type >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
Type >> state: anObject [
	self deprecated:'to be replaced by rmqState:'.
	rmqState := anObject
]
