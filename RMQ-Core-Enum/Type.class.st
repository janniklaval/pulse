Class {
	#name : #Type,
	#superclass : #MooseEntity,
	#instVars : [
		'rmqState'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #comparing }
Type >> = anEnum [
    ^ self class = anEnum class and: [ self state = anEnum state ]
]

{ #category : #comparing }
Type >> hash [
    ^ self class hash bitXor: self state hash
]

{ #category : #printing }
Type >> printOn: aStream [
    super printOn: aStream.
    aStream << '(' << self state asString << ')'
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
Type >> state [
	^ state
]

{ #category : #accessing }
Type >> state: anObject [
	self deprecated:'to be replaced by rmqState:'.
	rmqState := anObject
]
