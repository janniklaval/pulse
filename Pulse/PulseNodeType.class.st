Class {
	#name : #PulseNodeType,
	#superclass : #PulseEnum,
	#instVars : [
		'#nodes => FMMany type: #PulseNode opposite: #type'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseNodeType class >> annotation [

	<MSEClass: #NodeType super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #'as yet unclassified' }
PulseNodeType class >> disc [
	^ self new pulseState: #disc
]

{ #category : #'as yet unclassified' }
PulseNodeType class >> ram [
	^ self new pulseState: #ram
]

{ #category : #meta }
PulseNodeType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseNodeType >> nodes [

	<generated>
	<MSEComment: 'TODO'>
	^ nodes
]

{ #category : #accessing }
PulseNodeType >> nodes: anObject [

	<generated>
	nodes value: anObject

]
