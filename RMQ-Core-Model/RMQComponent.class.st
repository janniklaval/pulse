Class {
	#name : #RMQComponent,
	#superclass : #MooseEntity,
	#instVars : [
		'guid',
		'adress',
		'rmqState',
		'symbolicName',
		'componentType',
		'owner',
		'author',
		'senderMessages',
		'subscribedChannels',
		'consumerTag',
		'exclusive',
		'platform',
		'version',
		'deploymentMode',
		'ackRequired',
		'deletionDate',
		'creationDate',
		'tenantId',
		'exchanges'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQComponent >> ackRequired [
	<MSEProperty: #ackRequired type: #Boolean>
	^ ackRequired
]

{ #category : #accessing }
RMQComponent >> ackRequired: anObject [
	ackRequired := anObject
]

{ #category : #accessing }
RMQComponent >> adress [
	<MSEProperty: #adress type: #String>
	^ adress
]

{ #category : #accessing }
RMQComponent >> adress: anObject [
	adress := anObject
]

{ #category : #accessing }
RMQComponent >> author [
	<MSEProperty: #author type: #String>
	^ author
]

{ #category : #accessing }
RMQComponent >> author: anObject [
	author := anObject
]

{ #category : #accessing }
RMQComponent >> componentType [
	<MSEProperty: #componentType type: #ComponentType opposite: #components>
	^ componentType
]

{ #category : #accessing }
RMQComponent >> componentType: anObject [
	componentType := anObject
]

{ #category : #accessing }
RMQComponent >> consumerTag [
	<MSEProperty: #consumerTag type: #String>
	^ consumerTag
]

{ #category : #accessing }
RMQComponent >> consumerTag: anObject [
	consumerTag := anObject
]

{ #category : #accessing }
RMQComponent >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQComponent >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQComponent >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQComponent >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQComponent >> deploymentMode [
	<MSEProperty: #deploymentMode type: #DeploymentMode opposite:#components>
	^ deploymentMode
]

{ #category : #accessing }
RMQComponent >> deploymentMode: anObject [
	deploymentMode := anObject
]

{ #category : #accessing }
RMQComponent >> exchanges [
	<MSEProperty: #exchanges type: #RMQExchange opposite:#components>
	<multivalued>
	^ exchanges
]

{ #category : #accessing }
RMQComponent >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #accessing }
RMQComponent >> exclusive [
	<MSEProperty: #exclusive type: #Boolean>
	^ exclusive
]

{ #category : #accessing }
RMQComponent >> exclusive: anObject [
	exclusive := anObject
]

{ #category : #accessing }
RMQComponent >> guid [
	<MSEProperty: #guid type: #String>
	^ guid
]

{ #category : #accessing }
RMQComponent >> guid: anObject [
	guid := anObject
]

{ #category : #accessing }
RMQComponent >> initialize [

	super initialize.
	senderMessages := OrderedCollection new.
	subscribedChannels := OrderedCollection new.
	exchanges := OrderedCollection new.
]

{ #category : #printing }
RMQComponent >> name [ 
<MSEProperty: #name type: #String>
^ self symbolicName 
]

{ #category : #accessing }
RMQComponent >> owner [
	<MSEProperty: #owner type: #String>
	^ owner
]

{ #category : #accessing }
RMQComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
RMQComponent >> platform [
	<MSEProperty: #platform type: #String>
	^ platform
]

{ #category : #accessing }
RMQComponent >> platform: anObject [
	platform := anObject
]

{ #category : #accessing }
RMQComponent >> rmqState [
	<MSEProperty: #rmqState type: #String>
	^ rmqState
]

{ #category : #accessing }
RMQComponent >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQComponent >> senderMessages [
	<MSEProperty: #senderMessages type: #RMQMessage opposite:#senderComponent>
	<multivalued>
	^ senderMessages
]

{ #category : #accessing }
RMQComponent >> senderMessages: anObject [
	senderMessages := anObject
]

{ #category : #accessing }
RMQComponent >> subscribedChannels [
	<MSEProperty: #subscribedChannels type: #RMQChannel opposite:#subscribedComponents>
	<multivalued>
	^ subscribedChannels
]

{ #category : #accessing }
RMQComponent >> subscribedChannels: anObject [
	subscribedChannels := anObject
]

{ #category : #accessing }
RMQComponent >> symbolicName [
	<MSEProperty: #symbolicName type: #String>
	^ symbolicName
]

{ #category : #accessing }
RMQComponent >> symbolicName: anObject [
	symbolicName := anObject
]

{ #category : #accessing }
RMQComponent >> tenantId [
<MSEProperty: #tenantId type: #String>
	^ tenantId
]

{ #category : #accessing }
RMQComponent >> tenantId: anObject [
	tenantId := anObject
]

{ #category : #accessing }
RMQComponent >> version [
	<MSEProperty: #version type: #String>
	^ version
]

{ #category : #accessing }
RMQComponent >> version: anObject [
	version := anObject
]
