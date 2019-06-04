Class {
	#name : #PulseRESTParserTestApiDefinitions,
	#superclass : #TestCase,
	#instVars : [
		'objects',
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #accessing }
PulseRESTParserTestApiDefinitions >> data [
	^ '{"rabbit_version":"3.7.8","users":[{"name":"userMonitoring","password_hash":"tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"monitoring"},{"name":"guest2","password_hash":"jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"},{"name":"newUser","password_hash":"YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"management"},{"name":"guest","password_hash":"RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI","hashing_algorithm":"rabbit_password_hashing_sha256","tags":"administrator"}],"vhosts":[{"name":"/"},{"name":"/2"}],"permissions":[{"user":"guest","vhost":"/2","configure":".*","write":".*","read":".*"},{"user":"guest","vhost":"/","configure":".*","write":".*","read":".*"}],"topic_permissions":[],"parameters":[{"value":{"max-connections":1000},"vhost":"/","component":"vhost-limits","name":"limits"},{"value":{"max-queues":200},"vhost":"/2","component":"vhost-limits","name":"limits"},{"value":{"pattern":"patt1","definition":{"expires":10000000000,"max-length":244,"max-length-bytes":245,"message-ttl":45},"priority":5,"apply-to":"queues"},"vhost":"/","component":"operator_policy","name":"policy1"}],"global_parameters":[{"name":"cluster_name","value":"rabbit@a12b253c30bd"}],"policies":[],"queues":[{"name":"testQueue","vhost":"/","durable":true,"auto_delete":false,"arguments":{}},{"name":"testQueue2","vhost":"/","durable":true,"auto_delete":false,"arguments":{"x-dead-letter-exchange":"testExchange","x-dead-letter-routing-key":"dead-letter-routing-key","x-expires":10000000000,"x-max-length":255,"x-max-length-bytes":256,"x-max-priority":1,"x-message-ttl":9,"x-queue-mode":"lazy"}}],"exchanges":[{"name":"testExchange","vhost":"/","type":"direct","durable":true,"auto_delete":false,"internal":false,"arguments":{}},{"name":"testExchange2","vhost":"/","type":"topic","durable":false,"auto_delete":false,"internal":true,"arguments":{"alternate-exchange":"testExchange"}}],"bindings":[{"source":"testExchange","vhost":"/","destination":"testExchange2","destination_type":"exchange","routing_key":"rkExchange","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue","destination_type":"queue","routing_key":"testRoutingKey","arguments":{}},{"source":"testExchange","vhost":"/","destination":"testQueue2","destination_type":"queue","routing_key":"testRoutingKeyBinding","arguments":{}}]}'.
]

{ #category : #initialization }
PulseRESTParserTestApiDefinitions >> setUp [

	| parser |
	parser := PPParserResource current parserAt: PPJsonParser.
	objects := parser parse: self data.
	
	model := PulseModel new.
	model name: 'test'.
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiDefinitions >> testPopulateBindings [

	| b1 b2 b3 |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allPulseBindings size = 3.
	
	b2 := model allPulseBindingWithQueues first.
	b3 := model allPulseBindingWithQueues second.
	b1 := model allPulseBindingWithExchanges first.
		
	self assert: b1 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: ((model allPulseVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: ((model allPulseVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destination = (model allPulseExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destination = (model allPulseQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allPulseQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destination = (model allPulseQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allPulseQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey first =  (model allPulseRoutingKeys detect: [:e | e pulseName = 'rkExchange']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey first  = (model allPulseRoutingKeys detect: [:e | e pulseName = 'testRoutingKey']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey first = (model allPulseRoutingKeys detect: [:e | e pulseName = 'testRoutingKeyBinding']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiDefinitions >> testPopulateExchange [

	| t1 t2 |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allPulseExchanges size = 2.
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allPulseExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allPulseExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: t1 type pulseState = 'direct'.
	self assert: t2 type pulseState = 'topic'.
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingBindings [

	| b1 b2 b3 |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withBindings: (objects at: 'bindings').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withBindings: (objects at: 'bindings').
	
	self assert: model allPulseBindings size = 3.
	
	b2 := model allPulseBindingWithQueues first.
	b3 := model allPulseBindingWithQueues second.
	b1 := model allPulseBindingWithExchanges first.
	
	
	self assert: b1 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: ((model allPulseVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b1 ]).
	self assert: b2 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: ((model allPulseVHosts detect: [:e | e name = '/']) bindings anySatisfy: [ :e | e =b2 ]).
	
	self assert: b1 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 source = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) sourceBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 destination = (model allPulseExchanges detect: [:e | e name = 'testExchange2']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange2']) destinationBindings anySatisfy: [ :e | e = b1 ]).
	self assert: b2 destination = (model allPulseQueues detect: [:e | e name = 'testQueue']).
	self assert: ((model allPulseQueues detect: [:e | e name = 'testQueue']) destinationBindings anySatisfy: [ :e | e = b2 ]).
	self assert: b3 destination = (model allPulseQueues detect: [:e | e name = 'testQueue2']).
	self assert: ((model allPulseQueues detect: [:e | e name = 'testQueue2']) destinationBindings anySatisfy: [ :e | e = b3 ]).
	
	self assert: b1 routingKey  = (model allPulseRoutingKeys detect: [:e | e name = 'rkExchange']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'rkExchange']) binding = b1 ).
	self assert: b2 routingKey  = (model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKey']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKey'])  binding = b2).
	self assert: b3 routingKey  = (model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding']).
	self assert: ((model allPulseRoutingKeys detect: [:e | e name = 'testRoutingKeyBinding'])  binding = b3 ).
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingExchange [

	| t1 t2 |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withExchanges: (objects at: 'exchanges').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withExchanges: (objects at: 'exchanges').
	
	self assert: model allPulseExchanges size = 2.
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'testExchange']).
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'testExchange2']).
	
	t1 := model allPulseExchanges detect: [:e | e name = 'testExchange'].
	t2 := model allPulseExchanges detect: [:e | e name = 'testExchange2'].

	self assert: t1 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: t2 vhost = (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: t1 type pulseState = 'direct'.
	self assert: t2 type pulseState= 'topic'.
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	self assert: t1 my_alternate_exchange = nil.
	self assert: t2 my_alternate_exchange = (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: ((model allPulseExchanges detect: [:e | e name = 'testExchange']) alternate_exchange_for anySatisfy: [:e | e = t2]).
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingGlobalParameters [
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withGlobalParameters: (objects at: 'global_parameters').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allPulseClusters size = 1.
	self assert: model allPulseClusters first name = 'rabbit@a12b253c30bd'
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingPermission [

	| p1 p2 vh1 vh2 user |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withPermissions: (objects at: 'permissions').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allPulsePermissions size = 2.
	
	
	p1 := model allPulsePermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'configure'and:["e vhost name = '/']].
	p2 := model allPulsePermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'read'and:["e vhost name = '/2']].
	
	vh1 := (model allPulseVHosts detect: [:e | e name = '/']).
	vh2 := (model allPulseVHosts detect: [:e | e name = '/2']).
	
	user := (model allPulseUsers detect: [:e | e name = 'guest']).
	
	
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
PulseRESTParserTestApiDefinitions >> testPopulateExistingQueue [

	| t1 t2 exch vh rtK |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withQueues: (objects at: 'queues').
	
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withQueues: (objects at: 'queues').
	
	self assert: model allPulseQueues size = 2.
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allPulseQueues detect: [:e | e name = 'testQueue'].
	t2 := model allPulseQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	
	self assert: t1 vhost = model allPulseVHosts first.	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
		
		
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allPulseVHosts first.	
	self assert: t2 durability = true.
	
	self assert: (t2 dead_letter_exchange = (model allPulseExchanges detect: [:e | e name = 'testExchange'])).
	exch := (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: (t2 dead_letter_exchange = exch).
	self assert: (exch queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	self assert: (t2 dead_letter_routing_key = (model allPulseRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	rtK := (model allPulseRoutingKeys detect: [:e | e name = 'dead-letter-routing-key']).
	self assert: (t2 dead_letter_routing_key = rtK).
	self assert: (rtK queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	
	
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingUser [

	| user any |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withUsers: (objects at: 'users').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withUsers: (objects at: 'users').
	
	self assert: model allPulseUsers size = 4.
	
	self assert: (model allPulseUsers anySatisfy: [:e | e name = 'guest']).
	user := model allPulseUsers detect: [:e | e name = 'guest'].
	
	self assert: user passwordHash = 'RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI'.
	self assert: user hashingAlgorithm = 'rabbit_password_hashing_sha256'.
	
	any := model allPulseRoles detect: [:e | e name = 'administrator'].
	self assert: model allPulseRoles size = 3.
	self assert: any name = 'administrator'.
	
	self assert: user roles size = 1.
	self assert: any user = user.
	self assert: (user roles anySatisfy: [:e | e = any]). 
	self assert: (any user= user).

]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiDefinitions >> testPopulateExistingVHost [

	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withVhosts: (objects at: 'vhosts').
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allPulseVHosts size = 2.
	self assert: (model allPulseVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allPulseVHosts anySatisfy: [:e | e name = '/2']).
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiDefinitions >> testPopulateGlobalParameters [
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withGlobalParameters: (objects at: 'global_parameters').
	self assert: model allPulseClusters size = 1.
	self assert: model allPulseClusters first name = 'rabbit@a12b253c30bd'.
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiDefinitions >> testPopulatePermission [

	| p1 p2 vh1 vh2 user |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withPermissions: (objects at: 'permissions').
	
	self assert: model allPulsePermissions size = 2.
	
	
	p1 := model allPulsePermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'configure'and:["e vhost name = '/']].
	p2 := model allPulsePermissions detect:[:e | e user name = 'guest' and:["e type rmqState = 'read'and:["e vhost name = '/2']].
	
	vh1 := (model allPulseVHosts detect: [:e | e name = '/']).
	vh2 := (model allPulseVHosts detect: [:e | e name = '/2']).
	
	user := (model allPulseUsers detect: [:e | e name = 'guest']).
	
	
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
PulseRESTParserTestApiDefinitions >> testPopulateQueue [

	| t1 t2 vh exch rtK |
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withQueues: (objects at: 'queues').
	
	self assert: model allPulseQueues size = 2.
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'testQueue']).
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'testQueue2']).
	
	t1 := model allPulseQueues detect: [:e | e name = 'testQueue'].
	t2 := model allPulseQueues detect: [:e | e name = 'testQueue2'].

	self assert: t1 autoDelete = false.
	
	self assert: t1 vhost = model allPulseVHosts first.	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
		
		
	self assert: t1 durability = true.

	self assert: t2 autoDelete = false.
	self assert: t2 vhost = model allPulseVHosts first.	
	self assert: t2 durability = true.
	
	self assert: (t2 dead_letter_exchange = (model allPulseExchanges detect: [:e | e name = 'testExchange'])).
	exch := (model allPulseExchanges detect: [:e | e name = 'testExchange']).
	self assert: (t2 dead_letter_exchange = exch).
	self assert: (exch queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	self assert: (t2 dead_letter_routing_key = (model allPulseRoutingKeys detect: [:e | e name = 'dead-letter-routing-key'])).
	rtK := (model allPulseRoutingKeys detect: [:e | e name = 'dead-letter-routing-key']).
	self assert: (t2 dead_letter_routing_key = rtK).
	self assert: (rtK queues_for_dead_letter anySatisfy: [ :e | e =t2 ]).
	
	
	
	self assert: t2 expiresAfter = 10000000000.
	self assert: t2 maxLength = 255.
	self assert: t2 maxLengthBytes = 256 .
	self assert: t2 maxPriority = 1.
	self assert: t2 messageTTL = 9.
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiDefinitions >> testPopulateUser [
	"I have not the information for now"
	| user vh t1 t2 t3 t4 |
	"self assert: user vhosts size = 2.	
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (user vhosts anySatisfy:[:e | e = vh]).
	self assert: (vh users anySatisfy: [ :e | e =user ])."
	
	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withUsers: (objects at: 'users').
	
	self assert: model allPulseUsers size = 4.
	self assert: (model allPulseUsers anySatisfy: [:e | e name = 'guest']).
	t1 := model allPulseUsers detect: [:e | e name = 'guest'].
	t2 := model allPulseUsers detect: [:e | e name = 'guest2'].
	t3 := model allPulseUsers detect: [:e | e name = 'newUser'].
	t4 := model allPulseUsers detect: [:e | e name = 'userMonitoring'].
	
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
PulseRESTParserTestApiDefinitions >> testPopulateVHost [

	(PulseRESTParserApiDefinitions newOn: 'test') populate: model withVhosts: (objects at: 'vhosts').
	
	self assert: model allPulseVHosts size = 2.
	self assert: (model allPulseVHosts anySatisfy: [:e | e name = '/']).
	self assert: (model allPulseVHosts anySatisfy: [:e | e name = '/2']).
]
