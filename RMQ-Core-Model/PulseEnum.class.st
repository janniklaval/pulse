Class {
	#name : #PulseEnum,
	#superclass : #PulseEntity,
	#instVars : [
		'rmqState'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #comparing }
PulseEnum >> = anEnum [
    ^ self class = anEnum class and: [ self rmqState = anEnum rmqState ]
]

{ #category : #comparing }
PulseEnum >> hash [
    ^ self class hash bitXor: self rmqState hash
]

{ #category : #printing }
PulseEnum >> printOn: aStream [
    super printOn: aStream.
    aStream << '(' << self rmqState asString << ')'
]

{ #category : #accessing }
PulseEnum >> pulseName [
	^ rmqState
]

{ #category : #accessing }
PulseEnum >> pulseName: anObject [
	rmqState := anObject

]

{ #category : #accessing }
PulseEnum >> rmqState [
	^ rmqState
]

{ #category : #accessing }
PulseEnum >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
PulseEnum >> state: anObject [
	self deprecated:'to be replaced by rmqState:'.
	rmqState := anObject
]
