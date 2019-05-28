Class {
	#name : #RMQBindingWithQueue,
	#superclass : #RMQBinding,
	#category : #'RMQ-Core-Model'
}

{ #category : #meta }
RMQBindingWithQueue class >> annotation [

	<MSEClass: #RMQBinding super: #RMQBindingWithQueue>
	<package: #Pulse>
	^self
]

{ #category : #accessing }
RMQBindingWithQueue >> destination [
<MSEProperty: #destination type: #RMQQueue opposite:#destinationBindings>
	^ destination
]
