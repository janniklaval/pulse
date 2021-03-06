Class {
	#name : #AmqpChannelHandler,
	#superclass : #Object,
	#instVars : [
		'connection',
		'channelNumber',
		'inbound',
		'state',
		'closeReason',
		'asyncMap',
		'currentCommand',
		'remainingBytes',
		'bodyPieces'
	],
	#category : #'Amqp-Protocol'
}

{ #category : #accessing }
AmqpChannelHandler >> channelNumber [
	^ channelNumber
]

{ #category : #accessing }
AmqpChannelHandler >> checkBodyCompletion [
	remainingBytes > 0
		ifTrue: [state := #handleBodyFrame:]
		ifFalse: [
			remainingBytes < 0
				ifTrue: [AmqpProtocolSyntaxError signal: 'Received body overrun'].
			currentCommand body: bodyPieces contents.
			self dispatchCommand].
]

{ #category : #accessing }
AmqpChannelHandler >> closeReason [
	^ closeReason
]

{ #category : #accessing }
AmqpChannelHandler >> connection [
	^ connection
]

{ #category : #accessing }
AmqpChannelHandler >> connection: anObject [
	connection := anObject.
	channelNumber := connection nextChannel.
	connection setChannel: channelNumber to: self.
]

{ #category : #accessing }
AmqpChannelHandler >> dispatchCommand [
	(asyncMap includesKey: currentCommand method class)
		ifTrue: [| a |
			a := asyncMap at: currentCommand method class.
			a key perform: a value with: currentCommand]
		ifFalse: [
			inbound add: currentCommand].
	self resetState.
]

{ #category : #accessing }
AmqpChannelHandler >> ensureOpen [
	closeReason notNil ifTrue: [AmqpDisconnectedError signal: 'Channel closed'].

]

{ #category : #accessing }
AmqpChannelHandler >> handleBodyFrame: frame [
	(frame isKindOf: AmqpContentBodyFrame)
		ifFalse: [AmqpProtocolSyntaxError signal: 'Unexpected frame kind'].
	remainingBytes := remainingBytes - frame fragment size.
	bodyPieces nextPutAll: frame fragment.
	self checkBodyCompletion.
]

{ #category : #accessing }
AmqpChannelHandler >> handleFrame: frame [
	self perform: state with: frame.
]

{ #category : #accessing }
AmqpChannelHandler >> handleMethodFrame: frame [
	(frame isKindOf: AmqpMethodFrame)
		ifFalse: [AmqpProtocolSyntaxError signal: 'Unexpected frame kind'].
	currentCommand := AmqpCommand new.
	currentCommand method: frame method.
	frame method hasContents
		ifTrue: [state := #handlePropertiesFrame:]
		ifFalse: [self dispatchCommand].
]

{ #category : #accessing }
AmqpChannelHandler >> handlePropertiesFrame: frame [
	(frame isKindOf: AmqpContentHeaderFrame)
		ifFalse: [AmqpProtocolSyntaxError signal: 'Unexpected frame kind'].
	currentCommand properties: frame properties.
	remainingBytes := frame bodySize.
	bodyPieces := WriteStream on: ByteArray new.
	self checkBodyCompletion.
]

{ #category : #accessing }
AmqpChannelHandler >> initialize [
	super initialize.
	asyncMap := Dictionary new.
	closeReason := nil.
	inbound := OrderedCollection new.
	self resetState
]

{ #category : #'as yet unclassified' }
AmqpChannelHandler >> internalClose: method [
	closeReason ifNil: [
		closeReason := method.
		connection resetChannel: channelNumber.
		self changed: #channelHandlerClosed.]
]

{ #category : #accessing }
AmqpChannelHandler >> mapEvent: evtClass to: receiver selector: aSymbol [
	asyncMap at: evtClass put: receiver -> aSymbol.
]

{ #category : #accessing }
AmqpChannelHandler >> resetState [
	state := #handleMethodFrame:.
	currentCommand := nil.
	remainingBytes := 0.
	bodyPieces := nil
]

{ #category : #'as yet unclassified' }
AmqpChannelHandler >> rpc: requestMethod [
	^ connection rpc: requestMethod onChannel: channelNumber
]

{ #category : #accessing }
AmqpChannelHandler >> waitForReply: acceptableReplies [
	| i |
	acceptableReplies ifNil: [^ nil].
	acceptableReplies ifEmpty: [^ nil].

	i := 1.
	[
		[i > inbound size] whileTrue: [
			self ensureOpen.
			connection mainLoopCycle].
		[i <= inbound size] whileTrue: [| cmd |
			cmd := inbound at: i.
			(acceptableReplies includes: cmd method class) ifTrue: [
				inbound removeAt: i.
				^ cmd].
			i := i + 1].
	] repeat.
]
