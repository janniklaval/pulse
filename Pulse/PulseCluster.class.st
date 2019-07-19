Class {
	#name : #PulseCluster,
	#superclass : #PulseEntity,
	#instVars : [
		'#nodes => FMMany type: #PulseNode opposite: #cluster'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseCluster class >> annotation [

	<MSEClass: #Cluster super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseCluster class >> generatedSlotNames [
	<generated>
	'PulseCluster class>>#generatedSlotNames'.
	^ #(nodes)
]

{ #category : #generator }
PulseCluster class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseCluster class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseCluster >> nodes [

	<generated>
	<MSEComment: 'TODO'>
	^ nodes
]

{ #category : #accessing }
PulseCluster >> nodes: anObject [

	<generated>
	nodes value: anObject

]
