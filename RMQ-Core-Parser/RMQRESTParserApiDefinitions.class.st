"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiDefinitions populate: model withJson: '{""rabbit_version"":""3.7.8"",""users"":[{""name"":""userMonitoring"",""password_hash"":""tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""monitoring""},{""name"":""guest2"",""password_hash"":""jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""administrator""},{""name"":""newUser"",""password_hash"":""YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""management""},{""name"":""guest"",""password_hash"":""RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""administrator""}],""vhosts"":[{""name"":""/""},{""name"":""/2""}],""permissions"":[{""user"":""guest"",""vhost"":""/2"",""configure"":"".*"",""write"":"".*"",""read"":"".*""},{""user"":""guest"",""vhost"":""/"",""configure"":"".*"",""write"":"".*"",""read"":"".*""}],""topic_permissions"":[],""parameters"":[{""value"":{""max-connections"":1000},""vhost"":""/"",""component"":""vhost-limits"",""name"":""limits""},{""value"":{""max-queues"":200},""vhost"":""/2"",""component"":""vhost-limits"",""name"":""limits""},{""value"":{""pattern"":""patt1"",""definition"":{""expires"":10000000000,""max-length"":244,""max-length-bytes"":245,""message-ttl"":45},""priority"":5,""apply-to"":""queues""},""vhost"":""/"",""component"":""operator_policy"",""name"":""policy1""}],""global_parameters"":[{""name"":""cluster_name"",""value"":""rabbit@a12b253c30bd""}],""policies"":[],""queues"":[{""name"":""testQueue"",""vhost"":""/"",""durable"":true,""auto_delete"":false,""arguments"":{}},{""name"":""testQueue2"",""vhost"":""/"",""durable"":true,""auto_delete"":false,""arguments"":{""x-dead-letter-exchange"":""testExchange"",""x-dead-letter-routing-key"":""dead-letter-routing-key"",""x-expires"":10000000000,""x-max-length"":255,""x-max-length-bytes"":256,""x-max-priority"":1,""x-message-ttl"":9,""x-queue-mode"":""lazy""}}],""exchanges"":[{""name"":""testExchange"",""vhost"":""/"",""type"":""direct"",""durable"":true,""auto_delete"":false,""internal"":false,""arguments"":{}},{""name"":""testExchange2"",""vhost"":""/"",""type"":""topic"",""durable"":false,""auto_delete"":false,""internal"":true,""arguments"":{""alternate-exchange"":""testExchange""}}],""bindings"":[{""source"":""testExchange"",""vhost"":""/"",""destination"":""testExchange2"",""destination_type"":""exchange"",""routing_key"":""rkExchange"",""arguments"":{}},{""source"":""testExchange"",""vhost"":""/"",""destination"":""testQueue"",""destination_type"":""queue"",""routing_key"":""testRoutingKey"",""arguments"":{}},{""source"":""testExchange"",""vhost"":""/"",""destination"":""testQueue2"",""destination_type"":""queue"",""routing_key"":""testRoutingKeyBinding"",""arguments"":{}}]}'.
"
Class {
	#name : #RMQRESTParserApiDefinitions,
	#superclass : #RMQParser,
	#category : #'RMQ-Core-Parser'
}

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withBindings: anArray [
	
	| source destination vhostName vhost rkName rk |
	anArray do: [ :aBinding|
	|destType sourceName destinationName element newBinding|
		
	destType := (aBinding at: 'destination_type').
	sourceName := (aBinding at: 'source').
	destinationName := (aBinding at: 'destination').
	
	source:= aModel selectOrAddEntityNamed: sourceName withType: RMQExchange.
		
	destType = 'exchange' ifTrue: [ 
		newBinding := RMQBindingWithExchange new.
		destination:= aModel selectOrAddEntityNamed: destinationName withType: RMQExchange.
	] ifFalse: [ 
		newBinding := RMQBindingWithQueue new.
		destination:= aModel selectOrAddEntityNamed: destinationName withType: RMQQueue.
	].
	newBinding 
		source: source;
		destination: destination.
	
	element := aModel allRMQBindings
		detect: [ :el | el source = source and: [ el destination = destination ] ]
		ifFound: [ :elementFound | 
			elementFound ]
		ifNone: [  
				destination destinationBindings add: newBinding.
				source sourceBindings add: newBinding.
				aModel add: newBinding.
				newBinding ].
			
			
		vhostName := (aBinding at: 'vhost').
		vhost := aModel selectOrAddEntityNamed: vhostName withType: RMQVHost.
		element vhost: vhost.
		vhost bindings add: element.
		
		rkName := (aBinding at: 'routing_key').
		rk := aModel selectOrAddEntityNamed: rkName withType: RMQRoutingKey.
		element routingKey: rk.
		rk binding: element.
	].
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withExchanges: anArray [
	
		| vhostName vhost arg altExchName altExch |
	anArray do: [ :anExchange|
		| exchangeName element |
		
		exchangeName := (anExchange at: 'name').
		
		element := aModel selectOrAddEntityNamed: exchangeName withType:RMQExchange.
		
		"element type: (anExchange at: 'type')."
		
		((anExchange at: 'type') = 'topic') ifTrue: [ element type: (ExchangeType topic).  element type exchanges add: element].
		((anExchange at: 'type') = 'direct') ifTrue: [ element type: (ExchangeType direct).  element type exchanges add: element].
		((anExchange at: 'type') = 'fanout') ifTrue: [ element type: (ExchangeType fanout).  element type exchanges add: element].
		((anExchange at: 'type') = 'headers') ifTrue: [ element type: (ExchangeType headers).  element type exchanges add: element].	
		
		element internal: (anExchange at: 'internal').
		element autoDelete: (anExchange at: 'auto_delete').
		
		vhostName := (anExchange at: 'vhost').
		vhost := aModel selectOrAddEntityNamed: vhostName withType:RMQVHost.
		element vhost: vhost.
		vhost exchanges add: element.

		element durability:(anExchange at: 'durable').
		arg := (anExchange at: 'arguments').
		
		altExchName := (arg at: 'alternate-exchange' ifAbsent:[nil]).
		altExchName ifNotNil:[
			altExch := aModel selectOrAddEntityNamed: altExchName withType:RMQExchange.
			
			element my_alternate_exchange: altExch.
			altExch alternate_exchange_for add: element.
		].
	].
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withGlobalParameters: anArray [
	anArray
		do: [ :el | 
			(el at:'name') = 'cluster_name'
				ifTrue: [ | clusterName |
					clusterName := el at: 'value'.
					aModel selectOrAddEntityNamed: clusterName withType:RMQCluster.
				] 
		]
]

{ #category : #parsing }
RMQRESTParserApiDefinitions class >> populate: aModel withJson: aString [
	| parser rmqObjects   |
	parser := PPParserResource current parserAt: PPJsonParser.
	rmqObjects := parser parse: aString.
	
	self populate: aModel withVhosts: (rmqObjects at: 'vhosts').
	"self populate: aModel withParameters: (rmqObjects at: 'parameters')."
	self populate: aModel withUsers: (rmqObjects at: 'users').
	"self populate: aModel withTopicPermissions: (rmqObjects at: 'topic_permissions')."
	self populate: aModel withPermissions: (rmqObjects at: 'permissions').
	"self populate: aModel withPolicies: (rmqObjects at: 'policies')."
	self populate: aModel withQueues: (rmqObjects at: 'queues').
	self populate: aModel withExchanges: (rmqObjects at: 'exchanges').
	self populate: aModel withBindings: (rmqObjects at: 'bindings').
	self populate: aModel withGlobalParameters: (rmqObjects at: 'global_parameters').
]

{ #category : #'to finish' }
RMQRESTParserApiDefinitions class >> populate: aModel withParameters: anArray [
	self notYetImplemented.
	
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withPermissions: anArray [
	"a Dictionary('configure'->'.*' 'read'->'.*' 'user'->'guest' 'vhost'->'/' 'write'->'.*' )"

	| vhost user |
	anArray
		do: [ :aPermission | 
			| permissionVhostName permissionUserName element configureValue writeValue readValue |
			
			permissionUserName := aPermission at: 'user'.
			permissionVhostName := aPermission at: 'vhost'.		
			configureValue := aPermission at: 'configure'.
			writeValue := aPermission at: 'write'.
			readValue := aPermission at: 'read'.

         "add the new permission to the model if it doest not exist"
			aModel allRMQPermissions
					detect: [ :el | el vhost name = permissionVhostName
								and: [ el user name = permissionUserName and: [ el configureValue = configureValue and: [ el writeValue = writeValue and: [el readValue = readValue] ] ] ] ]
						ifFound: [ :elementFound | element := elementFound ]
						ifNone: [ | newPermission |
							newPermission := RMQPermission new
								configureValue: configureValue;
								writeValue: writeValue; 
								readValue: readValue.
								
						   "add the user to the model if it doest not exist"
							user := aModel selectOrAddEntityNamed: permissionUserName withType: RMQUser.
							newPermission user: user.
							user permissions add: newPermission.
							
							"add the vhost to the model if it doest not exist"
							vhost := aModel selectOrAddEntityNamed: permissionVhostName withType: RMQVHost.
							newPermission vhost: vhost.
							vhost permissions add: newPermission.
						
							aModel add: newPermission.
							element := newPermission ] ] 
]

{ #category : #'to finish' }
RMQRESTParserApiDefinitions class >> populate: aModel withPolicies: anArray [
	self notYetImplemented.
	
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withQueues: anArray [
	"a Dictionary('arguments'->a Dictionary() 'auto_delete'->false 'durable'->true 'name'->'testQueue' 'vhost'->'/' )"

	anArray do: [ :aQueue|
		| queueName element vhostName vhost arg deadRKName deadRK deadExchName deadExch|
		
		queueName := (aQueue at: 'name').
		
		element := aModel selectOrAddEntityNamed: queueName withType: RMQQueue.
		element autoDelete: (aQueue at: 'auto_delete').
		element durability:(aQueue at: 'durable').
		
		vhostName := (aQueue at: 'vhost').
		vhost := aModel selectOrAddEntityNamed: vhostName withType: RMQVHost.
		element vhost: vhost.
		vhost queues add: element.
		
		arg := (aQueue at: 'arguments').
		element expiresAfter: (arg at: 'x-expires' ifAbsent:[nil]);
			maxLength: (arg at: 'x-max-length' ifAbsent:[nil]);
			maxLengthBytes: (arg at: 'x-max-length-bytes' ifAbsent:[nil]);
			maxPriority: (arg at: 'x-max-priority' ifAbsent:[nil]);
			messageTTL: (arg at: 'x-message-ttl' ifAbsent:[nil]).
			
		deadRKName := (arg at: 'x-dead-letter-routing-key' ifAbsent:[nil]).
		deadRKName ifNotNil:[
			deadRK := aModel selectOrAddEntityNamed: deadRKName withType: RMQRoutingKey.
			element dead_letter_routing_key: deadRK.
			deadRK queues_for_dead_letter add: element.
		].
	
		deadExchName := (arg at: 'x-dead-letter-exchange' ifAbsent:[nil]).
		deadExchName ifNotNil: [
			deadExch := aModel selectOrAddEntityNamed: deadExchName withType: RMQExchange.
			element dead_letter_exchange: deadExch.
			deadExch queues_for_dead_letter add: element.
		].
	].
]

{ #category : #'to finish' }
RMQRESTParserApiDefinitions class >> populate: aModel withTopicPermissions: anArray [
	self notYetImplemented.
	
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withUsers: anArray [
	anArray do: [ :aUser|
		| userName element |
		
		userName := (aUser at: 'name').
		
		element := aModel selectOrAddEntityNamed: userName withType: RMQUser.
		element passwordHash: (aUser at: 'password_hash').
		element hashingAlgorithm: (aUser at: 'hashing_algorithm').
		
		
		
		((aUser at: 'tags') substrings: ';') do:[:aRoleString | 
			|role|			
			role := aModel selectOrAddEntityNamed: aRoleString withType: RMQRole.
			(element roles anySatisfy: [ :e | e = role ]) ifFalse: [
			element roles add: role.
			role user: element  
			].
			
		].
	].
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withVhosts: anArray [
	anArray do: [ :aVhost|
		| vhostName element |
		
		vhostName := (aVhost at: 'name').
		
		element := aModel selectOrAddEntityNamed: vhostName withType: RMQVHost.
	].
]
