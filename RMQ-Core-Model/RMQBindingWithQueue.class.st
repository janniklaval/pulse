Class {
	#name : #RMQBindingWithQueue,
	#superclass : #RMQBinding,
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQBindingWithQueue >> destination [
<MSEProperty: #destination type: #RMQQueue opposite:#destinationBindings>
	^ destination
]
