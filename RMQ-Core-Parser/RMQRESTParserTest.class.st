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
	^ '{"rabbit_version":"3.7.8","users":[{"name":"userMonitoring","password_hash":"tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"monitoring"},{"name":"guest2","password_hash":"jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"},{"name":"newUser","password_hash":"YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"management"},{"name":"guest","password_hash":"RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"}],"vhosts":[{"name":"/"},{"name":"/2"}],"permissions":[{"user":"guest","vhost":"/2","configure":".*","write":".*","read":".*"},{"user":"guest","vhost":"/","configure":".*","write":".*","read":".*"}],"topic_permissions":[],"parameters":[{"value":{"max-connections":1000},"vhost":"/","component":"vhost-limits","name":"limits"},{"value":{"max-queues":200},"vhost":"/2","component":"vhost-limits","name":"limits"},{"value":{"pattern":"patt1","definition":{"expires":10000000000,"max-length":244,"max-length-bytes":245,"message-ttl":45},"priority":5,"apply-to":"queues"},"vhost":"/","component":"operator_policy","name":"policy1"}],"global_parameters":[{"name":"cluster_name","value":"rabbit@a12b253c30bd"}],"policies":[],"queues":[{"name":"testQueue","vhost":"/","durable":true,"auto_delete":false,"arguments":{}},{"name":"testQueue2","vhost":"/","durable":true,"auto_delete":false,"arguments":{"x-dead-letter-exchange":"testExchange","x-dead-letter-routing-key":"dead-letter-routing-key","x-expires":10000000000,"x-max-length":255,"x-max-length-bytes":256,"x-max-priority":1,"x-message-ttl":9,"x-queue-mode":"lazy"}}],"exchanges":[{"name":"testExchange","vhost":"/","type":"direct","durable":true,"auto_delete":false,"internal":false,"arguments":{}},{"name":"testExchange2","vhost":"/","type":"topic","durable":false,"auto_delete":false,"internal":true,"arguments":{"alternate-exchange":"testExchange"}}],"bindings":[{"source":"testExchange","vhost":"/","destination":"testExchange2","destination_type":"exchange","routing_key":"rkExchange","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue","destination_type":"queue","routing_key":"testRoutingKey","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue2","destination_type":"queue","routing_key":"testRoutingKeyBinding","arguments":{}}]}'.
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
RMQRESTParserTest >> testNOTWORKINGPopulateUser [
	"I have not the information for now"
	| user vh |
	"self assert: user vhosts size = 2.	
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (user vhosts anySatisfy:[:e | e = vh]).
	self assert: (vh users anySatisfy: [ :e | e =user ])."
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateBindings [

	| b1 b2 b3 |
	RMQRESTParser populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allRMQBindings size = 3.
	
	b1 := model allRMQBindings first.
	b2 := model allRMQBindings second.
	b3 := model allRMQBindings third.
	
	self assert: b1 destinationType = 'exchange'.
	self assert: b2 destinationType = 'queue'.
	self assert: b3 destinationType = 'queue'.
	
	self assert: b1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destinationExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destinationQueue = (model allRMQQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destinationQueue = (model allRMQQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateExchange [

	| t1 t2 |
	RMQRESTParser populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allRMQExchanges size = 2.
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allRMQExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allRMQExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t1 type = 'direct'.
	self assert: t2 type = 'topic'.
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingBindings [

	| b1 b2 b3 |
	RMQRESTParser populate: model withBindings: (objects at: 'bindings').
	RMQRESTParser populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allRMQBindings size = 3.
	
	b1 := model allRMQBindings first.
	b2 := model allRMQBindings second.
	b3 := model allRMQBindings third.
	
	self assert: b1 destinationType = 'exchange'.
	self assert: b2 destinationType = 'queue'.
	self assert: b3 destinationType = 'queue'.
	
	self assert: b1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 sourceExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destinationExchange = (model allRMQExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destinationQueue = (model allRMQQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destinationQueue = (model allRMQQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingExchange [

	| t1 t2 |
	RMQRESTParser populate: model withExchanges: (objects at: 'exchanges').
	RMQRESTParser populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allRMQExchanges size = 2.
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allRMQExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allRMQExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t1 type = 'direct'.
	self assert: t2 type = 'topic'.
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingGlobalParameters [
	RMQRESTParser populate: model withGlobalParameters: (objects at: 'global_parameters').
	RMQRESTParser populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allRMQClusters size = 1.
	self assert: model allRMQClusters first name = 'rabbit@a12b253c30bd'
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingPermission [

	| p1 p2 vh1 vh2 user |
	RMQRESTParser populate: model withPermissions: (objects at: 'permissions').
	RMQRESTParser populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allRMQPermissions size = 6.
	
	
	p1 := model allRMQPermissions detect:[:e | e user name = 'guest' and:[e type rmqState = 'configure'and:[e vhost name = '/']]].
	p2 := model allRMQPermissions detect:[:e | e user name = 'guest' and:[e type rmqState = 'read'and:[e vhost name = '/2']]].
	
	vh1 := (model allRMQVHosts detect: [:e | e name = '/']).
	vh2 := (model allRMQVHosts detect: [:e | e name = '/2']).
	
	user := (model allRMQUsers detect: [:e | e name = 'guest']).
	
	
	self assert: p1 vhost = vh1.	
	self assert: p2 vhost = vh2.
	self assert: (vh1 permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (vh2 permissions anySatisfy: [ :e | e =p2 ]).
	
	self assert: p1 user = user.
	self assert: p2 user = user.
	self assert: (user permissions size = 6).
	self assert: (user permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (user permissions anySatisfy: [ :e | e =p2 ]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingQueue [

	| t1 t2 exch vh rtK |
	RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
	self assert: model allRMQQueues size = 2.
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allRMQQueues detect: [:e | e name = 'testQueue'].
	t2 := model allRMQQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	
	self assert: t1 vhost = model allRMQVHosts first.	
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
		
		
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allRMQVHosts first.	
	self assert: t2 durability = true.
	
	self assert: (t2 dead_letter_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange'])).
	exch := (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: (t2 dead_letter_exchange = exch).
	self assert: (exch queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	self assert: (t2 dead_letter_routing_key = (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	rtK := (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key']).
	self assert: (t2 dead_letter_routing_key = rtK).
	self assert: (rtK queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	
	
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingUser [

	| user |
	RMQRESTParser populate: model withUsers: (objects at: 'users').
	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 4.
	
	self assert: (model allRMQUsers anySatisfy: [:e | e name = 'guest']).
	user := model allRMQUsers detect: [:e | e name = 'guest'].
	
	self assert: user passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: user hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 3.
	self assert: model allRMQRoles first name = 'administrator'.
	
	self assert: user roles size = 1.
	self assert: model allRMQRoles first users size = 2.
	self assert: user roles first = model allRMQRoles first. 
	self assert: model allRMQRoles first users second = model allRMQUsers first.

]

{ #category : #'testing-double-insert' }
RMQRESTParserTest >> testPopulateExistingVHost [

	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 2.
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/2']).
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateGlobalParameters [
	RMQRESTParser populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allRMQClusters size = 1.
	self assert: model allRMQClusters first name = 'rabbit@a12b253c30bd'.
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulatePermission [

	| p1 p2 vh1 vh2 user |
	RMQRESTParser populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allRMQPermissions size = 6.
	
	
	p1 := model allRMQPermissions detect:[:e | e user name = 'guest' and:[e type rmqState = 'configure'and:[e vhost name = '/']]].
	p2 := model allRMQPermissions detect:[:e | e user name = 'guest' and:[e type rmqState = 'read'and:[e vhost name = '/2']]].
	
	vh1 := (model allRMQVHosts detect: [:e | e name = '/']).
	vh2 := (model allRMQVHosts detect: [:e | e name = '/2']).
	
	user := (model allRMQUsers detect: [:e | e name = 'guest']).
	
	
	self assert: p1 vhost = vh1.	
	self assert: p2 vhost = vh2.
	self assert: (vh1 permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (vh2 permissions anySatisfy: [ :e | e =p2 ]).
	
	self assert: p1 user = user.
	self assert: p2 user = user.
	self assert: (user permissions size = 6).
	self assert: (user permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (user permissions anySatisfy: [ :e | e =p2 ]).
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateQueue [

	| t1 t2 vh exch rtK |
	RMQRESTParser populate: model withQueues: (objects at: 'queues').
	
	self assert: model allRMQQueues size = 2.
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allRMQQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allRMQQueues detect: [:e | e name = 'testQueue'].
	t2 := model allRMQQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	
	self assert: t1 vhost = model allRMQVHosts first.	
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
		
		
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allRMQVHosts first.	
	self assert: t2 durability = true.
	
	self assert: (t2 dead_letter_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange'])).
	exch := (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: (t2 dead_letter_exchange = exch).
	self assert: (exch queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	self assert: (t2 dead_letter_routing_key = (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	rtK := (model allRMQRoutingKeys detect: [:e | e name = 'dead-letter-routing-key']).
	self assert: (t2 dead_letter_routing_key = rtK).
	self assert: (rtK queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	
	
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateUser [

	| user vh |
	RMQRESTParser populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 4.
	
	self assert: (model allRMQUsers anySatisfy: [:e | e name = 'guest']).
	user := model allRMQUsers detect: [:e | e name = 'guest'].
	
	self assert: user passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: user hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	self assert: model allRMQRoles size = 3.
	self assert: model allRMQRoles first name = 'administrator'.
	
	self assert: user roles size = 1.
	self assert: model allRMQRoles first users size = 2.
	self assert: user roles first = model allRMQRoles first. 
	self assert: model allRMQRoles first users first = model allRMQUsers first.
]

{ #category : #'testing - simple' }
RMQRESTParserTest >> testPopulateVHost [

	RMQRESTParser populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 2.
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/2']).
]
