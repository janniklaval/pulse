Class {
	#name : #PulseNode,
	#superclass : #PulseEntity,
	#instVars : [
		'#cluster => FMOne type: #PulseCluster opposite: #nodes',
		'#creationDate',
		'#deletionDate',
		'#host',
		'#port',
		'#running',
		'#size_byte',
		'#type => FMOne type: #PulseNodeType opposite: #nodes',
		'#vhosts => FMMany type: #PulseVHost opposite: #node'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseNode class >> annotation [

	<MSEClass: #Node super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseNode class >> generatedSlotNames [
	<generated>
	'PulseNode class>>#generatedSlotNames'.
	^ #(cluster creationDate deletionDate host port running size_byte type vhosts)
]

{ #category : #generator }
PulseNode class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseNode class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseNode >> cluster [

	<generated>
	<MSEComment: 'TODO'>
	^ cluster
]

{ #category : #accessing }
PulseNode >> cluster: anObject [

	<generated>
	cluster := anObject

]

{ #category : #accessing }
PulseNode >> creationDate [

	<MSEProperty: #creationDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ creationDate
]

{ #category : #accessing }
PulseNode >> creationDate: anObject [

	<generated>
	creationDate := anObject

]

{ #category : #accessing }
PulseNode >> deletionDate [

	<MSEProperty: #deletionDate type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ deletionDate
]

{ #category : #accessing }
PulseNode >> deletionDate: anObject [

	<generated>
	deletionDate := anObject

]

{ #category : #accessing }
PulseNode >> host [

	<MSEProperty: #host type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ host
]

{ #category : #accessing }
PulseNode >> host: anObject [

	<generated>
	host := anObject

]

{ #category : #accessing }
PulseNode >> port [

	<MSEProperty: #port type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ port
]

{ #category : #accessing }
PulseNode >> port: anObject [

	<generated>
	port := anObject

]

{ #category : #accessing }
PulseNode >> running [

	<MSEProperty: #running type: #Boolean>
	<generated>
	<MSEComment: 'TODO'>
	^ running
]

{ #category : #accessing }
PulseNode >> running: anObject [

	<generated>
	running := anObject

]

{ #category : #accessing }
PulseNode >> size_byte [

	<MSEProperty: #size_byte type: #Number>
	<generated>
	<MSEComment: 'TODO'>
	^ size_byte
]

{ #category : #accessing }
PulseNode >> size_byte: anObject [

	<generated>
	size_byte := anObject

]

{ #category : #accessing }
PulseNode >> type [

	<generated>
	<MSEComment: 'TODO'>
	^ type
]

{ #category : #accessing }
PulseNode >> type: anObject [

	<generated>
	type := anObject

]

{ #category : #accessing }
PulseNode >> vhosts [

	<generated>
	<MSEComment: 'TODO'>
	^ vhosts
]

{ #category : #accessing }
PulseNode >> vhosts: anObject [

	<generated>
	vhosts value: anObject

]
