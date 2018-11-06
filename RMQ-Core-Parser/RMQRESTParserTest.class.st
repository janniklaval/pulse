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
	^ '{"rabbit_version":"3.7.8","users":[{"name":"userMonitoring","password_hash":"tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"monitoring"},{"name":"guest2","password_hash":"jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"},{"name":"newUser","password_hash":"YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"management"},{"name":"guest","password_hash":"RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"}],"vhosts":[{"name":"/"},{"name":"/2"}],"permissions":[{"user":"guest","vhost":"/2","configure":".*","write":".*","read":".*"},{"user":"guest","vhost":"/","configure":".*","write":".*","read":".*"}],"topic_permissions":[],"parameters":[{"value":{"max-connections":1000},"vhost":"/","component":"vhost-limits","name":"limits"},{"value":{"max-queues":200},"vhost":"/2","component":"vhost-limits","name":"limits"},{"value":{"pattern":"patt1","definition":{"expires":10000000000,"max-length":244,"max-length-bytes":245,"message-ttl":45},"priority":5,"apply-to":"queues"},"vhost":"/","component":"operator_policy","name":"policy1"}],"global_parameters":[{"name":"cluster_name","value":"rabbit@a12b253c30bd"}],"policies":[],"queues":[{"name":"testQueue","vhost":"/","durable":true,"auto_delete":false,"arguments":{}},{"name":"testQueue2","vhost":"/","durable":true,"auto_delete":false,"arguments":{"x-dead-letter-exchange":"testExchange","x-dead-letter-routing-key":"dead-letter-routing-key","x-expires":10000000000,"x-max-length":255,"x-max-length-bytes":256,"x-max-priority":1,"x-message-ttl":9,"x-queue-mode":"lazy"}}],"exchanges":[{"name":"testExchange","vhost":"/","type":"direct","durable":true,"auto_delete":false,"internal":false,"arguments":{}},{"name":"testExchange2","vhost":"/","type":"topic","durable":false,"auto_delete":false,"internal":true,"arguments":{"alternate-exchange":"testExchange"}}],"bindings":[{"source":"testExchange","vhost":"/","destination":"testQueue","destination_type":"queue","routing_key":"testRoutingKey","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue2","destination_type":"queue","routing_key":"testRoutingKeyBinding","arguments":{}}]}'.
]

{ #category : #accessing }
RMQRESTParserTest >> dataFirst [
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
RMQRESTParserTest >> testPopulateExistingQueue [

	| t1 t2 |
	RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
	self assert: model allRMQQueues size = 2.
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allRMQQueues detect: [:e | e name = 'testQueue'].
	t2 := model allRMQQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	self assert: t1 vhost = model allRMQVHosts first.	
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allRMQVHosts first.	
	self assert: t2 durability = true.
	self assert: (t2 dead_letter_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange'])).
	self assert: (t2 dead_letter_routing_key = (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
	
	RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
	self assert: model allRMQQueues size = 2.
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allRMQQueues detect: [:e | e name = 'testQueue'].
	t2 := model allRMQQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	self assert: t1 vhost = model allRMQVHosts first.	
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allRMQVHosts first.	
	self assert: t2 durability = true.
	self assert: (t2 dead_letter_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange'])).
	self assert: (t2 dead_letter_routing_key = (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
]

{ #category : #initialization }
RMQRESTParserTest >> testPopulateExistingUser [

	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 3.
	self assert: model allRMQUsers first name = 'guest'.
	self assert: model allRMQUsers first passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: model allRMQUsers first hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 3.
	self assert: model allRMQRoles first name = 'administrator'.
	self assert: model allRMQRoles second name = 'management'.
	self assert: model allRMQRoles third name = 'monitoring'.
	
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
RMQRESTParserTest >> testPopulateQueue [

	| t1 t2 |
	RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
	self assert: model allRMQQueues size = 2.
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allRMQQueues detect: [:e | e name = 'testQueue'].
	t2 := model allRMQQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	self assert: t1 vhost = model allRMQVHosts first.	
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allRMQVHosts first.	
	self assert: t2 durability = true.
	self assert: (t2 dead_letter_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange'])).
	self assert: (t2 dead_letter_routing_key = (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
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
