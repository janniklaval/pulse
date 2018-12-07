Class {
	#name : #RMQParser,
	#superclass : #Object,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQParser class >> populate: aModel withJson: aString [

	self subclassResponsibility 
]
