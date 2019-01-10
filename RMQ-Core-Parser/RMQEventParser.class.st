"
aim: consume events queues and  popolate creation and deletion dates 
"
Class {
	#name : #RMQEventParser,
	#superclass : #Object,
	#classInstVars : [
		'model'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQEventParser >> populate: aModel withBindingCreated: aDictionnary at: timestamp [
"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name"
"todo : set the arguments"
	
	| bindingObject source destination routingKey destType sourceName destinationName newBinding |
		
	destType := (aDictionnary at: 'destination_kind') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
	sourceName := (aDictionnary at: 'source_name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
	destinationName := (aDictionnary at: 'destination_name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
	
	"Transcript cr; nextPutAll: 'destType: ', destType, ' sourceName: ' ,sourceName, ' destinationName: ', destinationName ; flush."
	
	
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
	
		
	"if the binding does not exist, create it"
	
	bindingObject := aModel allRMQBindings
		detect: [ :el | el source = source and: [ el destination = destination ] ]
		ifFound: [ :elementFound | 
			elementFound ]
		ifNone: [  
				destination destinationBindings add: newBinding.
				source sourceBindings add: newBinding.
				aModel add: newBinding.
				newBinding ].
		
		bindingObject creationDate: timestamp. 

		routingKey := aModel selectOrAddEntityNamed: (aDictionnary at: 'routing_key') withType: RMQRoutingKey.
		bindingObject routingKey: routingKey.
		routingKey binding: bindingObject.
	


				
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withBindingDeleted: aDictionnary at: timestamp [
"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name"
"todo : add test if the criteria are not nil
        set the arguments"
	
	| bindingObject destType source sourceName destination destinationName routingKeyName routingKey |
		
	destType := (aDictionnary at: 'destination_kind').
	sourceName := (aDictionnary at: 'source_name').
	destinationName := (aDictionnary at: 'destination_name').
	routingKeyName := (aDictionnary at:'routing_key' ).
	
	"if the binding does not exist, create it"
	
	source := aModel entityNamed: sourceName withType: RMQExchange.
		
	destType = 'exchange' ifTrue: [ 
		destination:= aModel entityNamed: destinationName withType: RMQExchange.
	] ifFalse: [ 
		destination:= aModel entityNamed: destinationName withType: RMQQueue.
	].
   
   routingKey := aModel entityNamed: routingKeyName withType: RMQRoutingKey.
	
	 aModel allRMQBindings
		detect: [ :element | element source = source and: [ element destination = destination  and: [ element routingKey = routingKey ] ]  ]
		ifFound: [ :elementFound |  bindingObject := elementFound ].
		
	bindingObject ifNotNil:[ bindingObject deletionDate: timestamp. ]
		

]

{ #category : #parsing }
RMQEventParser >> populate: aModel withChannelClosed: aDictionnary at: timestamp [
   "a Dictionary( pid )"

   " pid in the definition of the channel to corelate with the created channel"
  	| channelObject |

	   aModel allRMQChannels
		detect: [ :element | element pid = (aDictionnary at: 'pid') ]
		ifFound: [ :elementFound | 
			channelObject := elementFound ].
			
		channelObject ifNotNil: [ channelObject closingDate: timestamp ]. 
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withChannelCreated: aDictionnary at: timestamp [
   "a Dictionary( vhost, number, name, connection(pid), pid, user  )"

   "todo : Pb : qu'est ce qui identifie une channel, le pid semble unique  "
   "todo : set the related connection's pid "
      | channelObject vhost user connection|
      
		channelObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQChannel.
		
		channelObject creationDate: timestamp.
		channelObject pid: (aDictionnary at: 'pid').
		
		user := aModel selectOrAddEntityNamed: (aDictionnary at: 'user') withType: RMQUser.
		channelObject user: user.
		user usedChannels add: channelObject.

		vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		channelObject vhost: vhost.
		vhost channels add: channelObject.

     "if the pid is unique"
      aModel allRMQConnections
					detect: [ :element | element pid = (aDictionnary at: 'connection') ]
					ifFound: [ :elementFound | 
			                 connection := elementFound ]
		          ifNone: [  ]. "// créer la connection ??"
		channelObject connection: connection. 
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConnectionClosed: aDictionnary at: timestamp [
 "a Dictionary( pid )"

 " todo : add pid in the definition of the channel to corelate with the created channel"

     | connectionObject  |
     
     aModel allRMQConnections
	  detect: [ :element | element pid = (aDictionnary at: 'pid') ]
	  ifFound: [ :elementFound | 
			connectionObject := elementFound ].
		
	  connectionObject ifNotNil: [connectionObject closingDate: timestamp]. 
		
	  
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConnectionCreated: aDictionnary at: timestamp [
"when connection is of network type : 
a Dictionary( timestamp_in_ms:	1544109134439, type:	network, pid:	<rabbit@fceed0d94b94.3.8698.0>, name:	172.17.0.1:56246 -> 172.17.0.2:5672, port:	5672, peer_port:	56246, host:	{0,0,0,0,0,65535,44049,2}, peer_host:	{0,0,0,0,0,65535,44049,1}, ssl:	false, peer_cert_subject: , peer_cert_issuer:	, peer_cert_validity:	
auth_mechanism:	PLAIN, ssl_protocol:, ssl_key_exchange:, ssl_cipher: ssl_hash:, protocol:	{0,9,1} user:	guest, vhost:	/, timeout:	60, frame_max:	131072, channel_max:	0, client_properties:	{<<""product"">>,longstr,<<""RabbitMQ Smalltalk"">>} connected_at:	1544109134432)

when connection is of direct type :
aDictionnary (timestamp_in_ms:	1544196873787, pid:	<rabbit@fceed0d94b94.3.12113.0>, protocol:	{'Direct',{0,9,1}}, host:	unknown, port:	unknown, name:	<rabbit@fceed0d94b94.3.12113.0>, peer_host:	unknown, peer_port:	unknown, user:	guest, vhost:	/, client_properties:	, type:	direct, connected_at:	1544196873787)"
	| connectionType connectionObject connectionName user vhost |
	
	connectionName := (aDictionnary at: 'name').
	connectionType := (aDictionnary at: 'type').
	"create connection if needed according to the connection type "
		
		connectionObject := aModel entityNamed: connectionName withType: RMQConnection
	   ifAbsent:[ 
		| newConnection |
				newConnection := RMQConnection new
					pulseName: connectionName.
				
	  newConnection pid: (aDictionnary at: 'pid').
	  newConnection connectionType: (aDictionnary at: 'type').
	  newConnection connectedAt: (aDictionnary at: 'connected_at').
	  newConnection host: (aDictionnary at: 'host').
	  newConnection port: (aDictionnary at: 'port').
	  newConnection peerHost: (aDictionnary at: 'peer_host').
	  newConnection peerPort: (aDictionnary at: 'peer_port').
	  newConnection protocol: (aDictionnary at: 'protocol').
	  
	  
	  (connectionType = 'network') ifTrue: [ 
		 "todo: set the authMechanism"
		newConnection ssl: (aDictionnary at: 'ssl'). 
		(newConnection ssl = True ) ifTrue:[
		newConnection sslProtocol: (aDictionnary at: 'ssl_protocol').
		newConnection sslHash: (aDictionnary at: 'ssl_hash')].
	  ].
	  
	  aModel add: newConnection.
				newConnection 
	  ].

    "set the creation timestamp"
    connectionObject creationDate: timestamp. 
    
    "create user if needed and link to  user "
    user := aModel selectOrAddEntityNamed: (aDictionnary at: 'user') withType: RMQUser.
	 (user usedConnections anySatisfy: [ :e | e = connectionObject ]) ifFalse: [ 
			  user usedConnections add: connectionObject.
			  connectionObject user: user 
			].
		
	 "create user if needed and link to  user "
	 vhost :=	aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
    (vhost connections anySatisfy: [ :e | e = connectionObject ]) ifFalse: [
			  vhost connections add: connectionObject.
			  connectionObject vhost: vhost 
			].
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConsumerCreated: aDictionnary at: timestamp [
   "aDictionnary ( vhost, consumer_tag, channel(pid), exclusive, arguments, ack_required, queue)"

      | componentObject newComponent  vhost channel newChannel relatedQueue |

		vhost:= aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		
		"// find the consumer with the right channel and vhost"
	   componentObject := aModel allRMQComponents
		detect: [ :element | element consumerTag = (aDictionnary at: 'consumer_tag') 
			and: [ element subscribedChannels anySatisfy: [ :el | el pid = (aDictionnary at: 'channel') and: [ el  vhost = vhost] ] ]		
			 ]
		ifFound: [ :elementFound | 
			elementFound ]
		ifNone: [  
            newComponent := RMQComponent new.
            newComponent consumerTag: (aDictionnary at: 'consumer_tag').
				aModel add: newComponent.
				newComponent ].
			
		componentObject creationDate: timestamp. 
		
		relatedQueue := aModel selectOrAddEntityNamed: (aDictionnary at: 'queue') withType: RMQQueue. . 
		
		"trouver la channel et la lier au consumer sinon la créer, set son subscribedComponent, pid, consumedQueues et vhost"
		channel :=	aModel allRMQChannels
					detect: [ :el | el pid = (aDictionnary at: 'channel') and: [ el  vhost = vhost] ]
					ifFound: [ :elementFound | 
			                 elementFound ]
		          ifNone: [ newChannel := RMQChannel new.
			                 newChannel subscribedComponent: componentObject.
			                 newChannel pid: (aDictionnary at: 'channel').
			                 newChannel consumedQueues add: relatedQueue. 
			                 newChannel vhost: vhost.
			                 aModel add: newChannel.
			                 newChannel  ]. 
		
		componentObject subscribedChannels add: channel. 


]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConsumerDeleted: aDictionnary at: timestamp [
    "aDictionnary ( vhost, consumer_tag, channel, queue)"
	
		| componentObject  vhost |

		vhost:= aModel entityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		
	   aModel allRMQComponents
		detect: [ :element | element consumerTag = (aDictionnary at: 'consumer_tag') 
			"and the channels of the consumer are on the right vhost"
			and: [ element subscribedChannels anySatisfy: [ :el | el pid = (aDictionnary at: 'channel') and: [ el  vhost = vhost] ] ]				
			 ]
		ifFound: [ :elementFound | 
			componentObject := elementFound ].
			
		componentObject ifNotNil: [ componentObject deletionDate: timestamp ]. 
	



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withExchangeCreated: aDictionnary at: timestamp [
"a Dictionary( 'durable'->true 'vhost'->'/' 'internal'->false 'auto_delete'->false  'name'->'exchangeName' 'arguments'->a Dictionary() 'type'->topic 'policy'->string )"
	
		| exchangeObject vhost args altExchName altExch|
		
		
		"if the exchange does not exist, create it"
		exchangeObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQExchange. 
		
		exchangeObject creationDate: timestamp.
			
		exchangeObject type: (aDictionnary at: 'type').
		exchangeObject internal: (aDictionnary at: 'internal').
		exchangeObject autoDelete: (aDictionnary at: 'auto_delete').
		exchangeObject durability:(aDictionnary at: 'durable').
		
		
		vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		exchangeObject vhost: vhost.
		vhost exchanges add: exchangeObject.
		
		
		args := (aDictionnary at: 'arguments').
		args isEmpty ifFalse:[
	   altExchName := (args at: 'alternate-exchange' ifAbsent:[nil]).
		altExchName ifNotNil:[
			altExch := aModel selectOrAddEntityNamed: altExchName withType: RMQExchange.
			exchangeObject my_alternate_exchange: altExch.
			altExch alternate_exchange_for add: exchangeObject.
		].]
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withExchangeDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'exchangename' )"

      | exchangeObject exchangeName vhostName |
		
		exchangeName := (aDictionnary at: 'name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
		vhostName := (aDictionnary at: 'vhost') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ]. 
		"exchangeObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQExchange.""ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		"avec detect"
		 aModel allRMQExchanges detect:[ :el | el pulseName =  exchangeName and:[ el vhost pulseName = vhostName] ]
		                        ifFound: [ :elementFound | exchangeObject := elementFound ].  
		
		exchangeObject ifNotNil: [ (exchangeObject vhost name = vhostName) ifTrue: [ exchangeObject deletionDate: timestamp. ] ]
	
			
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionCreated: aDictionnary at: timestamp [
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
		permissionObject :=	aModel allRMQPermissions
					detect: [ :el | el vhost pulseName = vhostName
								and: [ el user pulseName = userName and: [ el configureValue = configureValue and: [ el writeValue = writeValue and: [el readValue = readValue] ] ] ] ]
						ifFound: [ :elementFound | permissionObject := elementFound ]
						ifNone: [ | newPermission |
							newPermission := RMQPermission new
								configureValue: configureValue;
								writeValue: writeValue; 
								readValue: readValue.
								
						   "add the user to the model if it doest not exist"
							user := aModel selectOrAddEntityNamed: userName withType: RMQUser.
							newPermission user: user.
							user permissions add: newPermission.
							
							"add the vhost to the model if it doest not exist"
							vhost := aModel selectOrAddEntityNamed: vhostName withType: RMQVHost.
							newPermission vhost: vhost.
							vhost permissions add: newPermission.
						
							aModel add: newPermission.
						   newPermission ]. 
					
				permissionObject creationDate: timestamp. 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionDeleted: aDictionnary at: timestamp [
" aDictionnary ex :  timestamp_in_ms:	1543853881862 user:	testuser vhost:	/"
 | permissionObject  userName  vhostName |
		
		userName := aDictionnary at: 'user'.
		vhostName := aDictionnary at: 'vhost'.		
		
		"a user has only one permission per vhost at a time"
			aModel allRMQPermissions
					detect: [ :el | el vhost pulseName = vhostName and: [ el user name = userName  ] ]
						ifFound: [ :elementFound | permissionObject := elementFound ].
					
				permissionObject deletionDate: timestamp. 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withQueueCreated: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhost arguments|

		queueName := (aDictionnary at: 'name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
		
		"if the queue does not exist, create it"
		queueObject := aModel selectOrAddEntityNamed: queueName withType: RMQQueue. "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? non juste une entité.  sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle, oui à voir "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		queueObject vhost: vhost.
		vhost queues add: queueObject.
		
		arguments := (aDictionnary at: 'arguments').
		arguments isEmpty ifFalse: [
		queueObject expiresAfter: (arguments at: 'x-expires' ifAbsent:[nil]);
			maxLength: (arguments at: 'x-max-length' ifAbsent:[nil]);
			maxLengthBytes: (arguments at: 'x-max-length-bytes' ifAbsent:[nil]);
			maxPriority: (arguments at: 'x-max-priority' ifAbsent:[nil]);
			messageTTL: (arguments at: 'x-message-ttl' ifAbsent:[nil]).]
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withQueueDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'Queue' )"

      |queueObject vhostName queueName |
		
      queueName := (aDictionnary at: 'name') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ].
		vhostName := (aDictionnary at: 'vhost') trimLeft: [ :e | e = '"' ] right: [ :e | e = '"' ]. 
		"queueObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQQueue.""ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		aModel allRMQQueues detect:[ :el | el pulseName = queueName and:[ el vhost pulseName =  vhostName] ]
		                        ifFound: [ :elementFound | queueObject := elementFound ].  
		
		queueObject ifNotNil:[ (queueObject vhost pulseName = vhostName) ifTrue: [ queueObject deletionDate: timestamp ]]
	
			
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserAuthenticationFailed: aDictionnary at: timestamp [

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
  authentificationObject := RMQAuthentification new. 
  
  user := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQUser.
  authentificationObject user: user.
  user authentifications add: authentificationObject.

  "set the authentification state"
  authentificationObject success: false. 
  authentificationObject failureError: (aDictionnary at: 'error').
  authentificationObject timestamp: timestamp. 

  aModel add: authentificationObject. 

  "if the connection is of network type create the connection and link it to the user that authentificates"
  (aDictionnary at: 'connection_type' ) = 'network' ifTrue: [ 
	
	connectionName := (aDictionnary at: 'connection_name'). 
	
	connection := aModel entityNamed: connectionName withType: RMQConnection
	ifAbsent:[ 
		| newConnection |
				newConnection := RMQConnection new
					pulseName: connectionName.
				
	  newConnection connectionType: (aDictionnary at: 'connection_type').
     "connection // set the authMechanism"
	  newConnection host: (aDictionnary at: 'host').
	  newConnection peerHost: (aDictionnary at: 'peer_host').
	  newConnection peerPort: (aDictionnary at: 'peer_port').
	  newConnection protocol: (aDictionnary at: 'protocol').
	  newConnection ssl: (aDictionnary at: 'ssl').
	  
	  aModel add: newConnection.
				newConnection 
	  ].
	 
	 (user usedConnections anySatisfy: [ :e | e = connection ]) ifFalse: [ "??"
			  user usedConnections add: connection.
			  connection user: user 
			].
	
	
	 ]
  
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserAuthenticationSucceeded: aDictionnary at: timestamp [
" according to the type of the connection the dictionnary of headers is different : 
connection_type:	network : 
aDictionnary ( auth_mechanism:	PLAIN, connection_name:	10.238.28.3:40024 -> 10.238.28.5:5672, connection_type:	network, host:	{0,0,0,0,0,65535,2798,7173}, name:	bus-consolesaas, peer_host:	{0,0,0,0,0,65535,2798,7171}, peer_port:	40024, protocol:	{0,9,1}, ssl:	false, timestamp_in_ms:	1528449144710)
connection_type: direct	: ()
aDictionnary (connection_type:	direct, name:	admin, timestamp_in_ms:	1528454354351)"
  | authentificationObject user connection connectionName | 

  "// create a new authentification object , link the user, the latter is created if it does not exist"
  authentificationObject := RMQAuthentification new. 
  user := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQUser.
  authentificationObject user: user.
  user authentifications add: authentificationObject.

  "set the authentification state"
  authentificationObject success: true. 
  authentificationObject timestamp: timestamp. 

  aModel add: authentificationObject. 

  "if the connection is of network type create the connection and link it to the user that authentificates"
  (aDictionnary at: 'connection_type' ) = 'network' ifTrue: [ 
	
	connectionName := (aDictionnary at: 'connection_name').
	
	connection := aModel entityNamed: connectionName withType: RMQConnection
	ifAbsent:[ 
		| newConnection |
				newConnection := RMQConnection new
					pulseName: connectionName.
				
	  newConnection connectionType: (aDictionnary at: 'connection_type').
     "connection // set the authMechanism"
	  newConnection host: (aDictionnary at: 'host').
	  newConnection peerHost: (aDictionnary at: 'peer_host').
	  newConnection peerPort: (aDictionnary at: 'peer_port').
	  newConnection protocol: (aDictionnary at: 'protocol').
	  newConnection ssl: (aDictionnary at: 'ssl').
	  
	  aModel add: newConnection.
				newConnection 
	  ].
	 
	 (user usedConnections anySatisfy: [ :e | e = connection ]) ifFalse: [ "??"
			  user usedConnections add: connection.
			  connection user: user 
			].
	
	
	 ]
  
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserCreated: aDictionnary at: timestamp [
 " aDictionnary example: timestamp_in_ms:	1543851766334 name:	testcreation"

		| userObject |
		
		userObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQUser.	
		userObject creationDate: timestamp. 
		
		
		
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserDeleted: aDictionnary at: timestamp [
  " aDictionnary example: timestamp_in_ms:	1543851766334 name:	testcreation"

		| userObject |
		
		userObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQUser.
		userObject ifNotNil: [ userObject deletionDate: timestamp. ]
	
		
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserPasswordChanged: aDictionnary at: timestamp [
"aDictionnary (name)"
  | UserObject |
		
		UserObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQUser.
		UserObject ifNotNil: [ UserObject passwordChangingDate:  timestamp. ]
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserPasswordCleared: aDictionnary at: timestamp [
 "aDictionnay (timestamp_in_ms:	1544440878584, name:	testtest"
  | UserObject |
		
		UserObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQUser.
		UserObject ifNotNil: [ UserObject passwordClearingDate:  timestamp. ] 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserTagsSet: aDictionnary at: timestamp [
" to know : event raised when a tag is set in the creation and the apdate of the use"
" args are separated by a ';' "
" in RabbitMQ 3.7.4  aDictionnary (name: test, tags:	management; other , timestamp_in_ms:	1544435291495, user_who_performed_action:	admin)"
" in RabbitMQ 3.6.14 aDictionnary (name: test, tags:	management; other , timestamp_in_ms:	1544435291495)"

  | user |

  user := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQUser.
  
  ((aDictionnary at: 'tags') substrings: ';') do:[:aTagString |
			|roleObject|			
			roleObject := aModel entityNamed: aTagString withType: RMQRole
			ifAbsent:[   
				|newRole |
				newRole := RMQRole new
					tag: aTagString;   "?"
					settingDate: timestamp.
				aModel add: newRole.
				newRole ].
			
			 (user roles anySatisfy: [ :e | e = roleObject ]) ifFalse: [ "??"
			  user roles add: roleObject.
			  roleObject user: user 
			].
		]. 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withVhostCreated: aDictionnary at: timestamp [
   "a Dictionary( 	timestamp_in_ms:	1543854933856, name:	smalltalk, tracing:	false )"

	   | vhostObject |
		
		vhostObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQVHost.
		vhostObject ifNotNil: [ vhostObject creationDate: timestamp. ]
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withVhostDeleted: aDictionnary at: timestamp [
 "timestamp_in_ms:	1544113907521, name:	testtest"
    | vhostObject |
		
		"vhostObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQVHost."
		
	  aModel allRMQVHosts
					detect: [ :el | el pulseName = (aDictionnary at: 'name')  ]
						ifFound: [ :elementFound | vhostObject := elementFound ]. 
						
		vhostObject ifNotNil: [ vhostObject deletionDate: timestamp. ]
	
]
