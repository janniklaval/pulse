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
		'process',
		'source'
	],
	#classInstVars : [
		'UniqueInstance'
	],
	#category : #'Pulse-Process'
}

{ #category : #'instance creation' }
PulseAbstractProcess class >> new [
	self error: 'PulseXXXProcess is a singleton -- send uniqueInstance instead'

]

{ #category : #'instance creation' }
PulseAbstractProcess class >> uniqueInstance [
	^ self uniqueInstanceOn: 'none'
]

{ #category : #'instance creation' }
PulseAbstractProcess class >> uniqueInstanceOn: aSource [
	UniqueInstance ifNil: [ UniqueInstance := self basicNew initialize ].
	UniqueInstance source: aSource.
	^ UniqueInstance 
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
PulseAbstractProcess >> process [
	^ process
]

{ #category : #accessing }
PulseAbstractProcess >> process: anObject [
	^ process := anObject
]

{ #category : #accessing }
PulseAbstractProcess >> source [
	^ source
]

{ #category : #accessing }
PulseAbstractProcess >> source: anObject [
	source := anObject
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
