Class {
	#name : #AmqpProtocolProperties,
	#superclass : #Object,
	#category : #'Amqp-Protocol-Base'
}

{ #category : #'as yet unclassified' }
AmqpProtocolProperties >> codecClassId [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AmqpProtocolProperties >> decodeFlagsFrom: codec [
	| flags flagWordIndex partialFlags |
	flags := 0.
	flagWordIndex := 0.
	[
		partialFlags := codec nextShort.
		flags := flags bitOr: (partialFlags bitShift: (flagWordIndex * 16)).
		(partialFlags bitAnd: 1) = 0 ifTrue: [^ flags].
		flagWordIndex := flagWordIndex + 1.
	] repeat.
]

{ #category : #'as yet unclassified' }
AmqpProtocolProperties >> decodeFrom: codec [ 
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AmqpProtocolProperties >> encodeFlags: flagsToEncode on: codec [
	| flags remainder partialFlags |
	flags := flagsToEncode.
	[
		remainder := flags bitShift: -16.
		partialFlags := flags bitAnd: 16rFFFE.
		remainder = 0 ifFalse: [partialFlags := partialFlags bitOr: 1].
		codec nextShortPut: partialFlags.
		flags := remainder.
		flags = 0 ifTrue: [^ self].
	] repeat.
]

{ #category : #'as yet unclassified' }
AmqpProtocolProperties >> encodeOn: codec [ 
	self subclassResponsibility
]
