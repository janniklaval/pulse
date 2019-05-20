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

	| sys action authMec var |
	sys := self model system.
	action := ORActionAddPulseAuthMechanism new
	orionModel: orionModel;
	pulseName: 'Auth1';
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddComponentType [

	| sys action component |
	sys := self model system.
	action := ORActionAddPulseComponentType new
	orionModel: orionModel;
	pulseName: 'Comp1';
	postRun.
	self assert: (orionModel entityNamed: 'Comp1') isNil.
	self assert: orionModel changes size equals: 1.
	
	action run.
	component := orionModel entityNamed: 'Comp1'.
	self assert: component notNil.
	self assert: (orionModel contains: component).
	self assert: (orionModel contains: component).
	self deny: (sys sourceModel contains: component).
	self assert: (orionModel includes: component).
	self deny: (sys sourceModel includes: component).
	self assert: component pulseName equals: 'Comp1'.
	self assert: component rmqState equals: 'Comp1'.
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddEncoding [

	| sys action encoding |
	sys := self model system.
	action := ORActionAddPulseEncoding new
	orionModel: orionModel;
	pulseName: 'encoding1';
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddExchangeType [

	| sys action exchangeType |
	sys := self model system.
	action := ORActionAddPulseExchangeType new
	orionModel: orionModel;
	pulseName: 'exchangeType1';
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddGuaranteeMode [

	| sys action guaranteeMode |
	sys := self model system.
	action := ORActionAddPulseGuaranteeMode new
	orionModel: orionModel;
	pulseName: 'guaranteeMode1';
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]

{ #category : #testing }
ORPulseActionTest >> testORAddRMQAuthentification [

	| sys action rmqAuth |
	sys := self model system.
	action := ORActionAddPulseRMQAuthentification new
	orionModel: orionModel;
	pulseName: 'RMQAuth1';
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
	self assert: orionModel size equals: sys sourceModel size + 1
	
]
