Class {
	#name : #AmqpChannel,
	#superclass : #Object,
	#instVars : [
		'handler',
		'callbacks',
		'protocolClass'
	],
	#category : #'Amqp-Protocol'
}

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicAck: anInteger [
	self basicAck: anInteger multiple: false.

]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicAck: anInteger multiple: aBoolean [
	self rpc: (protocolClass basicAckMethod new
				deliveryTag: anInteger;
				multiple: aBoolean).
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicGet: aString [
	^ self basicGet: aString noAck: false

]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicGet: aString noAck: aBoolean [
	| result |
	result := self rpc: (protocolClass basicGetMethod new
						queue: aString;
						noAck: aBoolean).
	(result method isKindOf: protocolClass basicGetOkMethod) ifFalse: [^ nil].
	^ result
]

{ #category : #'AMQP sending messages' }
AmqpChannel >> basicPublish: aByteArray exchange: exchangeName routingKey: routingKey [
	^ self basicPublish: aByteArray exchange: exchangeName routingKey: routingKey properties: (protocolClass basicPropertiesClass new)
]

{ #category : #'AMQP sending messages' }
AmqpChannel >> basicPublish: aByteArray exchange: exchangeName routingKey: routingKey properties: aBasicProperties [
	^ self basicPublish: aByteArray exchange: exchangeName routingKey: routingKey properties: aBasicProperties mandatory: false immediate: false
]

{ #category : #'AMQP sending messages' }
AmqpChannel >> basicPublish: aByteArray exchange: exchangeName routingKey: routingKey properties: aBasicProperties mandatory: mandatory immediate: immediate [
	handler connection
		sendMethod: (protocolClass basicPublishMethod new
						exchange: exchangeName;
						routingKey: routingKey;
						mandatory: mandatory;
						immediate: immediate)
		properties: aBasicProperties
		body: aByteArray
		onChannel: handler channelNumber.
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicRecover [
	^ self basicRecover: false
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicRecover: shouldRequeue [
	^ self rpc: (protocolClass basicRecoverMethod new requeue: shouldRequeue)
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> basicReject: anInteger requeue: aBoolean [
	self rpc: (protocolClass basicRejectMethod new
				deliveryTag: anInteger;
				requeue: aBoolean)
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> cancelConsumer: consumerTag [
	self rpc: (protocolClass basicCancelMethod new consumerTag: consumerTag).
	callbacks removeKey: consumerTag ifAbsent: [].
]

{ #category : #'AMQP closing' }
AmqpChannel >> close [
	| c |
	handler closeReason ifNil: [
		c := protocolClass channelCloseMethod new
				replyCode: protocolClass replySuccess;
				replyText: 'Normal close';
				classId: 0;
				methodId: 0.
		handler rpc: c.
		handler internalClose: c].
]

{ #category : #'AMQP closing' }
AmqpChannel >> closeReason [
	^ handler closeReason
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> consumeFrom: queue callback: anObject selector: aSymbol [
	^ self consumeFrom: queue callback: anObject selector: aSymbol noAck: false exclusive: false consumerTag: ''
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> consumeFrom: queue callback: anObject selector: aSymbol noAck: noAck [
	^ self consumeFrom: queue callback: anObject selector: aSymbol noAck: noAck exclusive: false consumerTag: ''
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> consumeFrom: queue callback: anObject selector: aSymbol noAck: noAck exclusive: exclusive consumerTag: aString [
	| result |
	result := self rpc: (protocolClass basicConsumeMethod new
						queue: queue;
						consumerTag: aString;
						noAck: noAck;
						exclusive: exclusive).
	callbacks at: result method consumerTag put: anObject -> aSymbol.
	^ result method consumerTag
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> consumeFrom: queue callback: anObject selector: aSymbol noAck: noAck exclusive: exclusive consumerTag: aString arguments: aDictionary [
	| result |
	result := self rpc: (protocolClass basicConsumeMethod new
						queue: queue;
						consumerTag: aString;
						noAck: noAck;
						exclusive: exclusive;
						arguments: aDictionary).
	callbacks at: result method consumerTag put: anObject -> aSymbol.
	^ result method consumerTag
]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDeclare: exchangeName type: typeString [
	^ self exchangeDeclare: exchangeName type: typeString durable: false autoDelete: false passive: false arguments: nil
]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDeclare: exchangeName type: typeString durable: durable [
	^ self exchangeDeclare: exchangeName type: typeString durable: durable autoDelete: false passive: false arguments: nil
]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDeclare: exchangeName type: typeString durable: durable autoDelete: autoDelete passive: passive [
	^ self exchangeDeclare: exchangeName type: typeString durable: durable autoDelete: autoDelete passive: passive arguments: nil
]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDeclare: exchangeName type: typeString durable: durable autoDelete: autoDelete passive: passive arguments: aDictionary [
	^ self rpc: (protocolClass exchangeDeclareMethod new
					exchange: exchangeName;
					type: typeString;
					passive: passive;
					durable: durable;
					autoDelete: autoDelete;
					arguments: aDictionary)
]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDelete: exchangeName [
	^ self exchangeDelete: exchangeName ifUnused: false

]

{ #category : #'AMQP exchange management' }
AmqpChannel >> exchangeDelete: exchangeName ifUnused: aBoolean [
	^ self rpc: (protocolClass exchangeDeleteMethod new
					exchange: exchangeName;
					ifUnused: aBoolean)

]

{ #category : #'AMQP server-generated events' }
AmqpChannel >> handleBasicDeliver: cmd [
	| a |
	a := callbacks at: cmd method consumerTag.
	a key perform: a value with: cmd.
]

{ #category : #'AMQP server-generated events' }
AmqpChannel >> handleChannelClose: cmd [
	handler internalClose: cmd method.
	handler connection
		sendMethod: (protocolClass channelCloseOkMethod new)
		onChannel: handler channelNumber.
	"TODO: notify callbacks of closure"
]

{ #category : #accessing }
AmqpChannel >> handler [
	^ handler
]

{ #category : #accessing }
AmqpChannel >> handler: h [
	handler := h.
	handler addDependent: self.

	callbacks := Dictionary new.
	protocolClass := handler connection protocolClass.

	handler mapEvent: protocolClass channelCloseMethod to: self selector: #handleChannelClose:.
	handler mapEvent: protocolClass basicDeliverMethod to: self selector: #handleBasicDeliver:.
	handler mapEvent: protocolClass basicReturnMethod to: self selector: #handleBasicReturn:.
	handler mapEvent: protocolClass channelFlowMethod to: self selector: #handleChannelFlow:.
	
	self rpc: (protocolClass channelOpenMethod new).
]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> prefetchCount: prefetchCount [
	^ self prefetchCount: prefetchCount prefetchSize: 0 global: false

]

{ #category : #'AMQP receiving messages' }
AmqpChannel >> prefetchCount: prefetchCount prefetchSize: prefetchSize global: aBoolean [
	^ self rpc: (protocolClass basicQosMethod new
					prefetchSize: prefetchSize;
					prefetchCount: prefetchCount;
					global: aBoolean)
]

{ #category : #'AMQP private' }
AmqpChannel >> protocolClass [
	^ protocolClass
]

{ #category : #'AMQP binding management' }
AmqpChannel >> queueBind: queue exchange: exchange routingKey: routingKey [
	^ self queueBind: queue exchange: exchange routingKey: routingKey arguments: nil

]

{ #category : #'AMQP binding management' }
AmqpChannel >> queueBind: queue exchange: exchange routingKey: routingKey arguments: aDictionary [
	^ self rpc: (protocolClass queueBindMethod new
					queue: queue;
					exchange: exchange;
					routingKey: routingKey;
					arguments: aDictionary)
]

{ #category : #'AMQP queue management' }
AmqpChannel >> queueDeclare: queueName [
	^ self queueDeclare: queueName durable: false exclusive: false autoDelete: false passive: false arguments: nil

]

{ #category : #'AMQP queue management' }
AmqpChannel >> queueDeclare: queueName durable: durable [
	^ self queueDeclare: queueName durable: durable exclusive: false autoDelete: false passive: false arguments: nil

]

{ #category : #'AMQP queue management' }
AmqpChannel >> queueDeclare: queueName durable: durable exclusive: exclusive autoDelete: autoDelete passive: passive arguments: aDictionary [
	^ self rpc: (protocolClass queueDeclareMethod new
					queue: queueName;
					passive: passive;
					durable: durable;
					exclusive: exclusive;
					autoDelete: autoDelete;
					arguments: aDictionary)
]

{ #category : #'AMQP queue management' }
AmqpChannel >> queueDelete: queueName [
	^ self queueDelete: queueName ifUnused: false ifEmpty: false

]

{ #category : #'AMQP queue management' }
AmqpChannel >> queueDelete: queueName ifUnused: ifUnused ifEmpty: ifEmpty [
	^ self rpc: (protocolClass queueDeleteMethod new
					queue: queueName;
					ifUnused: ifUnused;
					ifEmpty: ifEmpty)

]

{ #category : #'AMQP queue management' }
AmqpChannel >> queuePurge: queue [
	^ self rpc: (protocolClass queuePurgeMethod new queue: queue)
]

{ #category : #'AMQP binding management' }
AmqpChannel >> queueUnbind: queue exchange: exchange routingKey: routingKey [
	^ self queueUnbind: queue exchange: exchange routingKey: routingKey arguments: nil

]

{ #category : #'AMQP binding management' }
AmqpChannel >> queueUnbind: queue exchange: exchange routingKey: routingKey arguments: aDictionary [
	^ self rpc: (protocolClass queueUnbindMethod new
					queue: queue;
					exchange: exchange;
					routingKey: routingKey;
					arguments: aDictionary)
]

{ #category : #'AMQP private' }
AmqpChannel >> rpc: requestMethod [
	^ handler rpc: requestMethod
]

{ #category : #'AMQP local transactions' }
AmqpChannel >> txCommit [
	^ self rpc: (protocolClass txCommitMethod new)
]

{ #category : #'AMQP local transactions' }
AmqpChannel >> txRollback [
	^ self rpc: (protocolClass txRollbackMethod new)
]

{ #category : #'AMQP local transactions' }
AmqpChannel >> txSelect [
	^ self rpc: (protocolClass txSelectMethod new)
]

{ #category : #'AMQP private' }
AmqpChannel >> update: aSymbol [
	aSymbol == #channelHandlerClosed ifTrue: [
		self changed: #channelClosed].
	^ super update: aSymbol
]
