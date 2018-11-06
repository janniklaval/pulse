Class {
	#name : #RMQRESTParserTest,
	#superclass : #TestCase,
	#instVars : [
		'objects',
		'model'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #accessing }
RMQRESTParserTest >> data [
	^ '{"rabbit_version":"3.7.8","users":[{"name":"guest","password_hash":"RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"}],"vhosts":[{"name":"/"}],"permissions":[{"user":"guest","vhost":"/","configure":".*","write":".*","read":".*"}],"topic_permissions":[],"parameters":[],"global_parameters":[{"name":"cluster_name","value":"rabbit@a12b253c30bd"}],"policies":[],"queues":[{"name":"testQueue","vhost":"/","durable":true,"auto_delete":false,"arguments":{}}],"exchanges":[{"name":"testExchange","vhost":"/","type":"direct","durable":true,"auto_delete":false,"internal":false,"arguments":{}}],"bindings":[{"source":"testExchange","vhost":"/","destination":"testQueue","destination_type":"queue","routing_key":"testRoutingKey","arguments":{}}]}'.
]

{ #category : #initialization }
RMQRESTParserTest >> setUp [

	| parser |
	parser := PPParserResource current parserAt: PPJsonParser.
	objects := parser parse: self data.
	
	model := MooseModel new.
	model name: 'test'.
]

{ #category : #initialization }
RMQRESTParserTest >> testPopulateExistingUser [

	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 1.
	self assert: model allRMQUsers first name = 'guest'.
	self assert: model allRMQUsers first passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: model allRMQUsers first hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 1.
	self assert: model allRMQRoles first name = 'administrator'.
	
	self assert: model allRMQUsers first roles size = 1.
	self assert: model allRMQRoles first users size = 1.
	self assert: model allRMQUsers first roles first = model allRMQRoles first. 
	self assert: model allRMQRoles first users first = model allRMQUsers first.
	
	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 1.
	self assert: model allRMQUsers first name = 'guest'.
	self assert: model allRMQUsers first passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: model allRMQUsers first hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 1.
	self assert: model allRMQRoles first name = 'administrator'.
	
	self assert: model allRMQUsers first roles size = 1.
	self assert: model allRMQRoles first users size = 1.
	self assert: model allRMQUsers first roles first = model allRMQRoles first. 
	self assert: model allRMQRoles first users first = model allRMQUsers first
	
]

{ #category : #initialization }
RMQRESTParserTest >> testPopulateExistingVHost [

	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 1.
	self assert: model allRMQVHosts first name = '/'.
	
	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 1.
	self assert: model allRMQVHosts first name = '/'.
]

{ #category : #initialization }
RMQRESTParserTest >> testPopulateUser [

	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 1.
	self assert: model allRMQUsers first name = 'guest'.
	self assert: model allRMQUsers first passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: model allRMQUsers first hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 1.
	self assert: model allRMQRoles first name = 'administrator'.
	
	self assert: model allRMQUsers first roles size = 1.
	self assert: model allRMQRoles first users size = 1.
	self assert: model allRMQUsers first roles first = model allRMQRoles first. 
	self assert: model allRMQRoles first users first = model allRMQUsers first
]

{ #category : #initialization }
RMQRESTParserTest >> testPopulateVHost [

	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 1.
	self assert: model allRMQVHosts first name = '/'.
]
