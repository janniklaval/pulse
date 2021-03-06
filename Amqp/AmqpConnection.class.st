Class {
	#name : #AmqpConnection,
	#superclass : #Object,
	#instVars : [
		'socket',
		'codec',
		'credentials',
		'parameters',
		'virtualHost',
		'isOpen',
		'closeReason',
		'channels',
		'nextChannel',
		'protocolClass'
	],
	#category : #'Amqp-Protocol'
}

{ #category : #'as yet unclassified' }
AmqpConnection class >> protocolClass [
	^ Amqp091
]

{ #category : #'as yet unclassified' }
AmqpConnection >> close [
	| c |
	isOpen ifTrue: [
		isOpen := false.
		c := (self protocolClass connectionCloseMethod new
					replyCode: self protocolClass replySuccess;
					replyText: 'Normal shutdown';
					classId: 0;
					methodId: 0).
		self rpc: c onChannel: 0.
		self internalClose: c.].
	socket close.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> closeReason [
	^ closeReason
]

{ #category : #accessing }
AmqpConnection >> codec [
	^ codec
]

{ #category : #accessing }
AmqpConnection >> codec: anObject [
	codec := anObject
]

{ #category : #accessing }
AmqpConnection >> credentials [
	^ credentials
]

{ #category : #accessing }
AmqpConnection >> credentials: anObject [
	credentials := anObject
]

{ #category : #'as yet unclassified' }
AmqpConnection >> ensureChannel: channelNumber [
	self ensureOpen.
	^ (channels at: channelNumber) ensureOpen.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> ensureOpen [
	closeReason notNil ifTrue: [AmqpDisconnectedError signal: 'Connection closed'].
]

{ #category : #'as yet unclassified' }
AmqpConnection >> handleConnectionClose: cmd [
	self internalClose: cmd method.
	isOpen := false.
	self sendMethod: (self protocolClass connectionCloseOkMethod new) onChannel: 0.
	socket close.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> hardClose [
	| c |
	isOpen ifTrue: [
		isOpen := false.
		c := (self protocolClass connectionCloseMethod new
					replyCode: self protocolClass internalError;
					replyText: 'Abnormal disconnection').
		self internalClose: c.].
	socket close.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> host: hostName [
	^ self host: hostName port: self protocolClass portNumber
]

{ #category : #'as yet unclassified' }
AmqpConnection >> host: hostName port: portNumber [
	socket connectToHostNamed: hostName port: portNumber.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> initialize [
	super initialize.
	socket := Socket newTCP.
	credentials := AmqpPlainCredentials new
					username: 'guest';
					password: 'guest'.
	parameters := AmqpConnectionParameters new
					channelMax: 0;
					frameMax: 131072;
					heartbeat: 0.
	virtualHost := '/'.
	isOpen := false.
	closeReason := nil.
	channels := Dictionary new.
	nextChannel := 0.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> installChannel0 [
	| c |
	c := AmqpChannelHandler new connection: self.
	c mapEvent: self protocolClass connectionCloseMethod to: self selector: #handleConnectionClose:.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> internalClose: method [
	closeReason ifNil: [
		closeReason := method.
		channels values copy do: [:ch | ch internalClose: method].
		self changed: #connectionClosed.]
]

{ #category : #'as yet unclassified' }
AmqpConnection >> mainLoopCycle [
	| frame |
	frame := self nextFrame.
	frame ifNil: [self hardClose. ^ self].
	(frame isKindOf: AmqpHeartbeatFrame)
		ifTrue: [self sendFrame: frame]
		ifFalse: [(channels at: frame channelNumber) handleFrame: frame].
]

{ #category : #'as yet unclassified' }
AmqpConnection >> newChannel [
	| c |
	self ensureOpen.
	c := AmqpChannelHandler new connection: self.
	^ AmqpChannel new handler: c.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> nextChannel [
	| tries limit |
	tries := 0.
	limit := parameters channelMax.
	(limit isNil or: [limit = 0]) ifTrue: [limit := 32767].
	[channels includesKey: nextChannel] whileTrue: [
		nextChannel := nextChannel + 1 rem: limit.
		tries := tries + 1.
		nextChannel = 0 ifTrue: [nextChannel := 1].
		tries > limit ifTrue: [AmqpResourceError signal: 'No free channels']].
	^ nextChannel
]

{ #category : #'as yet unclassified' }
AmqpConnection >> nextFrame [
	| type channel length fc f |
	[
		type := codec nextOctet.
		type ifNil: [^ nil].
		channel := codec nextShort.
		length := codec nextLong.
		fc := self protocolClass frameClassFor: type.
		fc notNil ifTrue: [
			f := fc new.
			f frameType: type.
			f channelNumber: channel.
			f readFrom: self length: length.
			codec nextOctet = self protocolClass frameEnd ifFalse: [
				AmqpProtocolSyntaxError signal: 'Missing frame end marker'].
			^ f]
	] repeat.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> open [
	| pc response |
	codec := AmqpCodec new.
	codec stream: (SocketStream on: socket).
	codec stream binary.
	pc := self protocolClass.
	codec stream nextPutAll: pc protocolHeader.
	codec flush.
	response := credentials responseFor: self nextFrame method.
	response ifNil: [AmqpDisconnectedError
					signal: 'No acceptable SASL mechanism for the given credentials'].
	self sendMethod: (pc connectionStartOkMethod new
						clientProperties: (Dictionary new at: 'product' put: 'RabbitMQ Smalltalk';
											yourself);
						mechanism: response key;
						response: response value)
		onChannel: 0.
	credentials := nil.
	parameters applyServerSettings: self nextFrame method.
	self sendMethod: (pc connectionTuneOkMethod new
						channelMax: parameters channelMax;
						frameMax: parameters frameMax;
						heartbeat: parameters heartbeat)
		onChannel: 0.
	self installChannel0.
	self rpc: (pc connectionOpenMethod new virtualHost: virtualHost)
		onChannel: 0.
	isOpen := true.
]

{ #category : #accessing }
AmqpConnection >> parameters [
	^ parameters
]

{ #category : #accessing }
AmqpConnection >> parameters: anObject [
	parameters := anObject
]

{ #category : #'as yet unclassified' }
AmqpConnection >> processAsyncEvents [
	[self ensureOpen. codec stream isDataAvailable or: [socket isConnected not]]
		whileTrue: [self mainLoopCycle].
]

{ #category : #'as yet unclassified' }
AmqpConnection >> protocolClass [
	^ protocolClass
]

{ #category : #'as yet unclassified' }
AmqpConnection >> protocolClass: p [
	protocolClass := p.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> resetChannel: channelNumber [
	channels removeKey: channelNumber ifAbsent: [].
]

{ #category : #'as yet unclassified' }
AmqpConnection >> rpc: requestMethod onChannel: channelNumber [
	| ch |
	ch := self ensureChannel: channelNumber.
	self sendMethod: requestMethod onChannel: channelNumber.
	^ ch waitForReply: requestMethod acceptableResponseClasses
]

{ #category : #'as yet unclassified' }
AmqpConnection >> sendBodyFrameContaining: aByteArray startingAt: pos onChannel: channelNumber [
	| pieceLen |
	pieceLen := aByteArray size min: (parameters frameMax - 8). "Seven bytes of header, plus one byte of footer."
	self sendFrame: (AmqpContentBodyFrame new
						frameType: protocolClass frameBody;
						channelNumber: channelNumber;
						fragment: (aByteArray copyFrom: pos to: pos + pieceLen - 1)).
	^ pos + pieceLen.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> sendFrame: aFrame [
	aFrame encodeOn: codec.
	codec nextOctetPut: self protocolClass frameEnd.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> sendMethod: aMethod onChannel: channelNumber [
	self sendFrame: (AmqpMethodFrame new
						frameType: self protocolClass frameMethod;
						channelNumber: channelNumber;
						methodId: aMethod codecMethodId;
						method: aMethod).
	codec flush.
]

{ #category : #'as yet unclassified' }
AmqpConnection >> sendMethod: aMethod properties: aProperties body: aByteArray onChannel: channelNumber [
	| pos |
	self ensureChannel: channelNumber.
	self sendFrame: (AmqpMethodFrame new
						frameType: protocolClass frameMethod;
						channelNumber: channelNumber;
						methodId: aMethod codecMethodId;
						method: aMethod).
	self sendFrame: (AmqpContentHeaderFrame new
						frameType: protocolClass frameHeader;
						channelNumber: channelNumber;
						classId: aProperties codecClassId;
						bodySize: aByteArray size;
						properties: aProperties).
	pos := 1.
	[pos <= aByteArray size] whileTrue: [
		pos := self sendBodyFrameContaining: aByteArray startingAt: pos onChannel: channelNumber].
	codec flush.
]

{ #category : #accessing }
AmqpConnection >> setChannel: n to: aChannelHandler [
	channels at: n put: aChannelHandler.
]

{ #category : #accessing }
AmqpConnection >> socket [
	^ socket
]

{ #category : #accessing }
AmqpConnection >> socket: anObject [
	socket := anObject
]

{ #category : #accessing }
AmqpConnection >> virtualHost [
	^ virtualHost
]

{ #category : #accessing }
AmqpConnection >> virtualHost: anObject [
	virtualHost := anObject
]

{ #category : #'as yet unclassified' }
AmqpConnection >> waitForEvent [
	self ensureOpen.
	codec stream peek.
	^ self processAsyncEvents
]
