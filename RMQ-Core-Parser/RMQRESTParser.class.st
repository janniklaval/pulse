Class {
	#name : #RMQRESTParser,
	#superclass : #Object,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withJson: aString [

	self subclassResponsibility 
]
