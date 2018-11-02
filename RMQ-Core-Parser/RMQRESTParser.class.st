"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParser populate: model withJson: '{""rabbit_version"":""3.7.8"",""users"":[{""name"":""guest"",""password_hash"":""RgD5L5W9tmsqQBlVt+VciTra/o4TlfiZALWegc0vH8zVb4PI"",""hashing_algorithm"":""rabbit_password_hashing_sha256"",""tags"":""administrator""}],""vhosts"":[{""name"":""/""}],""permissions"":[{""user"":""guest"",""vhost"":""/"",""configure"":"".*"",""write"":"".*"",""read"":"".*""}],""topic_permissions"":[],""parameters"":[],""global_parameters"":[{""name"":""cluster_name"",""value"":""rabbit@a12b253c30bd""}],""policies"":[],""queues"":[{""name"":""testQueue"",""vhost"":""/"",""durable"":true,""auto_delete"":false,""arguments"":{}}],""exchanges"":[{""name"":""testExchange"",""vhost"":""/"",""type"":""direct"",""durable"":true,""auto_delete"":false,""internal"":false,""arguments"":{}}],""bindings"":[{""source"":""testExchange"",""vhost"":""/"",""destination"":""testQueue"",""destination_type"":""queue"",""routing_key"":""testRoutingKey"",""arguments"":{}}]}'.
"
Class {
	#name : #RMQRESTParser,
	#superclass : #Object,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withBindings: anArray [
	
		anArray do: [ :aBinding|
		
		self flag: 'to be finished'.
		"(anExchange at: 'arguments')."
		
	].
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withExchanges: anArray [
	
		anArray do: [ :anExchange|
		| exchangeName element |
		
		exchangeName := (anExchange at: 'name').
		aModel allRMQExchanges
			detect: [ :el | el exchangeString = exchangeName ]
			ifFound: [ :elementFound |
				element := elementFound. ]
			ifNone: [ 
				|newExchange |
				newExchange := RMQExchange new
					exchangeString: (anExchange at: 'name').
				aModel add: newExchange.
				element := newExchange ].
		element type: (anExchange at: 'type').
		element internal: (anExchange at: 'internal').
		element autoDelete: (anExchange at: 'auto_delete').
		element vhost: (anExchange at: 'vhost').
		element durability:(anExchange at: 'durable').
		
		self flag: 'to be finished'.
		"(anExchange at: 'arguments')."
		
	].
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withGlobalParameters: anArray [
		self flag: 'to be finished'.
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withJson: aString [
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
	
	self flag: 'to finish'.
	(rmqObjects at: 'rabbit_version')
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withParameters: anArray [
	self notYetImplemented.
	
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withPermissions: anArray [
	
	"a Dictionary('configure'->'.*' 'read'->'.*' 'user'->'guest' 'vhost'->'/' 'write'->'.*' )"
	anArray do: [ :aPermission|
		| permissionVhost permissionUser element |
		
		permissionUser := (aPermission at: 'user').
		permissionVhost := (aPermission at: 'vhost').
		aModel allRMQPermissions
			detect: [ :el | el attachedVHost = permissionVhost and:[el users = permissionUser] ]
			ifFound: [ :elementFound |
				element := elementFound. ]
			ifNone: [ 
				|newPermission |
				newPermission := RMQPermission new
					attachedVHost: (aPermission at: 'vhost');
					users: (aPermission at: 'user').
					self flag: 'should be finished.'
					";
					type: (aPermission at: 'vhost');
					value: (aPermission at: 'vhost')".
				aModel add: newPermission.
				element := newPermission ].
	].
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withPolicies: anArray [
	self notYetImplemented.
	
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withQueues: anArray [
	"a Dictionary('arguments'->a Dictionary() 'auto_delete'->false 'durable'->true 'name'->'testQueue' 'vhost'->'/' )"

		anArray do: [ :aQueue|
		| queueName element |
		
		queueName := (aQueue at: 'name').
		aModel allRMQQueues
			detect: [ :el | el queueString = queueName ]
			ifFound: [ :elementFound |
				element := elementFound. ]
			ifNone: [ 
				|newQueue |
				newQueue := RMQQueue new
					queueString: (aQueue at: 'name').
				aModel add: newQueue.
				element := newQueue ].
		element autoDelete: (aQueue at: 'auto_delete').
		element vhost: (aQueue at: 'vhost').
		element durability:(aQueue at: 'durable').
		
		self flag: 'to be finished'.
		"(aQueue at: 'arguments')."
		
	].
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withTopicPermissions: anArray [
	self notYetImplemented.
	
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withUsers: anArray [
	anArray do: [ :aUser|
		| userName element role|
		
		userName := (aUser at: 'name').
		aModel allRMQUsers
			detect: [ :el | el userString = userName ]
			ifFound: [ :elementFound |
				element := elementFound. ]
			ifNone: [ 
				|newUser |
				newUser := RMQUser new
					userString: (aUser at: 'name').
				aModel add: newUser.
				element := newUser ].
		element passwordHash: (aUser at: 'password_hash').
		element hashingAlgorithm: (aUser at: 'hashing_algorithm').
		
		
		aModel allRMQRoles
			detect: [ :el | el tag = (aUser at: 'tags') ]
			ifFound: [ :elementFound |
				role := elementFound. ]
			ifNone: [ 
				|newRole |
				newRole := RMQRole new
					tag: (aUser at: 'tags').
				aModel add: newRole.
				role := newRole ].
		
		element roles add: role.
		role users add: element.
	].
]

{ #category : #parsing }
RMQRESTParser class >> populate: aModel withVhosts: anArray [
	anArray do: [ :aVhost|
		| vhostName element |
		
		vhostName := (aVhost at: 'name').
		aModel allRMQUsers
			detect: [ :el | el userString = vhostName ]
			ifFound: [ :elementFound |
				element := elementFound. ]
			ifNone: [ 
				|newVhost |
				newVhost := RMQVHost new
					vhostString: (aVhost at: 'name').
				aModel add: newVhost.
				element := newVhost ].
	].
]
