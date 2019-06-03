Class {
	#name : #RMQRESTParserTestApiDefinitions,
	#superclass : #TestCase,
	#instVars : [
		'objects',
		'model'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #accessing }
RMQRESTParserTestApiDefinitions >> data [
	^ '{"rabbit_version":"3.7.8","users":[{"name":"userMonitoring","password_hash":"tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"monitoring"},{"name":"guest2","password_hash":"jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"},{"name":"newUser","password_hash":"YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"management"},{"name":"guest","password_hash":"RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"}],"vhosts":[{"name":"/"},{"name":"/2"}],"permissions":[{"user":"guest","vhost":"/2","configure":".*","write":".*","read":".*"},{"user":"guest","vhost":"/","configure":".*","write":".*","read":".*"}],"topic_permissions":[],"parameters":[{"value":{"max-connections":1000},"vhost":"/","component":"vhost-limits","name":"limits"},{"value":{"max-queues":200},"vhost":"/2","component":"vhost-limits","name":"limits"},{"value":{"pattern":"patt1","definition":{"expires":10000000000,"max-length":244,"max-length-bytes":245,"message-ttl":45},"priority":5,"apply-to":"queues"},"vhost":"/","component":"operator_policy","name":"policy1"}],"global_parameters":[{"name":"cluster_name","value":"rabbit@a12b253c30bd"}],"policies":[],"queues":[{"name":"testQueue","vhost":"/","durable":true,"auto_delete":false,"arguments":{}},{"name":"testQueue2","vhost":"/","durable":true,"auto_delete":false,"arguments":{"x-dead-letter-exchange":"testExchange","x-dead-letter-routing-key":"dead-letter-routing-key","x-expires":10000000000,"x-max-length":255,"x-max-length-bytes":256,"x-max-priority":1,"x-message-ttl":9,"x-queue-mode":"lazy"}}],"exchanges":[{"name":"testExchange","vhost":"/","type":"direct","durable":true,"auto_delete":false,"internal":false,"arguments":{}},{"name":"testExchange2","vhost":"/","type":"topic","durable":false,"auto_delete":false,"internal":true,"arguments":{"alternate-exchange":"testExchange"}}],"bindings":[{"source":"testExchange","vhost":"/","destination":"testExchange2","destination_type":"exchange","routing_key":"rkExchange","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue","destination_type":"queue","routing_key":"testRoutingKey","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue2","destination_type":"queue","routing_key":"testRoutingKeyBinding","arguments":{}}]}'.
]

{ #category : #initialization }
RMQRESTParserTestApiDefinitions >> setUp [

	| parser |
	parser := PPParserResource current parserAt: PPJsonParser.
	objects := parser parse: self data.
	
	model := OldPulseModel new.
	model name: 'test'.
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulateBindings [

	| b1 b2 b3 |
	RMQRESTParserApiDefinitions populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allRMQBindings size = 3.
	
	b2 := model allRMQBindingWithQueues first.
	b3 := model allRMQBindingWithQueues second.
	b1 := model allRMQBindingWithExchanges first.
		
	self assert: b1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destination = (model allRMQExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destination = (model allRMQQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destination = (model allRMQQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulateExchange [

	| t1 t2 |
	RMQRESTParserApiDefinitions populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allRMQExchanges size = 2.
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allRMQExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allRMQExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t1 type name = 'direct'.
	self assert: t2 type name = 'topic'.
	self assert: t1 durability = 'durable'.
	self assert: t2 durability = 'transient'.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingBindings [

	| b1 b2 b3 |
	RMQRESTParserApiDefinitions populate: model withBindings: (objects at: 'bindings').
	RMQRESTParserApiDefinitions populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allRMQBindings size = 3.
	
	b2 := model allRMQBindingWithQueues first.
	b3 := model allRMQBindingWithQueues second.
	b1 := model allRMQBindingWithExchanges first.
	
	
	self assert: b1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: ((model allRMQVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 source = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destination = (model allRMQExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destination = (model allRMQQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destination = (model allRMQQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allRMQQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey  = (model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding']).
	self assert: ((model allRMQRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingExchange [

	| t1 t2 |
	RMQRESTParserApiDefinitions populate: model withExchanges: (objects at: 'exchanges').
	RMQRESTParserApiDefinitions populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allRMQExchanges size = 2.
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allRMQExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allRMQExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allRMQExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: t1 type name = 'direct'.
	self assert: t2 type name= 'topic'.
	self assert: t1 durability = 'durable'.
	self assert: t2 durability = 'transient'.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allRMQExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allRMQExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingGlobalParameters [
	RMQRESTParserApiDefinitions populate: model withGlobalParameters: (objects at: 'global_parameters').
	RMQRESTParserApiDefinitions populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allRMQClusters size = 1.
	self assert: model allRMQClusters first name = 'rabbit@a12b253c30bd'
]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingPermission [

	| p1 p2 vh1 vh2 user |
	RMQRESTParserApiDefinitions populate: model withPermissions: (objects at: 'permissions').
	RMQRESTParserApiDefinitions populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allRMQPermissions size = 2.
	
	
	p1 := model allRMQPermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'configure'and:["e vhost name = '/']].
	p2 := model allRMQPermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'read'and:["e vhost name = '/2']].
	
	vh1 := (model allRMQVHosts detect: [:e | e name = '/']).
	vh2 := (model allRMQVHosts detect: [:e | e name = '/2']).
	
	user := (model allRMQUsers detect: [:e | e name = 'guest']).
	
	
	self assert: p1 vhost = vh1.	
	self assert: p2 vhost = vh2.
	self assert: (vh1 permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (vh2 permissions anySatisfy: [ :e | e =p2 ]).
	
	self assert: p1 user = user.
	self assert: p2 user = user.
	self assert: (user permissions size = 2).
	self assert: (user permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (user permissions anySatisfy: [ :e | e =p2 ]).
]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingQueue [

	| t1 t2 exch vh rtK |
	RMQRESTParserApiDefinitions populate: model withQueues: (objects at: 'queues').
	
RMQRESTParserApiDefinitions populate: model withQueues: (objects at: 'queues').
	
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
RMQRESTParserTestApiDefinitions >> testPopulateExistingUser [

	| user any |
	RMQRESTParserApiDefinitions populate: model withUsers: (objects at: 'users').
	RMQRESTParserApiDefinitions populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 4.
	
	self assert: (model allRMQUsers anySatisfy: [:e | e name = 'guest']).
	user := model allRMQUsers detect: [:e | e name = 'guest'].
	
	self assert: user passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: user hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	any := model allRMQRoles detect: [:e | e name = 'administrator'].
	self assert: model allRMQRoles size = 3.
	self assert: any name = 'administrator'.
	
	self assert: user roles size = 1.
	self assert: any user = user.
	self assert: (user roles anySatisfy: [:e | e = any]). 
	self assert: (any user= user).

]

{ #category : #'testing-double-insert' }
RMQRESTParserTestApiDefinitions >> testPopulateExistingVHost [

	RMQRESTParserApiDefinitions populate: model withVhosts: (objects at: 'vhosts').
	RMQRESTParserApiDefinitions populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 2.
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/2']).
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulateGlobalParameters [
	RMQRESTParserApiDefinitions populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allRMQClusters size = 1.
	self assert: model allRMQClusters first name = 'rabbit@a12b253c30bd'.
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulatePermission [

	| p1 p2 vh1 vh2 user |
	RMQRESTParserApiDefinitions populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allRMQPermissions size = 2.
	
	
	p1 := model allRMQPermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'configure'and:["e vhost name = '/']].
	p2 := model allRMQPermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'read'and:["e vhost name = '/2']].
	
	vh1 := (model allRMQVHosts detect: [:e | e name = '/']).
	vh2 := (model allRMQVHosts detect: [:e | e name = '/2']).
	
	user := (model allRMQUsers detect: [:e | e name = 'guest']).
	
	
	self assert: p1 vhost = vh1.	
	self assert: p2 vhost = vh2.
	self assert: (vh1 permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (vh2 permissions anySatisfy: [ :e | e =p2 ]).
	
	self assert: p1 user = user.
	self assert: p2 user = user.
	self assert: (user permissions size = 2).
	self assert: (user permissions anySatisfy: [ :e | e =p1 ]).
	self assert: (user permissions anySatisfy: [ :e | e =p2 ]).
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulateQueue [

	| t1 t2 vh exch rtK |
	RMQRESTParserApiDefinitions populate: model withQueues: (objects at: 'queues').
	
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
RMQRESTParserTestApiDefinitions >> testPopulateUser [
	"I have not the information for now"
	| user vh t1 t2 t3 t4 |
	"self assert: user vhosts size = 2.	
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (user vhosts anySatisfy:[:e | e = vh]).
	self assert: (vh users anySatisfy: [ :e | e =user ])."
	
	RMQRESTParserApiDefinitions populate: model withUsers: (objects at: 'users').
	
	self assert: model allRMQUsers size = 4.
	self assert: (model allRMQUsers anySatisfy: [:e | e name = 'guest']).
	t1 := model allRMQUsers detect: [:e | e name = 'guest'].
	t2 := model allRMQUsers detect: [:e | e name = 'guest2'].
	t3 := model allRMQUsers detect: [:e | e name = 'newUser'].
	t4 := model allRMQUsers detect: [:e | e name = 'userMonitoring'].
	
	self assert: t1 passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: t1 hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	self assert: t1 roles size = 1.
	self assert: t2 roles size = 1.
	self assert: t3 roles size = 1.
	self assert: t4 roles size = 1.
	
	self assert: (t1 roles anyOne user = t1).
	self assert: t2 roles anyOne = t1 roles anyOne.
	
	self assert: (t3 roles anyOne user = t3).
	self assert: (t4 roles anyOne user = t4).
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiDefinitions >> testPopulateVHost [

	RMQRESTParserApiDefinitions populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allRMQVHosts size = 2.
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allRMQVHosts anySatisfy: [:e | e name = '/2']).
]
