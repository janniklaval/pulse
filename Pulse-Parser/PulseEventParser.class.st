"
aim: consume events queues and  popolate creation and deletion dates 
"
Class {
	#name : #PulseEventParser,
	#superclass : #PulseParser,
	#classInstVars : [
		'model'
	],
	#category : #'Pulse-Parser'
}

{ #category : #parsing }
PulseEventParser >> populate: aModel withBindingCreated: aDictionnary at: timestamp [
	"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name, vhost"

	"todo : set the arguments"

	| bindingObject source destination routingKey destType destinationName newBinding |
	destType := (aDictionnary at: 'destination_kind')
		trimLeft: [ :e | e = '"' ]
		right: [ :e | e = '"' ].
	sourceName := (aDictionnary at: 'source_name')
		trimLeft: [ :e | e = '"' ]
		right: [ :e | e = '"' ].
	destinationName := (aDictionnary at: 'destination_name')
		trimLeft: [ :e | e = '"' ]
		right: [ :e | e = '"' ].

	"Transcript cr; nextPutAll: 'destType: ', destType, ' sourceName: ' ,sourceName, ' destinationName: ', destinationName ; flush."
	source := aModel
		selectOrAddEntityNamed: sourceName
		withType: PulseExchange
		sourceName: self sourceName.
	destType = 'exchange'
		ifTrue: [ newBinding := PulseBindingWithExchange new.
			destination := aModel
				selectOrAddEntityNamed: destinationName
				withType: PulseExchange
				sourceName: self sourceName ]
		ifFalse: [ newBinding := PulseBindingWithQueue new.
			destination := aModel
				selectOrAddEntityNamed: destinationName
				withType: PulseQueue
				sourceName: self sourceName ].
	newBinding
		source: source;
		destination: destination;
		mooseModel: aModel.


	"if the binding does not exist, create it"
	aModel allPulseBindings
		detect: [ :el | el source = source and: [ el destination = destination ] ]
		ifFound: [ :elementFound | bindingObject := elementFound ]
		ifNone: [ destination destinationBindings add: newBinding.
			source sourceBindings add: newBinding.
			aModel add: newBinding.
			bindingObject := newBinding ].
	bindingObject creationDate: timestamp.
	routingKey := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'routing_key')
		withType: PulseRoutingKey
		sourceName: self sourceName.
	bindingObject routingKey: routingKey.
	routingKey binding: bindingObject
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withBindingDeleted: aDictionnary at: timestamp [
"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name"
"todo : add test if the criteria are not nil
        set the arguments"
	
	| bindingObject destType source destination destinationName routingKeyName routingKey |
		
	destType := (aDictionnary at: 'destination_kind').
	sourceName := (aDictionnary at: 'source_name').
	destinationName := (aDictionnary at: 'destination_name').
	routingKeyName := (aDictionnary at:'routing_key' ).
	
	"if the binding does not exist, create it"
	
	source := aModel entityNamed: sourceName withType: PulseExchange.
		
	destType = 'exchange' ifTrue: [ 
		destination:= aModel entityNamed: destinationName withType: PulseExchange.
	] ifFalse: [ 
		destination:= aModel entityNamed: destinationName withType: PulseQueue.
	].
   
   routingKey := aModel entityNamed: routingKeyName withType: PulseRoutingKey.
	
	 aModel allPulseBindings
		detect: [ :element | element source = source and: [ element destination = destination  and: [ element routingKey = routingKey ] ]  ]
		ifFound: [ :elementFound |  bindingObject := elementFound ].
		
	bindingObject ifNotNil:[ bindingObject deletionDate: timestamp. ]
		

]

{ #category : #parsing }
PulseEventParser >> populate: aModel withChannelClosed: aDictionnary at: timestamp [
   "a Dictionary( pid )"

   " pid in the definition of the channel to corelate with the created channel"
  	| channelObject |

	   aModel allPulseChannels
		detect: [ :element | element pid = (aDictionnary at: 'pid') ]
		ifFound: [ :elementFound | 
			channelObject := elementFound ].
			
		channelObject ifNotNil: [ channelObject closingDate: timestamp ]. 
	
			



]

{ #category : #parsing }
PulseEventParser >> populate: aModel withChannelCreated: aDictionnary at: timestamp [
	"a Dictionary( vhost, number, name, connection(pid), pid, user  )"

	"todo : Pb : qu'est ce qui identifie une channel, le pid semble unique  "

	"todo : set the related connection's pid "

	| channelObject vhost user connection |
	channelObject := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseChannel
		sourceName: self sourceName.
	channelObject creationDate: timestamp.
	channelObject pid: (aDictionnary at: 'pid').
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	channelObject vhost: vhost.
	vhost channels add: channelObject.
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'user')
		withType: PulseUser
		sourceName: self sourceName.
	channelObject user: user.
	user usedChannels add: channelObject.
	user vhosts add: vhost.

	"if the pid is unique"
	aModel allPulseConnections
		detect: [ :element | element pid = (aDictionnary at: 'connection') ]
		ifFound: [ :elementFound | connection := elementFound ]
		ifNone: [  ].	"// créer la connection ??"
	channelObject connection: connection
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withConnectionClosed: aDictionnary at: timestamp [
 "a Dictionary( pid )"

 " todo : add pid in the definition of the channel to corelate with the created channel"

     | connectionObject  |
     
     aModel allPulseConnections
	  detect: [ :element | element pid = (aDictionnary at: 'pid') ]
	  ifFound: [ :elementFound | 
			connectionObject := elementFound ].
		
	  connectionObject ifNotNil: [connectionObject closingDate: timestamp]. 
		
	  
		
	
			



]

{ #category : #parsing }
PulseEventParser >> populate: aModel withConnectionCreated: aDictionnary at: timestamp [
	"when connection is of network type : 
a Dictionary( timestamp_in_ms:	1544109134439, type:	network, pid:	<rabbit@fceed0d94b94.3.8698.0>, name:	172.17.0.1:56246 -> 172.17.0.2:5672, port:	5672, peer_port:	56246, host:	{0,0,0,0,0,65535,44049,2}, peer_host:	{0,0,0,0,0,65535,44049,1}, ssl:	false, peer_cert_subject: , peer_cert_issuer:	, peer_cert_validity:	
auth_mechanism:	PLAIN, ssl_protocol:, ssl_key_exchange:, ssl_cipher: ssl_hash:, protocol:	{0,9,1} user:	guest, vhost:	/, timeout:	60, frame_max:	131072, channel_max:	0, client_properties:	{<<""product"">>,longstr,<<""RabbitMQ Smalltalk"">>} connected_at:	1544109134432)

when connection is of direct type :
aDictionnary (timestamp_in_ms:	1544196873787, pid:	<rabbit@fceed0d94b94.3.12113.0>, protocol:	{'Direct',{0,9,1}}, host:	unknown, port:	unknown, name:	<rabbit@fceed0d94b94.3.12113.0>, peer_host:	unknown, peer_port:	unknown, user:	guest, vhost:	/, client_properties:	, type:	direct, connected_at:	1544196873787)"

	| connectionType connectionObject connectionName user vhost |
	connectionName := aDictionnary at: 'name'.
	connectionType := aDictionnary at: 'type'.
	connectionObject := aModel
		entityNamed: connectionName
		withType: PulseConnection
		ifAbsent: [ | newConnection |
			newConnection := PulseConnection new
				pulseName: connectionName;
				mooseModel: aModel.
			newConnection pid: (aDictionnary at: 'pid').
			newConnection connectionType: (aDictionnary at: 'type').
			newConnection connectedAt: (aDictionnary at: 'connected_at').
			newConnection host: (aDictionnary at: 'host').
			newConnection port: (aDictionnary at: 'port').
			newConnection peerHost: (aDictionnary at: 'peer_host').
			newConnection peerPort: (aDictionnary at: 'peer_port').
			newConnection protocol: (aDictionnary at: 'protocol').
			connectionType = 'network'
				ifTrue: [ newConnection ssl: (aDictionnary at: 'ssl').
					(aDictionnary at: 'auth_mechanism') = 'plain'
						ifTrue: [ newConnection authMechanism: PulseAuthMechanism plain.
							newConnection authMechanism connections add: newConnection ].
					(aDictionnary at: 'auth_mechanism') = 'amqPlain'
						ifTrue: [ newConnection authMechanism: PulseAuthMechanism amqPlain.
							newConnection authMechanism connections add: newConnection ].
					(aDictionnary at: 'auth_mechanism') = 'rabbit_cr_demo'
						ifTrue: [ newConnection authMechanism: PulseAuthMechanism rabbit_cr_demo.
							newConnection authMechanism connections add: newConnection ].
					newConnection ssl = true
						ifTrue: [ newConnection sslProtocol: (aDictionnary at: 'ssl_protocol').
							newConnection sslHash: (aDictionnary at: 'ssl_hash') ] ].
			aModel add: newConnection.
			newConnection ].
	connectionObject creationDate: timestamp.
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	(vhost connections anySatisfy: [ :e | e = connectionObject ])
		ifFalse: [ vhost connections add: connectionObject.
			connectionObject vhost: vhost ].
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'user')
		withType: PulseUser
		sourceName: self sourceName.
	(user usedConnections anySatisfy: [ :e | e = connectionObject ])
		ifFalse: [ user usedConnections add: connectionObject.
			user vhosts add: vhost.
			connectionObject user: user ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withConsumerCreated: aDictionnary at: timestamp [
	"aDictionnary ( vhost, consumer_tag, channel(pid), exclusive, arguments, ack_required, queue)"

	| componentObject vhost channel relatedQueue |
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	"to do: change to ConsumerProcess"
	"// find the consumer with the right channel and vhost"
	aModel allPulseConsumerProcesses
		detect: [ :element | 
			element consumerTag = (aDictionnary at: 'consumer_tag')
				and: [ element subscribedChannels
						anySatisfy:
							[ :el | el pid = (aDictionnary at: 'channel') and: [ el vhost = vhost ] ] ] ]
		ifFound: [ :elementFound | componentObject := elementFound ]
		ifNone: [ componentObject := PulseConsumerProcess new.
			componentObject consumerTag: (aDictionnary at: 'consumer_tag').
			componentObject mooseModel: aModel.
			aModel add: componentObject ].
	componentObject creationDate: timestamp.
	componentObject exclusive: (aDictionnary at: 'exclusive').
	componentObject ackRequired: (aDictionnary at: 'ack_required').
	relatedQueue := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'queue')
		withType: PulseQueue
		sourceName: self sourceName.
	aModel allPulseChannels
		detect:
			[ :el | el pid = (aDictionnary at: 'channel') and: [ el vhost = vhost ] ]
		ifFound: [ :elementFound | channel := elementFound ]
		ifNone: [ channel := PulseChannel new.
			channel consumerProcess: componentObject.
			channel pid: (aDictionnary at: 'channel').
			channel consumedQueues add: relatedQueue.
			channel vhost: vhost.
			channel mooseModel: aModel.
			aModel add: channel ].

	"trouver la channel et la lier au consumer sinon la créer, set son subscribedComponent, pid, consumedQueues et vhost"
	componentObject subscribedChannels add: channel
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withConsumerDeleted: aDictionnary at: timestamp [
    "aDictionnary ( vhost, consumer_tag, channel, queue)"
    "to do : create the consumer component from the module id information in the queue ? "
	
		| componentObject  vhost |

		vhost := aModel entityNamed: (aDictionnary at: 'vhost') withType: PulseVHost.
		
	   aModel allPulseConsumerProcesses
		detect: [ :element | element consumerTag = (aDictionnary at: 'consumer_tag') 
			"and the channels of the consumer are on the right vhost"
			and: [ element subscribedChannels anySatisfy: [ :el | el pid = (aDictionnary at: 'channel') and: [ el  vhost = vhost] ] ]				
			 ]
		ifFound: [ :elementFound | 
			componentObject := elementFound ].
			
		componentObject ifNotNil: [ componentObject deletionDate: timestamp ]. 
	



]

{ #category : #parsing }
PulseEventParser >> populate: aModel withExchangeCreated: aDictionnary at: timestamp [
	"a Dictionary( 'durable'->true 'vhost'->'/' 'internal'->false 'auto_delete'->false  'name'->'exchangeName' 'arguments'->a Dictionary() 'type'->topic 'policy'->string )"

	| exchangeObject vhost args altExchName altExch exchangeName |
	"if the exchange does not exist, create it"
	exchangeName := aDictionnary at: 'name'.
	exchangeObject := aModel
		selectOrAddEntityNamed: exchangeName
		withType: PulseExchange
		sourceName: self sourceName.

	"set topicId"
	((exchangeName substrings: '.') at: 1 = 'pubsub')
		ifTrue: [ exchangeObject topicID: ((exchangeName substrings: '.') at: 3) ].
	exchangeObject creationDate: timestamp.
	(aDictionnary at: 'type') = 'topic'
		ifTrue: [ exchangeObject type: PulseExchangeType topic.
			exchangeObject type exchanges add: exchangeObject ].
	(aDictionnary at: 'type') = 'direct'
		ifTrue: [ exchangeObject type: PulseExchangeType direct.
			exchangeObject type exchanges add: exchangeObject ].
	(aDictionnary at: 'type') = 'fanout'
		ifTrue: [ exchangeObject type: PulseExchangeType fanout.
			exchangeObject type exchanges add: exchangeObject ].
	(aDictionnary at: 'type') = 'headers'
		ifTrue: [ exchangeObject type: PulseExchangeType headers.
			exchangeObject type exchanges add: exchangeObject ].
	exchangeObject internal: (aDictionnary at: 'internal').
	exchangeObject autoDelete: (aDictionnary at: 'auto_delete').
	(aDictionnary at: 'durable') = 1
		ifTrue: [ exchangeObject durability: true.
			exchangeObject durability exchanges add: exchangeObject ].
	(aDictionnary at: 'durable') = 0
		ifTrue: [ exchangeObject durability: false.
			exchangeObject durability exchanges add: exchangeObject ].
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	exchangeObject vhost: vhost.
	vhost exchanges add: exchangeObject.
	args := aDictionnary at: 'arguments'.
	args isEmpty
		ifFalse: [ altExchName := args at: 'alternate-exchange' ifAbsent: [ nil ].
			altExchName
				ifNotNil: [ altExch := aModel
						selectOrAddEntityNamed: altExchName
						withType: PulseExchange
						sourceName: self sourceName.
					exchangeObject my_alternate_exchange: altExch.
					altExch alternate_exchange_for add: exchangeObject ] ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withExchangeDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'exchangename' )"

      | exchangeObject exchangeName vhostName |
		
		exchangeName := (aDictionnary at: 'name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
		vhostName := (aDictionnary at: 'vhost') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ]. 
		"exchangeObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQExchange.""ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		"avec detect"
		 aModel allPulseExchanges detect:[ :el | el pulseName =  exchangeName and:[ el vhost pulseName = vhostName] ]
		                        ifFound: [ :elementFound | exchangeObject := elementFound ].  
		
		exchangeObject ifNotNil: [ (exchangeObject vhost name = vhostName) ifTrue: [ exchangeObject deletionDate: timestamp. ] ]
	
			
		
		
	
			



]

{ #category : #parsing }
PulseEventParser >> populate: aModel withPermissionCreated: aDictionnary at: timestamp [
	"aDictionnary : timestamp_in_ms:	1543851859334 user:	testcreation vhost:	/ configure:	.* write:	.* read:	.*"

	"todo : set parameters "

	" along with permission, create user and vhost if they do not exist "

	| permissionObject user userName vhost vhostName configureValue writeValue readValue |
	userName := aDictionnary at: 'user'.
	vhostName := aDictionnary at: 'vhost'.
	configureValue := aDictionnary at: 'configure'.
	writeValue := aDictionnary at: 'write'.
	readValue := aDictionnary at: 'read'.

	"add the new permission to the model if it doest not exist"
	aModel allPulsePermissions
		detect: [ :el | 
			el vhost pulseName = vhostName
				and: [ el user pulseName = userName
						and: [ el configureValue = configureValue
								and: [ el writeValue = writeValue and: [ el readValue = readValue ] ] ] ] ]
		ifFound: [ :elementFound | permissionObject := elementFound ]
		ifNone: [ permissionObject := PulsePermission new.
			permissionObject configureValue: configureValue.
			permissionObject writeValue: writeValue.
			permissionObject readValue: readValue.
			permissionObject mooseModel: aModel.

			"add the vhost to the model if it doest not exist"
			vhost := aModel
				selectOrAddEntityNamed: vhostName
				withType: PulseVHost
				sourceName: self sourceName.
			permissionObject vhost: vhost.
			vhost permissions add: permissionObject.

			"add the user to the model if it doest not exist"
			user := aModel
				selectOrAddEntityNamed: userName
				withType: PulseUser
				sourceName: self sourceName.
			permissionObject user: user.
			user permissions add: permissionObject.
			user vhosts add: vhost.
			vhost users add: user.
			aModel add: permissionObject ].
	permissionObject creationDate: timestamp
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withPermissionDeleted: aDictionnary at: timestamp [
" aDictionnary ex :  timestamp_in_ms:	1543853881862 user:	testuser vhost:	/"
 | permissionObject  userName  vhostName |
		
		userName := aDictionnary at: 'user'.
		vhostName := aDictionnary at: 'vhost'.		
		
		"a user has only one permission per vhost at a time"
			aModel allPulsePermissions
					detect: [ :el | el vhost pulseName = vhostName and: [ el user name = userName  ] ]
						ifFound: [ :elementFound | permissionObject := elementFound ].
					
				permissionObject deletionDate: timestamp. 
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withQueueCreated: aDictionnary at: timestamp [
	"a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

	| queueName queueObject vhost arguments |
	queueName := (aDictionnary at: 'name')
		trimLeft: [ :e | e = '"' ]
		right: [ :e | e = '"' ].

	"if the queue does not exist, create it"
	queueObject := aModel
		selectOrAddEntityNamed: queueName
		withType: PulseQueue
		sourceName: self sourceName.	"ici on peut avoir une liste !"
	queueObject creationDate: timestamp.
	queueObject autoDelete: (aDictionnary at: 'auto_delete').
	queueObject durability: (aDictionnary at: 'durable').
	queueObject exclusive: (aDictionnary at: 'exclusive').

	"create the Vhost if it does not exist and link it to the queue"
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	queueObject vhost: vhost.
	vhost queues add: queueObject.
	arguments := aDictionnary at: 'arguments'.
	arguments isEmpty
		ifFalse: [ queueObject
				expiresAfter: (arguments at: 'x-expires' ifAbsent: [ nil ]);
				maxLength: (arguments at: 'x-max-length' ifAbsent: [ nil ]);
				maxLengthBytes: (arguments at: 'x-max-length-bytes' ifAbsent: [ nil ]);
				maxPriority: (arguments at: 'x-max-priority' ifAbsent: [ nil ]);
				messageTTL: (arguments at: 'x-message-ttl' ifAbsent: [ nil ]) ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withQueueDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'Queue' )"

      |queueObject vhostName queueName |
		
      queueName := (aDictionnary at: 'name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
		vhostName := (aDictionnary at: 'vhost') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ]. 
		
		aModel allPulseQueues detect:[ :el | el pulseName = queueName and:[ el vhost pulseName =  vhostName] ]
		                        ifFound: [ :elementFound | queueObject := elementFound ].  
		
		queueObject ifNotNil:[ (queueObject vhost pulseName = vhostName) ifTrue: [ queueObject deletionDate: timestamp ]]
	
			
		
		
	
			



]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserAuthenticationFailed: aDictionnary at: timestamp [
	" timestamp_in_ms:	1544442360655,
connection_type:	network
name:	guest
host:	{0,0,0,0,0,65535,44049,2}
connection_name:	172.17.0.1:51444 -> 172.17.0.2:5672
peer_host:	{0,0,0,0,0,65535,44049,1}
peer_port:	51444
protocol:	{0,9,1}
auth_mechanism:	PLAIN
ssl:	false
error:	117...   // the error is in ascii"

	| authentificationObject user connection connectionName |
	"// create a new authentification object , link the user, the latter is created if it does not exist"
	authentificationObject := PulseAuthentification new.
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseUser
		sourceName: self sourceName.
	authentificationObject user: user.
	user authentifications add: authentificationObject.

	"set the authentification state"
	authentificationObject success: false.
	authentificationObject failureError: (aDictionnary at: 'error').
	authentificationObject timestamp: timestamp.
	authentificationObject mooseModel: aModel.
	aModel add: authentificationObject.

	"if the connection is of network type create the connection and link it to the user that authentificates"
	(aDictionnary at: 'connection_type') = 'network'
		ifTrue: [ connectionName := aDictionnary at: 'connection_name'.
			connection := aModel
				entityNamed: connectionName
				withType: PulseConnection
				ifAbsent: [ | newConnection |
					newConnection := PulseConnection new
						pulseName: connectionName;
						mooseModel: aModel.
					newConnection
						connectionType: (aDictionnary at: 'connection_type').
					"connection // set the authMechanism"
					newConnection host: (aDictionnary at: 'host').
					newConnection peerHost: (aDictionnary at: 'peer_host').
					newConnection peerPort: (aDictionnary at: 'peer_port').
					newConnection protocol: (aDictionnary at: 'protocol').
					newConnection ssl: (aDictionnary at: 'ssl').
					aModel add: newConnection.
					newConnection ].
			(user usedConnections anySatisfy: [ :e | e = connection ])
				ifFalse: [ "??"
					user usedConnections add: connection.
					connection user: user ] ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserAuthenticationSucceeded: aDictionnary at: timestamp [
	" according to the type of the connection the dictionnary of headers is different : 
connection_type:	network : 
aDictionnary ( auth_mechanism:	PLAIN, connection_name:	10.238.28.3:40024 -> 10.238.28.5:5672, connection_type:	network, host:	{0,0,0,0,0,65535,2798,7173}, name:	bus-consolesaas, peer_host:	{0,0,0,0,0,65535,2798,7171}, peer_port:	40024, protocol:	{0,9,1}, ssl:	false, timestamp_in_ms:	1528449144710)
connection_type: direct	: ()
aDictionnary (connection_type:	direct, name:	admin, timestamp_in_ms:	1528454354351)"

	| authentificationObject user connection connectionName |
	"// create a new authentification object , link the user, the latter is created if it does not exist"
	authentificationObject := PulseAuthentification new.
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseUser
		sourceName: self sourceName.
	authentificationObject user: user.
	user authentifications add: authentificationObject.

	"set the authentification state"
	authentificationObject success: true.
	authentificationObject timestamp: timestamp.
	authentificationObject mooseModel: aModel.
	aModel add: authentificationObject.

	"if the connection is of network type create the connection and link it to the user that authentificates"
	(aDictionnary at: 'connection_type') = 'network'
		ifTrue: [ connectionName := aDictionnary at: 'connection_name'.
			connection := aModel
				entityNamed: connectionName
				withType: PulseConnection
				ifAbsent: [ | newConnection |
					newConnection := PulseConnection new
						pulseName: connectionName;
						mooseModel: aModel.
					newConnection
						connectionType: (aDictionnary at: 'connection_type').
					"connection // set the authMechanism"
					newConnection host: (aDictionnary at: 'host').
					newConnection peerHost: (aDictionnary at: 'peer_host').
					newConnection peerPort: (aDictionnary at: 'peer_port').
					newConnection protocol: (aDictionnary at: 'protocol').
					newConnection ssl: (aDictionnary at: 'ssl').
					aModel add: newConnection.
					newConnection ].
			(user usedConnections anySatisfy: [ :e | e = connection ])
				ifFalse: [ "??"
					user usedConnections add: connection.
					connection user: user ] ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserCreated: aDictionnary at: timestamp [
	" aDictionnary example: timestamp_in_ms:	1543851766334 name:	testcreation"

	| userObject |
	userObject := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseUser
		sourceName: self sourceName.
	userObject creationDate: timestamp
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserDeleted: aDictionnary at: timestamp [
  " aDictionnary example: timestamp_in_ms:	1543851766334 name:	testcreation"

		| userObject |
		
		userObject := aModel entityNamed: (aDictionnary at: 'name') withType: PulseUser.
		userObject ifNotNil: [ userObject deletionDate: timestamp. ]
	
		
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserPasswordChanged: aDictionnary at: timestamp [
"aDictionnary (name)"
  | userObject |
		
		userObject := aModel entityNamed: (aDictionnary at: 'name') withType: PulseUser.
		userObject ifNotNil: [ userObject passwordChangingDate:  timestamp. ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserPasswordCleared: aDictionnary at: timestamp [
 "aDictionnay (timestamp_in_ms:	1544440878584, name:	testtest"
  | UserObject |
		
		UserObject := aModel entityNamed: (aDictionnary at: 'name') withType: PulseUser.
		UserObject ifNotNil: [ UserObject passwordClearingDate:  timestamp. ] 
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withUserTagsSet: aDictionnary at: timestamp [
	" to know : event raised when a tag is set in the creation and the apdate of the use"

	" args are separated by a ';' "

	" in RabbitMQ 3.7.4  aDictionnary (name: test, tags:	management; other , timestamp_in_ms:	1544435291495, user_who_performed_action:	admin)"

	" in RabbitMQ 3.6.14 aDictionnary (name: test, tags:	management; other , timestamp_in_ms:	1544435291495)"

	| user |
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseUser
		sourceName: self sourceName.
	((aDictionnary at: 'tags') substrings: ';')
		do: [ :aTagString | 
			| roleObject |
			roleObject := aModel
				entityNamed: aTagString
				withType: PulseRole
				ifAbsent: [ | newRole |
					newRole := PulseRole new
						mooseModel: aModel;
						settingDate: timestamp.
					aTagString = 'administrator'
						ifTrue: [ newRole tag: PulseTag administrator.
							newRole tag roles add: newRole ].
					aTagString = 'management'
						ifTrue: [ newRole tag: PulseTag management.
							newRole tag roles add: newRole ].
					aTagString = 'monitoring'
						ifTrue: [ newRole tag: PulseTag monitoring.
							newRole tag roles add: newRole ].
					aTagString = 'policymaker'
						ifTrue: [ newRole tag: PulseTag policymaker.
							newRole tag roles add: newRole ].
					aTagString = 'none'
						ifTrue: [ newRole tag: PulseTag none.
							newRole tag roles add: newRole ].
					(aTagString = 'administrator'
						or: [ aTagString = 'management'
								or: [ aTagString = 'monitoring'
										or: [ aTagString = 'policymaker' or: [ aTagString = 'none' ] ] ] ])
						ifFalse: [ newRole tag: (PulseTag new pulseState: aTagString) ].
					aModel add: newRole.
					newRole ].
			(user roles anySatisfy: [ :e | e = roleObject ])
				ifFalse: [ user roles add: roleObject.
					roleObject user: user ] ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withVhostCreated: aDictionnary at: timestamp [
	"a Dictionary( 	timestamp_in_ms:	1543854933856, name:	smalltalk, tracing:	false )"

	| vhostObject |
	vhostObject := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'name')
		withType: PulseVHost
		sourceName: self sourceName.
	vhostObject ifNotNil: [ vhostObject creationDate: timestamp ]
]

{ #category : #parsing }
PulseEventParser >> populate: aModel withVhostDeleted: aDictionnary at: timestamp [
 "timestamp_in_ms:	1544113907521, name:	testtest"
    | vhostObject |
		
		"vhostObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQVHost."
		
	  aModel allPulseVHosts
					detect: [ :el | el pulseName = (aDictionnary at: 'name')  ]
						ifFound: [ :elementFound | vhostObject := elementFound ]. 
						
		vhostObject ifNotNil: [ vhostObject deletionDate: timestamp. ]
	
]