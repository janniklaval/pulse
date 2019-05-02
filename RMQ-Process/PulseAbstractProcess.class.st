"
Abstract place to be inhereted by the processes 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	frequency:		<Object>
	process:		<Object>


    Implementation Points
"
Class {
	#name : #PulseAbstractProcess,
	#superclass : #Object,
	#instVars : [
		'frequency',
		'process'
	],
	#classInstVars : [
		'UniqueInstance'
	],
	#category : #'RMQ-Process'
}

{ #category : #'instance creation' }
PulseAbstractProcess class >> new [
	self error: 'PulseXXXProcess is a singleton -- send uniqueInstance instead'

]

{ #category : #'instance creation' }
PulseAbstractProcess class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
PulseAbstractProcess >> blockToExecute [

		^self subclassResponsibility 
]

{ #category : #accessing }
PulseAbstractProcess >> blockToFinalize [

	^self subclassResponsibility 
]

{ #category : #accessing }
PulseAbstractProcess >> frequency [

	^frequency
]

{ #category : #accessing }
PulseAbstractProcess >> frequency: anObject [
	frequency := anObject
]

{ #category : #accessing }
PulseAbstractProcess >> initialize [

	super initialize.
	frequency := 1 second.
]

{ #category : #accessing }
PulseAbstractProcess >> start [
	process ifNotNil: [ self stop ].
	process := [ 
		self blockToExecute.
		frequency wait
		] fork.
]

{ #category : #accessing }
PulseAbstractProcess >> stop [
		process ifNotNil: [
		process terminate.
		process := nil].
		self blockToFinalize 
]
