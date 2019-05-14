Class {
	#name : #RMQConsumerComponent,
	#superclass : #PulseEntity,
	#instVars : [
		'adress',
		'rmqState',
		'componentType',
		'owner',
		'author',
		'platform',
		'version',
		'deploymentMode',
		'appId',
		'consumerProcesses',
		'tenantId',
		'subscribedChannels'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQConsumerComponent >> adress [
	<MSEProperty: #adress type: #String>
	^ adress
]

{ #category : #accessing }
RMQConsumerComponent >> adress: anObject [
	adress := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> appId [
	<MSEProperty: #appId type: #String>
	^ appId
]

{ #category : #accessing }
RMQConsumerComponent >> appId: anObject [
	appId := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> author [
	<MSEProperty: #author type: #String>
	^ author
]

{ #category : #accessing }
RMQConsumerComponent >> author: anObject [
	author := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> componentType [
	<MSEProperty: #componentType type: #ComponentType opposite: #consumerComponents>
	^ componentType
]

{ #category : #accessing }
RMQConsumerComponent >> componentType: anObject [
	componentType := self selectEnum: anObject. 
	componentType components add: self.
]

{ #category : #accessing }
RMQConsumerComponent >> consumerProcesses [
	<MSEProperty: #consumerProcesses type: #RMQConsumerProcess opposite:#consumerComponent> 
	<multivalued>
	^ consumerProcesses
]

{ #category : #accessing }
RMQConsumerComponent >> consumerProcesses: anObject [
	consumerProcesses := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> deploymentMode [
	<MSEProperty: #deploymentMode type: #DeploymentMode opposite:#consumerComponents>
	^ deploymentMode
]

{ #category : #accessing }
RMQConsumerComponent >> deploymentMode: anObject [
	deploymentMode := self selectEnum: anObject. 
	deploymentMode components add: self.
]

{ #category : #accessing }
RMQConsumerComponent >> guid [
	<MSEProperty: #guid type: #String>
	^ self pulseName
]

{ #category : #accessing }
RMQConsumerComponent >> guid: anObject [
	self pulseName: anObject
]

{ #category : #accessing }
RMQConsumerComponent >> initialize [

	super initialize.
	consumerProcesses := Set new. 
	subscribedChannels := Set new. 
]

{ #category : #accessing }
RMQConsumerComponent >> owner [
	<MSEProperty: #owner type: #String>
	^ owner
]

{ #category : #accessing }
RMQConsumerComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> platform [
	<MSEProperty: #platform type: #String>
	^ platform
]

{ #category : #accessing }
RMQConsumerComponent >> platform: anObject [
	platform := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> pulseName [
	<MSEProperty: #pulseName type: #String>
	^ appId
]

{ #category : #accessing }
RMQConsumerComponent >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> rmqState [
	<MSEProperty: #rmqState type: #String>
	^ rmqState
]

{ #category : #accessing }
RMQConsumerComponent >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> subscribedChannels [
	<MSEProperty: #subscribedChannels type: #RMQChannel opposite:#consumerComponent>
	<multivalued>
	^ subscribedChannels
]

{ #category : #accessing }
RMQConsumerComponent >> subscribedChannels: anObject [
	subscribedChannels := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> tenantId [
	<MSEProperty: #tenantId type: #String>
	^ tenantId
]

{ #category : #accessing }
RMQConsumerComponent >> tenantId: anObject [
	tenantId := anObject
]

{ #category : #accessing }
RMQConsumerComponent >> version [
	<MSEProperty: #version type: #String>
	^ version
]

{ #category : #accessing }
RMQConsumerComponent >> version: anObject [
	version := anObject
]
