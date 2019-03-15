Class {
	#name : #RMQPublisherComponent,
	#superclass : #PulseEntity,
	#instVars : [
		'adress',
		'rmqState',
		'componentType',
		'owner',
		'author',
		'subscribedChannels',
		'platform',
		'version',
		'deploymentMode',
		'exchanges',
		'tenantId',
		'appId',
		'messagesFromPublisher',
		'usedChannels',
		'usedChannel'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQPublisherComponent >> adress [
	<MSEProperty: #adress type: #String>
	^ adress
]

{ #category : #accessing }
RMQPublisherComponent >> adress: anObject [
	adress := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> appId [
	<MSEProperty: #appId type: #String>
	^ appId
]

{ #category : #accessing }
RMQPublisherComponent >> appId: anObject [
	appId := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> author [
	<MSEProperty: #author type: #String>
	^ author
]

{ #category : #accessing }
RMQPublisherComponent >> author: anObject [
	author := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> componentType [
	<MSEProperty: #componentType type: #ComponentType opposite: #components>
	^ componentType
]

{ #category : #accessing }
RMQPublisherComponent >> componentType: anObject [
	componentType := self selectEnum: anObject. 
	componentType components add: self.
]

{ #category : #accessing }
RMQPublisherComponent >> deploymentMode [
	<MSEProperty: #deploymentMode type: #DeploymentMode opposite:#publisherComponents>
	^ deploymentMode
]

{ #category : #accessing }
RMQPublisherComponent >> deploymentMode: anObject [
	deploymentMode := self selectEnum: anObject. 
	deploymentMode components add: self.
]

{ #category : #accessing }
RMQPublisherComponent >> exchanges [
	<MSEProperty: #exchanges type: #RMQExchange opposite:#publisherComponents>
	<multivalued>
	^ exchanges
]

{ #category : #accessing }
RMQPublisherComponent >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> guid [
	<MSEProperty: #guid type: #String>
	^ self pulseName
]

{ #category : #accessing }
RMQPublisherComponent >> guid: anObject [
	self pulseName: anObject
]

{ #category : #accessing }
RMQPublisherComponent >> initialize [

	super initialize.
	messagesFromPublisher := Set new.
	usedChannels := Set new.
	exchanges := Set new.
]

{ #category : #accessing }
RMQPublisherComponent >> messagesFromPublisher [
	<MSEProperty: #messagesFromPublisher type: #RMQMessage opposite:#publisherComponent>
	<multivalued>
	^ messagesFromPublisher
]

{ #category : #accessing }
RMQPublisherComponent >> messagesFromPublisher: anObject [
	messagesFromPublisher := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> owner [
	<MSEProperty: #owner type: #String>
	^ owner
]

{ #category : #accessing }
RMQPublisherComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> platform [
	<MSEProperty: #platform type: #String>
	^ platform
]

{ #category : #accessing }
RMQPublisherComponent >> platform: anObject [
	platform := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> pulseName [
	<MSEProperty: #pulseName type: #String>
	^ appId
]

{ #category : #accessing }
RMQPublisherComponent >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> rmqState [
	<MSEProperty: #rmqState type: #String>
	^ rmqState
]

{ #category : #accessing }
RMQPublisherComponent >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> tenantId [
	<MSEProperty: #tenantId type: #String>
	^ tenantId
]

{ #category : #accessing }
RMQPublisherComponent >> tenantId: anObject [
	tenantId := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> usedChannels [
	<MSEProperty: #usedChannels type: #RMQChannel opposite:#publisherComponent>
	<multivalued>
	^ usedChannels
]

{ #category : #accessing }
RMQPublisherComponent >> usedChannels: anObject [
	usedChannels := anObject
]

{ #category : #accessing }
RMQPublisherComponent >> version [
	<MSEProperty: #version type: #String>
	^ version
]

{ #category : #accessing }
RMQPublisherComponent >> version: anObject [
	version := anObject
]
