Class {
	#name : #Amqp091BasicQosOk,
	#superclass : #AmqpProtocolMethod,
	#category : #'Amqp-Protocol-091'
}

{ #category : #'AMQP codec' }
Amqp091BasicQosOk >> acceptableResponseClasses [
	^ {
	}
]

{ #category : #'AMQP codec' }
Amqp091BasicQosOk >> codecMethodId [ ^ 3932171
]

{ #category : #'AMQP codec' }
Amqp091BasicQosOk >> decodeFrom: codec [
	| bitBuffer |

]

{ #category : #'AMQP codec' }
Amqp091BasicQosOk >> encodeOn: codec [
	| bitBuffer |

]

{ #category : #'AMQP codec' }
Amqp091BasicQosOk >> hasContents [ ^ false
]
