"
This exception is triggered when a method is not found in the current version of the model. Consequently, we are looking into the parent model of the entity... 
"
Class {
	#name : #OREntityNotFoundInCurrentModel,
	#superclass : #NotFound,
	#instVars : [
		'model'
	],
	#category : #'OrionCore-Exceptions'
}

{ #category : #signalling }
OREntityNotFoundInCurrentModel class >> signal: anObject model: aModel [ 
	^ self new
		object: anObject;
		model: aModel ;
		signal
]

{ #category : #private }
OREntityNotFoundInCurrentModel >> isResumable [
	^ true
]

{ #category : #accessing }
OREntityNotFoundInCurrentModel >> model: anORModel [ 
	model := anORModel
]
