Class {
	#name : #ORPulseActionTest,
	#superclass : #ORPulseTest,
	#instVars : [
		'orionModel'
	],
	#category : #OrionPulseTests
}

{ #category : #'testing OrionModel' }
ORPulseActionTest >> setUp [
	orionModel := (ORModel withParent: self model) name: #orionModel.
]

{ #category : #testing }
ORPulseActionTest >> testORAddAuthMechanism [

	| sys action authMec |
	sys := self model system.
	
	action := ORActionAddPulseAuthMechanism new
	orionModel: orionModel;
	pulseName: 'Auth1';
	rmqState: 'Auth1';
	connections: (orionModel entityNamed: '172.17.0.1:35008 -> 172.17.0.2:5672') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'Auth1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	authMec := orionModel entityNamed: 'Auth1'.
	
	self assert: authMec notNil.
	self assert: (orionModel contains: authMec).
	self assert: (orionModel contains: authMec).
	self deny: (sys sourceModel contains: authMec).
	self assert: (orionModel includes: authMec).
	self deny: (sys sourceModel includes: authMec).
	
	self assert: authMec pulseName equals: 'Auth1'.
	self assert: authMec rmqState equals: 'Auth1'.
	self assert: (authMec connections at: 1) equals: (orionModel entityNamed: '172.17.0.1:35008 -> 172.17.0.2:5672').
	
	self assert: orionModel size equals: sys sourceModel size + 1
]

{ #category : #testing }
ORPulseActionTest >> testORAddComponentType [

	| sys action compoType |
	sys := self model system.
	
	action := ORActionAddPulseComponentType new
	orionModel: orionModel;
	pulseName: 'Comp1';
	postRun.
	
	self assert: (orionModel entityNamed: 'Comp1') isNil.
	self assert: orionModel changes size equals: 1.

	action run.
	compoType := orionModel entityNamed: 'Comp1'.
	
	self assert: compoType notNil.
	self assert: (orionModel contains: compoType).
	self assert: (orionModel contains: compoType).
	self deny: (sys sourceModel contains: compoType).
	self assert: (orionModel includes: compoType).
	self deny: (sys sourceModel includes: compoType).
	
	self assert: compoType pulseName equals: 'Comp1'.
	self assert: compoType rmqState equals: 'Comp1'.
	
	self assert: orionModel size equals: sys sourceModel size + 1
]

{ #category : #testing }
ORPulseActionTest >> testORAddDeliveryMode [

	| sys action delMode |
	sys := self model system.
	
	action := ORActionAddPulseDeliveryMode new
	orionModel: orionModel;
	pulseName: 'delMode1';
	postRun.
	
	self assert: (orionModel entityNamed: 'delMode1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	delMode := orionModel entityNamed: 'delMode1'.
	
	self assert: delMode notNil.
	self assert: (orionModel contains: delMode).
	self assert: (orionModel contains: delMode).
	self deny: (sys sourceModel contains: delMode).
	self assert: (orionModel includes: delMode).
	self deny: (sys sourceModel includes: delMode).
	
	self assert: delMode pulseName equals: 'delMode1'.
	self assert: delMode rmqState equals: 'delMode1'.
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddDurability [

	| sys action durability |
	sys := self model system.
	
	action := ORActionAddPulseDurability new
	orionModel: orionModel;
	pulseName: 'durability1';
	exchanges: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish') asOrderedCollection;
	queues: (orionModel entityNamed: 'none') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'durability1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	durability := orionModel entityNamed: 'durability1'.
	
	self assert: durability notNil.
	self assert: (orionModel contains: durability).
	self assert: (orionModel contains: durability).
	self deny: (sys sourceModel contains: durability).
	self assert: (orionModel includes: durability).
	self deny: (sys sourceModel includes: durability).
	
	self assert: durability pulseName equals: 'durability1'.
	self assert: durability rmqState equals: 'durability1'.
	self assert: (durability exchanges at: 1) equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	self assert: (durability queues at: 1) equals: (orionModel entityNamed: 'none').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddEncoding [

	| sys action encoding |
	sys := self model system.
	
	action := ORActionAddPulseEncoding new
	orionModel: orionModel;
	pulseName: 'encoding1';
	payloads: (orionModel entityNamed: 'AEg2ZTcwYzIzZS05OGJlLTRiOTItOGRkMy1iZjYxMjQ4ZTkwMWUAMDIwMTgtMDYtMDhUMTI6MzI6MjQuMzc3Wg4cbmF3ZWwuYW1va3JhbmUAAhBBbW9rcmFuZQpOYXdlbBxtYWlsQGdtYWlsLmNvbQAAAAISMDIxMjkxNjIyAAAwMjAxOC0wNi0wOFQxMjozMjoyMi4zMzFaAQACAA==') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'encoding1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	encoding := orionModel entityNamed: 'encoding1'.
	
	self assert: encoding notNil.
	self assert: (orionModel contains: encoding).
	self assert: (orionModel contains: encoding).
	self deny: (sys sourceModel contains: encoding).
	self assert: (orionModel includes: encoding).
	self deny: (sys sourceModel includes: encoding).
	
	self assert: encoding pulseName equals: 'encoding1'.
	self assert: encoding rmqState equals: 'encoding1'.
	self assert: (encoding payloads at: 1) equals: (orionModel entityNamed: 'AEg2ZTcwYzIzZS05OGJlLTRiOTItOGRkMy1iZjYxMjQ4ZTkwMWUAMDIwMTgtMDYtMDhUMTI6MzI6MjQuMzc3Wg4cbmF3ZWwuYW1va3JhbmUAAhBBbW9rcmFuZQpOYXdlbBxtYWlsQGdtYWlsLmNvbQAAAAISMDIxMjkxNjIyAAAwMjAxOC0wNi0wOFQxMjozMjoyMi4zMzFaAQACAA==').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddExchangeType [

	| sys action exchangeType |
	sys := self model system.
	
	action := ORActionAddPulseExchangeType new
	orionModel: orionModel;
	pulseName: 'exchangeType1';
	exchanges: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'exchangeType1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	exchangeType := orionModel entityNamed: 'exchangeType1'.
	
	self assert: exchangeType notNil.
	self assert: (orionModel contains: exchangeType).
	self assert: (orionModel contains: exchangeType).
	self deny: (sys sourceModel contains: exchangeType).
	self assert: (orionModel includes: exchangeType).
	self deny: (sys sourceModel includes: exchangeType).
	
	self assert: exchangeType pulseName equals: 'exchangeType1'.
	self assert: exchangeType rmqState equals: 'exchangeType1'.
	self assert: (exchangeType exchanges at: 1) equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddGuaranteeMode [

	| sys action guaranteeMode |
	sys := self model system.
	
	action := ORActionAddPulseGuaranteeMode new
	orionModel: orionModel;
	pulseName: 'guaranteeMode1';
	channels: (orionModel entityNamed: '10') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'guaranteeMode1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	guaranteeMode := orionModel entityNamed: 'guaranteeMode1'.
	
	self assert: guaranteeMode notNil.
	self assert: (orionModel contains: guaranteeMode).
	self assert: (orionModel contains: guaranteeMode).
	self deny: (sys sourceModel contains: guaranteeMode).
	self assert: (orionModel includes: guaranteeMode).
	self deny: (sys sourceModel includes: guaranteeMode).
	
	self assert: guaranteeMode pulseName equals: 'guaranteeMode1'.
	self assert: guaranteeMode rmqState equals: 'guaranteeMode1'.
	self assert: (guaranteeMode channels at: 1) equals: (orionModel entityNamed: '10').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddMessageType [

	| sys action messageType |
	sys := self model system.
	
	action := ORActionAddPulseMessageType new
	orionModel: orionModel;
	pulseName: 'messageType1';
	postRun.
	
	self assert: (orionModel entityNamed: 'messageType1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	messageType := orionModel entityNamed: 'messageType1'.
	
	self assert: messageType notNil.
	self assert: (orionModel contains: messageType).
	self assert: (orionModel contains: messageType).
	self deny: (sys sourceModel contains: messageType).
	self assert: (orionModel includes: messageType).
	self deny: (sys sourceModel includes: messageType).
	
	self assert: messageType pulseName equals: 'messageType1'.
	self assert: messageType rmqState equals: 'messageType1'.
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddNodeType [

	| sys action nodeType |
	sys := self model system.
	
	action := ORActionAddPulseNodeType new
	orionModel: orionModel;
	pulseName: 'nodeType1';
	nodes: (orionModel entityNamed: 'rabbit@cf39ec4fb77b') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'nodeType1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	nodeType := orionModel entityNamed: 'nodeType1'.
	
	self assert: nodeType notNil.
	self assert: (orionModel contains: nodeType).
	self assert: (orionModel contains: nodeType).
	self deny: (sys sourceModel contains: nodeType).
	self assert: (orionModel includes: nodeType).
	self deny: (sys sourceModel includes: nodeType).
	
	self assert: nodeType pulseName equals: 'nodeType1'.
	self assert: nodeType rmqState equals: 'nodeType1'.
	self assert: (nodeType nodes at: 1) equals: (orionModel entityNamed: 'rabbit@cf39ec4fb77b').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQAuthentification [

	| sys action rmqAuth |
	sys := self model system.
	
	action := ORActionAddPulseRMQAuthentification new
	orionModel: orionModel;
	pulseName: 'RMQAuth1';
	failureError: '403';
	success: 'true';
	timestamp: '00-00-00';
	user: (orionModel entityNamed: 'guest');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQAuth1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqAuth := orionModel entityNamed: 'RMQAuth1'.
	
	self assert: rmqAuth notNil.
	self assert: (orionModel contains: rmqAuth).
	self assert: (orionModel contains: rmqAuth).
	self deny: (sys sourceModel contains: rmqAuth).
	self assert: (orionModel includes: rmqAuth).
	self deny: (sys sourceModel includes: rmqAuth).
	
	self assert: rmqAuth pulseName equals: 'RMQAuth1'.
	self assert: rmqAuth failureError equals: '403'.
	self assert: rmqAuth success equals: 'true'.
	self assert: rmqAuth timestamp equals: '00-00-00'.
	self assert: rmqAuth user equals: (orionModel entityNamed: 'guest').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQBindingWithExchange [

	| sys action rmqBind |
	sys := self model system.
	
	action := ORActionAddPulseRMQBindingWithExchange new
	orionModel: orionModel;
	pulseName: 'RMQBind1';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	source: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish');
	destination: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish');
	routingKey: (orionModel entityNamed: 'message') asOrderedCollection;
	vhost: (orionModel entityNamed: '/');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQBind1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqBind := orionModel entityNamed: 'RMQBind1'.
	
	self assert: rmqBind notNil.
	self assert: (orionModel contains: rmqBind).
	self deny: (sys sourceModel contains: rmqBind).
	self assert: (orionModel includes: rmqBind).
	self deny: (sys sourceModel includes: rmqBind).
	
	self assert: rmqBind pulseName equals: 'RMQBind1'.
	self assert: rmqBind creationDate equals: '00-00-01'.
	self assert: rmqBind deletionDate equals: '00-00-02'.
	self assert: rmqBind source equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish').
	self assert: rmqBind destination equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	self assert: (rmqBind routingKey at: 1) equals: (orionModel entityNamed: 'message').
	self assert: rmqBind vhost equals: (orionModel entityNamed: '/').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQBindingWithQueue [

	| sys action rmqBindQ |
	sys := self model system.
	
	action := ORActionAddPulseRMQBindingWithQueue new
	orionModel: orionModel;
	pulseName: 'RMQBindQ1';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	source: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish');
	destination: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.bl-socle.subscribe');
	routingKey: (orionModel entityNamed: 'message') asOrderedCollection;
	vhost: (orionModel entityNamed: '/');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQBindQ1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqBindQ := orionModel entityNamed: 'RMQBindQ1'.
	
	self assert: rmqBindQ notNil.
	self assert: (orionModel contains: rmqBindQ).
	self deny: (sys sourceModel contains: rmqBindQ).
	self assert: (orionModel includes: rmqBindQ).
	self deny: (sys sourceModel includes: rmqBindQ).
	
	self assert: rmqBindQ pulseName equals: 'RMQBindQ1'.
	self assert: rmqBindQ creationDate equals: '00-00-01'.
	self assert: rmqBindQ deletionDate equals: '00-00-02'.
	self assert: rmqBindQ source equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish').
	self assert: rmqBindQ destination equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.bl-socle.subscribe').
	self assert: (rmqBindQ routingKey at: 1) equals: (orionModel entityNamed: 'message').
	self assert: rmqBindQ vhost equals: (orionModel entityNamed: '/').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQChannel [

	| sys action rmqChannel |
	sys := self model system.
	
	action := ORActionAddPulseRMQChannel new
	orionModel: orionModel;
	pulseName: 'RMQChannel1';
	creationDate: '00-00-01';
	closingDate: '00-00-02';
	globalPrefetchCount: '10';
	idleSince: '5 min';
	pid: '001';
	prefetchCount: '2';
	connection: (orionModel entityNamed: '172.17.0.1:35008 -> 172.17.0.2:5672');
	consumedQueues: (orionModel entityNamed: 'none') asOrderedCollection;
	user: (orionModel entityNamed: 'guest');
	user_who_performed_connection: (orionModel entityNamed: 'guest');
	vhost: (orionModel entityNamed: '/');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQChannel1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqChannel := orionModel entityNamed: 'RMQChannel1'.
	
	self assert: rmqChannel notNil.
	self assert: (orionModel contains: rmqChannel).
	self deny: (sys sourceModel contains: rmqChannel).
	self assert: (orionModel includes: rmqChannel).
	self deny: (sys sourceModel includes: rmqChannel).
	
	self assert: rmqChannel pulseName equals: 'RMQChannel1'.
	self assert: rmqChannel creationDate equals: '00-00-01'.
	self assert: rmqChannel closingDate equals: '00-00-02'.
	self assert: rmqChannel globalPrefetchCount equals: '10'.
	self assert: rmqChannel idleSince equals: '5 min'.
	self assert: rmqChannel pid equals: '001'.
	self assert: rmqChannel prefetchCount equals: '2'.
	self assert: rmqChannel connection equals: (orionModel entityNamed: '172.17.0.1:35008 -> 172.17.0.2:5672').
	self assert: (rmqChannel consumedQueues at: 1) equals: (orionModel entityNamed: 'none').
	self assert: rmqChannel user equals: (orionModel entityNamed: 'guest').
	self assert: rmqChannel user_who_performed_connection equals: (orionModel entityNamed: 'guest').
	self assert: rmqChannel vhost equals: (orionModel entityNamed: '/').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQCluster [

	| sys action rmqCluster |
	sys := self model system.
	
	action := ORActionAddPulseRMQCluster new
	orionModel: orionModel;
	pulseName: 'RMQCluster1';
	nodes: (orionModel entityNamed: 'rabbit@cf39ec4fb77b') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQChannel1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqCluster := orionModel entityNamed: 'RMQCluster1'.
	
	self assert: rmqCluster notNil.
	self assert: (orionModel contains: rmqCluster).
	self deny: (sys sourceModel contains: rmqCluster).
	self assert: (orionModel includes: rmqCluster).
	self deny: (sys sourceModel includes: rmqCluster).
	
	self assert: rmqCluster pulseName equals: 'RMQCluster1'.
	self assert: (rmqCluster nodes at: 1) equals: (orionModel entityNamed: 'rabbit@cf39ec4fb77b').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQComponent [

	| sys action rmqComponent |
	sys := self model system.
	
	action := ORActionAddPulseRMQComponent new
	orionModel: orionModel;
	pulseName: 'RMQComponent1';
	guid: 'RMQComponent1';
	ackRequired: 'false';
	adress: '0.0.0.0';
	author: 'firas';
	consumerTag: 'RMQComponent1';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	exclusive: 'true';
	owner: 'firas';
	platform: 'rmq';
	rmqState: 'state1';
	version: '0.1';
	exchanges: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish') asOrderedCollection;
	subscribedChannels: (orionModel entityNamed: '10') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQComponent1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqComponent := orionModel entityNamed: 'RMQComponent1'.
	
	self assert: rmqComponent notNil.
	self assert: (orionModel contains: rmqComponent).
	self deny: (sys sourceModel contains: rmqComponent).
	self assert: (orionModel includes: rmqComponent).
	self deny: (sys sourceModel includes: rmqComponent).
	
	self assert: rmqComponent pulseName equals: 'RMQComponent1'.
	self assert: rmqComponent guid equals: 'RMQComponent1'.
	self assert: rmqComponent ackRequired equals: 'false'.
	self assert: rmqComponent adress equals: '0.0.0.0'.
	self assert: rmqComponent author equals: 'firas'.
	self assert: rmqComponent consumerTag equals: 'RMQComponent1'.
	self assert: rmqComponent creationDate equals: '00-00-01'.
	self assert: rmqComponent deletionDate equals: '00-00-02'.
	self assert: rmqComponent exclusive equals: 'true'.
	self assert: rmqComponent owner equals: 'firas'.
	self assert: rmqComponent platform equals: 'rmq'.
	self assert: rmqComponent rmqState equals: 'state1'.
	self assert: rmqComponent version equals: '0.1'.
	self assert: (rmqComponent exchanges at: 1) equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	self assert: (rmqComponent subscribedChannels at: 1) equals: (orionModel entityNamed: '10').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQConnection [

	| sys action rmqConnection |
	sys := self model system.
	
	action := ORActionAddPulseRMQConnection new
	orionModel: orionModel;
	pulseName: 'RMQConnection1';
	closingDate: '00-00-02';
	connectedAt: 'exmpl';
	connectionType: 'stateless';
	creationDate: '00-00-01';
	host: 'hst';
	peerHost: 'pHst';
	peerPort: '8080';
	pid: '100';
	port: '3000';
	protocol: 'amqp';
	ssl: 'true';
	sslHash: '#hash';
	sslProtocol: 'TLS';
	channels: (orionModel entityNamed: '10') asOrderedCollection;
	user: (orionModel entityNamed: 'guest');
	user_who_performed_connection: (orionModel entityNamed: 'guest');
	vhost: (orionModel entityNamed: 'my_vhost');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQComponent1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqConnection := orionModel entityNamed: 'RMQConnection1'.
	
	self assert: rmqConnection notNil.
	self assert: (orionModel contains: rmqConnection).
	self deny: (sys sourceModel contains: rmqConnection).
	self assert: (orionModel includes: rmqConnection).
	self deny: (sys sourceModel includes: rmqConnection).
	
	self assert: rmqConnection pulseName equals: 'RMQConnection1'.
	self assert: rmqConnection closingDate equals: '00-00-02'.
	self assert: rmqConnection connectedAt equals: 'exmpl'.
	self assert: rmqConnection connectionType equals: 'stateless'.
	self assert: rmqConnection creationDate equals: '00-00-01'.
	self assert: rmqConnection host equals: 'hst'.
	self assert: rmqConnection peerHost equals: 'pHst'.
	self assert: rmqConnection peerPort equals: '8080'.
	self assert: rmqConnection pid equals: '100'.
	self assert: rmqConnection port equals: '3000'.
	self assert: rmqConnection protocol equals: 'amqp'.
	self assert: rmqConnection ssl equals: 'true'.
	self assert: rmqConnection sslHash equals: '#hash'.
	self assert: rmqConnection sslProtocol equals: 'TLS'.
	self assert: (rmqConnection channels at: 1) equals: (orionModel entityNamed: '10').
	self assert: rmqConnection user equals: (orionModel entityNamed: 'guest').
	self assert: rmqConnection user_who_performed_connection equals: (orionModel entityNamed: 'guest').
	self assert: rmqConnection vhost equals: (orionModel entityNamed: 'my_vhost').

	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQExchange [

	| sys action rmqExchange |
	sys := self model system.
	
	action := ORActionAddPulseRMQExchange new
	orionModel: orionModel;
	pulseName: 'RMQExchange1';
	autoDelete: 'false';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	internal: 'true';
	alternate_exchange_for: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish') asOrderedCollection;
	my_alternate_exchange: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasClientContract.publish');
	queues_for_dead_letter: (orionModel entityNamed: 'none') asOrderedCollection;
	sourceBindings: 
		(orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish>pubsub.consoleTenant.consoleSaasUserAccess.logger.subscribe') asOrderedCollection;
	user_who_performed_action: (orionModel entityNamed: 'guest');
	vhost: (orionModel entityNamed: '/');
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQExchange1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqExchange := orionModel entityNamed: 'RMQExchange1'.
	
	self assert: rmqExchange notNil.
	self assert: (orionModel contains: rmqExchange).
	self deny: (sys sourceModel contains: rmqExchange).
	self assert: (orionModel includes: rmqExchange).
	self deny: (sys sourceModel includes: rmqExchange).
	
	self assert: rmqExchange pulseName equals: 'RMQExchange1'.
	self assert: rmqExchange autoDelete equals: 'false'.
	self assert: rmqExchange creationDate equals: '00-00-01'.
	self assert: rmqExchange deletionDate equals: '00-00-02'.
	self assert: rmqExchange internal equals: 'true'.
	self assert: (rmqExchange alternate_exchange_for at: 1) equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	self assert: rmqExchange my_alternate_exchange equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasClientContract.publish').
	self assert: (rmqExchange queues_for_dead_letter at: 1) equals: (orionModel entityNamed: 'none').
	self assert: (rmqExchange sourceBindings at: 1) equals: 
		(orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasUserAccess.publish>pubsub.consoleTenant.consoleSaasUserAccess.logger.subscribe').
	self assert: rmqExchange user_who_performed_action equals: (orionModel entityNamed: 'guest').
	self assert: rmqExchange vhost equals: (orionModel entityNamed: '/').	

	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQExchangeFormat [

	| sys action rmqExchangeFormat |
	sys := self model system.
	
	action := ORActionAddPulseRMQExchangeFormat new
	orionModel: orionModel;
	pulseName: 'RMQExchangeFormat1';
	exchangeFormatSchema: 'schema1';
	exchangeFormatType: 'type1';
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQExchangeFormat1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqExchangeFormat := orionModel entityNamed: 'RMQExchangeFormat1'.
	
	self assert: rmqExchangeFormat notNil.
	self assert: (orionModel contains: rmqExchangeFormat).
	self deny: (sys sourceModel contains: rmqExchangeFormat).
	self assert: (orionModel includes: rmqExchangeFormat).
	self deny: (sys sourceModel includes: rmqExchangeFormat).
	
	self assert: rmqExchangeFormat pulseName equals: 'RMQExchangeFormat1'.
	self assert: rmqExchangeFormat exchangeFormatSchema equals: 'schema1'.
	self assert: rmqExchangeFormat exchangeFormatType equals: 'type1'.

	self assert: orionModel size equals: sys sourceModel size + 1
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQMessage [

	| sys action rmqMessage |
	sys := self model system.
	
	action := ORActionAddPulseRMQMessage new
	orionModel: orionModel;
	pulseName: 'RMQMessage1';
	encrypted: 'false';
	messageID: 'RMQMessage1';
	priority: '1';
	redelivered: 'true';
	timestamp: '00-10-10:01';
	deliveryMode: (orionModel entityNamed: 'persistent');
	exchange: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish');
	messageType: (orionModel entityNamed: 'published');
	payload: (orionModel entityNamed: 'AEg2ZTcwYzIzZS05OGJlLTRiOTItOGRkMy1iZjYxMjQ4ZTkwMWUAMDIwMTgtMDYtMDhUMTI6MzI6...rcmFuZQpOYXdlbBxtYWlsQGdtYWlsLmNvbQAAAAISMDIxMjkxNjIyAAAwMjAxOC0wNi0wOFQxMjozMjoyMi4zMzFaAQACAA==');
	queue: (orionModel entityNamed: 'none');
	routedQueues: (orionModel entityNamed: 'none') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQMessage1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqMessage := orionModel entityNamed: 'RMQMessage1'.
	
	self assert: rmqMessage notNil.
	self assert: (orionModel contains: rmqMessage).
	self deny: (sys sourceModel contains: rmqMessage).
	self assert: (orionModel includes: rmqMessage).
	self deny: (sys sourceModel includes: rmqMessage).
	
	self assert: rmqMessage pulseName equals: 'RMQMessage1'.
	self assert: rmqMessage encrypted equals: 'false'.
	self assert: rmqMessage messageID equals: 'RMQMessage1'.
	self assert: rmqMessage priority equals: '1'.
	self assert: rmqMessage redelivered equals: 'true'.
	self assert: rmqMessage timestamp equals: '00-10-10:01'.
	self assert: rmqMessage deliveryMode equals: (orionModel entityNamed: 'persistent').
	self assert: rmqMessage exchange equals: (orionModel entityNamed: 'pubsub.consoleTenant.consoleSaasApplicationRole.publish').
	self assert: rmqMessage messageType equals: (orionModel entityNamed: 'published').
	self assert: rmqMessage payload equals: (orionModel entityNamed: 'AEg2ZTcwYzIzZS05OGJlLTRiOTItOGRkMy1iZjYxMjQ4ZTkwMWUAMDIwMTgtMDYtMDhUMTI6MzI6...rcmFuZQpOYXdlbBxtYWlsQGdtYWlsLmNvbQAAAAISMDIxMjkxNjIyAAAwMjAxOC0wNi0wOFQxMjozMjoyMi4zMzFaAQACAA==').
	self assert: rmqMessage queue equals: (orionModel entityNamed: 'none').
	self assert: (rmqMessage routedQueues at: 1) equals: (orionModel entityNamed: 'none').

	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQNode [

	| sys action rmqNode |
	sys := self model system.
	
	action := ORActionAddPulseRMQNode new
	orionModel: orionModel;
	pulseName: 'RMQNode1';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	host: '0.0.0.0';
	port: '8080';
	running: 'true';
	vhosts: (orionModel entityNamed: '/') asOrderedCollection;
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQNode1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqNode := orionModel entityNamed: 'RMQNode1'.
	
	self assert: rmqNode notNil.
	self assert: (orionModel contains: rmqNode).
	self deny: (sys sourceModel contains: rmqNode).
	self assert: (orionModel includes: rmqNode).
	self deny: (sys sourceModel includes: rmqNode).
	
	self assert: rmqNode pulseName equals: 'RMQNode1'.
	self assert: rmqNode creationDate equals: '00-00-01'.
	self assert: rmqNode deletionDate equals: '00-00-02'.
	self assert: rmqNode host equals: '0.0.0.0'.
	self assert: rmqNode port equals: '8080'.
	self assert: rmqNode running equals: 'true'.
	self assert: (rmqNode vhosts at: 1) equals: (orionModel entityNamed: '/').

	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQPayload [

	| sys action rmqPayload |
	sys := self model system.
	
	action := ORActionAddPulseRMQPayload new
	orionModel: orionModel;
	pulseName: 'RMQPayload1';
	size_byte: '16';
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQPayload1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqPayload := orionModel entityNamed: 'RMQPayload1'.
	
	self assert: rmqPayload notNil.
	self assert: (orionModel contains: rmqPayload).
	self deny: (sys sourceModel contains: rmqPayload).
	self assert: (orionModel includes: rmqPayload).
	self deny: (sys sourceModel includes: rmqPayload).
	
	self assert: rmqPayload pulseName equals: 'RMQPayload1'.
	self assert: rmqPayload size_byte equals: '16'.

	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQPermission [

	| sys action rmqPermission |
	sys := self model system.
	
	action := ORActionAddPulseRMQPermission new
	orionModel: orionModel;
	pulseName: 'RMQPermission1';
	"configureValue: '655';
	creationDate: '00-00-01';
	deletionDate: '00-00-02';
	readValue: '6';
	writeValue: '5';
	user: (orionModel entityNamed: 'guest');
	vhost: (orionModel entityNamed: '/');"
	postRun.
	
	self assert: (orionModel entityNamed: 'RMQPermission1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	rmqPermission := orionModel entityNamed: 'RMQPermission1'.
	
	self assert: rmqPermission notNil.
	self assert: (orionModel contains: rmqPermission).
	self deny: (sys sourceModel contains: rmqPermission).
	self assert: (orionModel includes: rmqPermission).
	self deny: (sys sourceModel includes: rmqPermission).
	
	self assert: rmqPermission pulseName equals: 'RMQPermission1'.
	self assert: rmqPermission configureValue equals: '655'.
	self assert: rmqPermission creationDate equals: '00-00-01'.
	self assert: rmqPermission deletionDate equals: '00-00-02'.
	self assert: rmqPermission name equals: 
		rmqPermission vhost mooseName, '.'
		, rmqPermission user mooseName, '>'
		, rmqPermission configureValue mooseName, '_'
		, rmqPermission writeValue mooseName, '_'
		, rmqPermission readValue mooseName.
	self assert: rmqPermission readValue equals: '6'.
	self assert: rmqPermission writeValue equals: '5'.
	self assert: rmqPermission user equals: (orionModel entityNamed: 'guest').
	self assert: rmqPermission vhost equals: (orionModel entityNamed: '/').
	
	self assert: orionModel size equals: sys sourceModel size + 1
	
]
