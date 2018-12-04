"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiDefinitions populate: model withJson: '{""rabbit_version"":""3.7.8"",""users"":[{""name"":""userMonitoring"",""password_hash"":""tY9o+KU/Qns8Mccyplrw7oEDt8r8SmkARQhrJ3KC5OD635Eb"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""monitoring""},{""name"":""guest2"",""password_hash"":""jaEzGO38CAFeJdYm8c4JqVYOi9iGfkjFpNOp1ffta+qgRcYZ"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""administrator""},{""name"":""newUser"",""password_hash"":""YBXeQ+KOyQLe8gciHkQdO+lwN1lnh9G5BnFWp+BnAGLM2I70"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""management""},{""name"":""guest"",""password_hash"":""RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""administrator""}],""vhosts"":[{""name"":""/""},{""name"":""/2""}],""permissions"":[{""user"":""guest"",""vhost"":""/2"",""configure"":"".*"",""write"":"".*"",""read"":"".*""},{""user"":""guest"",""vhost"":""/"",""configure"":"".*"",""write"":"".*"",""read"":"".*""}],""topic_permissions"":[],""parameters"":[{""value"":{""max-connections"":1000},""vhost"":""/"",""component"":""vhost-limits"",""name"":""limits""},{""value"":{""max-queues"":200},""vhost"":""/2"",""component"":""vhost-limits"",""name"":""limits""},{""value"":{""pattern"":""patt1"",""definition"":{""expires"":10000000000,""max-length"":244,""max-length-bytes"":245,""message-ttl"":45},""priority"":5,""apply-to"":""queues""},""vhost"":""/"",""component"":""operator_policy"",""name"":""policy1""}],""global_parameters"":[{""name"":""cluster_name"",""value"":""rabbit@a12b253c30bd""}],""policies"":[],""queues"":[{""name"":""testQueue"",""vhost"":""/"",""durable"":true,""auto_delete"":false,""arguments"":{}},{""name"":""testQueue2"",""vhost"":""/"",""durable"":true,""auto_delete"":false,""arguments"":{""x-dead-letter-exchange"":""testExchange"",""x-dead-letter-routing-key"":""dead-letter-routing-key"",""x-expires"":10000000000,""x-max-length"":255,""x-max-length-bytes"":256,""x-max-priority"":1,""x-message-ttl"":9,""x-queue-mode"":""lazy""}}],""exchanges"":[{""name"":""testExchange"",""vhost"":""/"",""type"":""direct"",""durable"":true,""auto_delete"":false,""internal"":false,""arguments"":{}},{""name"":""testExchange2"",""vhost"":""/"",""type"":""topic"",""durable"":false,""auto_delete"":false,""internal"":true,""arguments"":{""alternate-exchange"":""testExchange""}}],""bindings"":[{""source"":""testExchange"",""vhost"":""/"",""destination"":""testExchange2"",""destination_type"":""exchange"",""routing_key"":""rkExchange"",""arguments"":{}},{""source"":""testExchange"",""vhost"":""/"",""destination"":""testQueue"",""destination_type"":""queue"",""routing_key"":""testRoutingKey"",""arguments"":{}},{""source"":""testExchange"",""vhost"":""/"",""destination"":""testQueue2"",""destination_type"":""queue"",""routing_key"":""testRoutingKeyBinding"",""arguments"":{}}]}'.
"
Class {
	#name : #RMQRESTParserApiDefinitions,
	#superclass : #RMQRESTParser,
	#category : #'RMQ-Core-Parser'
}

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withBindings: anArray [
	
	| source destination vhostName vhost rkName rk |
	anArray do: [ :aBinding|
	|destType sourceName destinationName element|
		
	destType := (aBinding at: 'destination_type').
	sourceName := (aBinding at: 'source').
	destinationName := (aBinding at: 'destination').
	
	element := aModel entityNamed: (sourceName, '>', destinationName)  withType: RMQBinding
			ifAbsent:[  
				|newBinding |
				source:= aModel entityNamed: sourceName withType: RMQExchange
				ifAbsent:[
					|newExch |
					newExch := RMQExchange new
						exchangeString: sourceName.
					aModel add: newExch.
					newExch
				].
			
				newBinding := RMQBinding new
					destinationType: destType;
					sourceExchange: source.
				source sourceBindings add: newBinding.
				
				newBinding destinationType = 'exchange' ifTrue: [ 
					destination:= aModel entityNamed: destinationName withType: RMQExchange
						ifAbsent:[
							|newExch |
							newExch := RMQExchange new
								exchangeString: destinationName.
							aModel add: newExch.
							newExch
						].
					newBinding destinationQueue: nil.
					newBinding destinationExchange: destination.
					destination destinationBindings add: newBinding.
		 		] ifFalse: [ 
					destination:= aModel entityNamed: destinationName withType: RMQQueue
						ifAbsent:[
							|newQ|
							newQ := RMQQueue new
								queueString: destinationName.
							aModel add: newQ.
							newQ
						].
					newBinding destinationQueue: destination.
					newBinding destinationExchange: nil.
					destination destinationBindings add: newBinding.
		 		].	
				aModel add: newBinding.
				newBinding ].
			
			
		vhostName := (aBinding at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
		element vhost: vhost.
		vhost bindings add: element.



		
		rkName := (aBinding at: 'routing_key').
		rk := aModel entityNamed: rkName withType: RMQRoutingKey
			ifAbsent:[
				|newRK |
				newRK := RMQRoutingKey new
					routingKeyString: rkName.
				aModel add: newRK.
				newRK
			].
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
		
		element := aModel entityNamed: exchangeName withType: RMQExchange
			ifAbsent:[ 
				|newExchange |
				newExchange := RMQExchange new
					exchangeString: (anExchange at: 'name').
				aModel add: newExchange.
				newExchange ].
		element type: (anExchange at: 'type').
		element internal: (anExchange at: 'internal').
		element autoDelete: (anExchange at: 'auto_delete').
		
		vhostName := (anExchange at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
		element vhost: vhost.
		vhost exchanges add: element.
		
		
		element durability:(anExchange at: 'durable').
		
		arg := (anExchange at: 'arguments').
		
		altExchName := (arg at: 'alternate-exchange' ifAbsent:[nil]).
		altExchName ifNotNil:[
			altExch := aModel entityNamed: altExchName withType: RMQExchange
				ifAbsent:[
					|newExch |
					newExch := RMQExchange new
						exchangeString: altExchName.
					aModel add: newExch.
					newExch
				].
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
					aModel
						entityNamed: clusterName
						withType: RMQCluster
						ifAbsent: [ | newCluster |
							newCluster := RMQCluster new clusterString: clusterName.
							aModel add: newCluster.
							newCluster ] ] ]
]

{ #category : #parsing }
RMQRESTParserApiDefinitions class >> populate: aModel withJson: aString [
	| parser rmqObjects   |
	parser := PPParserResource current parserAt: PPJsonParser.
	rmqObjects := parser parse: aString.
	
	self populate: aModel withVhosts: (rmqObjects at: 'vhosts').
	self populate: aModel withParameters: (rmqObjects at: 'parameters').
	self populate: aModel withUsers: (rmqObjects at: 'users').
	self populate: aModel withTopicPermissions: (rmqObjects at: 'topic_permissions').
	self populate: aModel withPermissions: (rmqObjects at: 'permissions').
	self populate: aModel withPolicies: (rmqObjects at: 'policies').
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

	| vhost user permissionTypes |
	anArray
		do: [ :aPermission | 
			| permissionVhostName permissionUserName element |
			permissionUserName := aPermission at: 'user'.
			permissionVhostName := aPermission at: 'vhost'.
			permissionTypes := {(PermissionType configure -> (aPermission at: 'configure')).
			(PermissionType write -> (aPermission at: 'write')).
			(PermissionType read -> (aPermission at: 'read'))}.
			permissionTypes
				do: [ :permissionType | 
					aModel allRMQPermissions
						detect: [ :el | 
							el vhost name = permissionVhostName
								and: [ el user name = permissionUserName and: [ el type = permissionType key ] ] ]
						ifFound: [ :elementFound | element := elementFound ]
						ifNone: [ | newPermission |
							newPermission := RMQPermission new
								type: permissionType key;
								value: permissionType value.
							user := aModel
								entityNamed: permissionUserName
								withType: RMQUser 
								ifAbsent: [ | newUser |
									newUser := RMQUser new userString: permissionUserName.
									aModel add: newUser.
									newUser ].
							newPermission user: user.
							user permissions add: newPermission.
							vhost := aModel
								entityNamed: permissionVhostName
								withType: RMQVHost
								ifAbsent: [ | newVhost |
									newVhost := RMQVHost new vhostString: permissionVhostName.
									aModel add: newVhost.
									newVhost ].
							newPermission vhost: vhost.
							vhost permissions add: newPermission.
							permissionType key permissions add: newPermission.
							aModel add: newPermission.
							element := newPermission ] ] ]
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
		
		element := aModel entityNamed: queueName withType: RMQQueue
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new
					queueString: (aQueue at: 'name').
				aModel add: newQueue.
				newQueue ].
		element autoDelete: (aQueue at: 'auto_delete').
		element durability:(aQueue at: 'durable').
		
		vhostName := (aQueue at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
			deadRK := aModel entityNamed: deadRKName withType: RMQRoutingKey
				ifAbsent:[
					|newRK |
					newRK := RMQRoutingKey new
						routingKeyString: deadRKName.
					aModel add: newRK.
					newRK
				].
			element dead_letter_routing_key: deadRK.
			deadRK queues_for_dead_letter add: element.
		].
	
		deadExchName := (arg at: 'x-dead-letter-exchange' ifAbsent:[nil]).
		deadExchName ifNotNil: [
			deadExch := aModel entityNamed: deadExchName withType: RMQExchange
				ifAbsent:[
					|newExch |
					newExch := RMQExchange new
						exchangeString: deadExchName.
					aModel add: newExch.
					newExch
				].
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
		
		element := aModel entityNamed: userName withType: RMQUser
			ifAbsent:[   
				|newUser |
				newUser := RMQUser new
					userString: (aUser at: 'name').
				aModel add: newUser.
				newUser ].
		element passwordHash: (aUser at: 'password_hash').
		element hashingAlgorithm: (aUser at: 'hashing_algorithm').
		
		
		
		((aUser at: 'tags') substrings: ',') do:[:aRoleString |
			|role|			
			role := aModel entityNamed: aRoleString withType: RMQRole
			ifAbsent:[   
				|newRole |
				newRole := RMQRole new
					tag: (aUser at: 'tags').
				aModel add: newRole.
				newRole ].
			
			(element roles anySatisfy: [ :e | e = role ]) ifFalse: [
			element roles add: role.
				role users add: element
			].
			
		].
	].
]

{ #category : #'internal-parsing' }
RMQRESTParserApiDefinitions class >> populate: aModel withVhosts: anArray [
	anArray do: [ :aVhost|
		| vhostName element |
		
		vhostName := (aVhost at: 'name').
		
		element := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[  
				|newVhost |
				newVhost := RMQVHost new
					vhostString: (aVhost at: 'name').
				aModel add: newVhost.
				newVhost ].
	].
]
