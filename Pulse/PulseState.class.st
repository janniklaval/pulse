Class {
	#name : #PulseState,
	#superclass : #PulseEnum,
	#instVars : [
		'#channels => FMMany type: #PulseChannel opposite: #pulseState',
		'#connections => FMMany type: #PulseConnection opposite: #pulseState',
		'#consumerComponents => FMMany type: #PulseConsumerComponent opposite: #pulseState',
		'#consumerProcesses => FMMany type: #PulseConsumerProcess opposite: #pulseState',
		'#publisherComponents => FMMany type: #PulsePublisherComponent opposite: #pulseState',
		'#queues => FMMany type: #PulseQueue opposite: #pulseState'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseState class >> annotation [

	<MSEClass: #State super: #PulseEnum>
	<package: #Pulse>
	^self
]

{ #category : #accessing }
PulseState class >> idle [
	^ self new pulseState: #idle
]

{ #category : #accessing }
PulseState class >> other [
	^ self new pulseState: #other
]

{ #category : #meta }
PulseState class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseState class >> running [
	^ self new pulseState: #running
]

{ #category : #accessing }
PulseState >> channels [

	<generated>
	<MSEComment: 'TODO'>
	^ channels
]

{ #category : #accessing }
PulseState >> channels: anObject [

	<generated>
	channels value: anObject

]

{ #category : #accessing }
PulseState >> connections [

	<generated>
	<MSEComment: 'TODO'>
	^ connections
]

{ #category : #accessing }
PulseState >> connections: anObject [

	<generated>
	connections value: anObject

]

{ #category : #accessing }
PulseState >> consumerComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerComponents
]

{ #category : #accessing }
PulseState >> consumerComponents: anObject [

	<generated>
	consumerComponents value: anObject

]

{ #category : #accessing }
PulseState >> consumerProcesses [

	<generated>
	<MSEComment: 'TODO'>
	^ consumerProcesses
]

{ #category : #accessing }
PulseState >> consumerProcesses: anObject [

	<generated>
	consumerProcesses value: anObject

]

{ #category : #accessing }
PulseState >> publisherComponents [

	<generated>
	<MSEComment: 'TODO'>
	^ publisherComponents
]

{ #category : #accessing }
PulseState >> publisherComponents: anObject [

	<generated>
	publisherComponents value: anObject

]

{ #category : #accessing }
PulseState >> queues [

	<generated>
	<MSEComment: 'TODO'>
	^ queues
]

{ #category : #accessing }
PulseState >> queues: anObject [

	<generated>
	queues value: anObject

]
