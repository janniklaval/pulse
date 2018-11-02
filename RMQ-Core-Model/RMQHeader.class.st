Class {
	#name : #RMQHeader,
	#superclass : #RMQProperty,
	#instVars : [
		'headerString'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQHeader >> headerString [
	<MSEProperty: #headerString type: #String>
	^ headerString
]

{ #category : #accessing }
RMQHeader >> headerString: anObject [
	headerString := anObject
]

{ #category : #accessing }
RMQHeader >> name [
	<MSEProperty: #name type: #String>	
	^ self headerString asString
]
