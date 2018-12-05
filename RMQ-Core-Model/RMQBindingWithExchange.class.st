Class {
	#name : #RMQBindingWithExchange,
	#superclass : #RMQBinding,
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQBindingWithExchange >> destination [
	<MSEProperty: #destination type: #RMQExchange opposite:#destinationBindings>
	^ destination
]
