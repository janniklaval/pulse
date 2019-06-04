"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.permission.deleted  queue must not be empty 
"
Class {
	#name : #PulseEventParserTestPermissionDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseEventParserTestPermissionDeleted >> setUp [
	| newPermission user vhost |
	"todo : go further and create the events queue and bing it to the exchange queue ?"
	model := PulseModel new.
	model name: 'test'.
	parser := PulseEventParser newOn: 'test'.
	consumer := PulseConsumer new.
	consumer model: model.
	consumer parser: parser.

	"create the elements in the model"
	newPermission := RMQPermission new.
	"add the user to the model if it doest not exist"
	user := model
		selectOrAddEntityNamed: 'testuser'
		withType: RMQUser
		sourceName: self sourceName.
	newPermission user: user.
	user permissions add: newPermission.

	"add the vhost to the model if it doest not exist"
	vhost := model
		selectOrAddEntityNamed: '/'
		withType: RMQVHost
		sourceName: self sourceName.
	newPermission vhost: vhost.
	vhost permissions add: newPermission.
	model add: newPermission.

	"consume from the events queues"
	consumer
		consumeQueue: 'events.permission.deleted';
		start.
	1 seconds wait.
	consumer stop
]

{ #category : #tests }
PulseEventParserTestPermissionDeleted >> testModelPopulation [

	self assert: (model allPulsePermissions anySatisfy: [ :el | el vhost pulseName = '/' and:[ el deletionDate isNotNil and: [ el user pulseName = 'testuser' ] ] ] ).
]