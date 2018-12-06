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
RMQEventParser class >> parseChannelCreated: dic [


]

{ #category : #parsing }
RMQEventParser >> populate: aModel withBindingCreated: aDictionnary at: timestamp [
"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name"
"todo : set the arguments"
	
	| bindingObject source destination routingKey destType sourceName destinationName newBinding vhost |
		
	destType := (aDictionnary at: 'destination_kind').
	sourceName := (aDictionnary at: 'source_name').
	destinationName := (aDictionnary at: 'destination_name').
	
	
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
			
		vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		bindingObject vhost: vhost.
		vhost bindings add: bindingObject.

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
	
	bindingObject := aModel allRMQBindings
		detect: [ :element | element source = source and: [ element destination = destination  and: [ element routingKey = routingKey ] ]  ]
		ifFound: [ :elementFound | 
			elementFound ].
	bindingObject ifNotNil:[ bindingObject deletionDate: timestamp. ]
		
	"//old version 
	bindingObject := aModel entityNamed: (sourceName, '>', destinationName)  withType: RMQBinding.
	bindingObject = nil ifFalse: [ 
		 bindingObject routingKey name = (aDictionnary at: 'routing_key') & bindingObject destinationType = destType ifTrue: [ 
			 	bindingObject deletionDate: timestamp.  
			 ]
		 ]."
	

"// créer si absent ??"
	
			"ifAbsent:[  
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
				
				newBinding destinationType = 'exchange' 
				ifTrue: [ 
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
			
	
		
		routingKeyName := (aDictionnary at: 'routing_key').
		routingKey := aModel entityNamed: routingKeyName withType: RMQRoutingKey
			ifAbsent:[
				|newRK |
				newRK := RMQRoutingKey new
					routingKeyString: routingKeyName.
				aModel add: newRK.
				newRK
			].
		bindingObject routingKey: routingKey.
		routingKey binding: bindingObject."
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withChannelClosed: aDictionnary at: timestamp [
   "a Dictionary( pid )"

   " todo : add pid in the definition of the channel to corelate with the created channel"
     self notYetImplemented.
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withChannelCreated: aDictionnary at: timestamp [
   "a Dictionary( vhost, number, name, connection, pid, user  )"

   "to do : Pb : qu'est ce qui identifie une channel "
  | user channelObject vhost |
      
		channelObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQExchange.
		
		channelObject creationDate: timestamp. 
		
		user := aModel selectOrAddEntityNamed: (aDictionnary at: 'user') withType: RMQUser.
		channelObject users add: user.
		user usedChannels add: channelObject.

		vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		channelObject vhost: vhost.
		vhost channels add: channelObject.

		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConnectionClosed: aDictionnary at: timestamp [
 "a Dictionary( pid )"

 " todo : add pid in the definition of the channel to corelate with the created channel"

      self notYetImplemented. 
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConnectionCreated: aDictionnary at: timestamp [
"a Dictionary( timestamp_in_ms:	1544109134439
type:	network
pid:	<rabbit@fceed0d94b94.3.8698.0>
name:	172.17.0.1:56246 -> 172.17.0.2:5672
port:	5672
peer_port:	56246
host:	{0,0,0,0,0,65535,44049,2}
peer_host:	{0,0,0,0,0,65535,44049,1}
ssl:	false
peer_cert_subject:	
peer_cert_issuer:	
peer_cert_validity:	
auth_mechanism:	PLAIN
ssl_protocol:	
ssl_key_exchange:	
ssl_cipher:	
ssl_hash:	
protocol:	{0,9,1}
user:	guest
vhost:	/
timeout:	60
frame_max:	131072
channel_max:	0
client_properties:	{<<""product"">>,longstr,<<""RabbitMQ Smalltalk"">>}
connected_at:	1544109134432)"

     self notYetImplemented. 
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConsumerCreated: aDictionnary at: timestamp [
   self notYetImplemented. 
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withConsumerDeleted: aDictionnary at: timestamp [
    self notYetImplemented. 
	
	
			



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
		
	   altExchName := (args at: 'alternate-exchange' ifAbsent:[nil]).
		altExchName ifNotNil:[
			altExch := aModel selectOrAddEntityNamed: altExchName withType: RMQExchange.
			exchangeObject my_alternate_exchange: altExch.
			altExch alternate_exchange_for add: exchangeObject.
		].
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withExchangeDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'Queue' )"

      |exchangeObject|
		
		exchangeObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQExchange."ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		
		exchangeObject ifNotNil: [ 
			  (exchangeObject vhost name = (aDictionnary at: 'vhost')) ifTrue: [ exchangeObject deletionDate: timestamp ]	  
			  ]
	
			
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionCreated: aDictionnary at: timestamp [
  "aDictionnary : timestamp_in_ms:	1543851859334 user:	testcreation vhost:	/ configure:	.* write:	.* read:	.*"
  "todo : set parameters "
						
	" create user and vhost if they do not exist ?"
	
   | userName permissionObject |
		
		userName := (aDictionnary at: 'name').
		
		"todo ? create 3 permission objects, one for each type"
		permissionObject := aModel selectOrAddEntityNamed: userName withType: RMQPermission. "// what identifies a permission ??"

	   permissionObject vhost: (aDictionnary at: 'vhost').
		permissionObject creationDate: timestamp. 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionDeleted: aDictionnary at: timestamp [
" aDictionnary ex :  timestamp_in_ms:	1543853881862 user:	testuser vhost:	/"
  | userName permissionObject |
		
		userName := (aDictionnary at: 'name').
		
		permissionObject := aModel entityNamed: userName withType: RMQPermission. "// what identifies a permission ??"
		permissionObject ifNotNil: [ permissionObject vhost = ( aDictionnary at: 'vhost')  ifTrue: [permissionObject deletionDate: timestamp.] ]
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withQueueCreated: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhost arguments|

		queueName := (aDictionnary at: 'name').
		
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
		queueObject expiresAfter: (arguments at: 'x-expires' ifAbsent:[nil]);
			maxLength: (arguments at: 'x-max-length' ifAbsent:[nil]);
			maxLengthBytes: (arguments at: 'x-max-length-bytes' ifAbsent:[nil]);
			maxPriority: (arguments at: 'x-max-priority' ifAbsent:[nil]);
			messageTTL: (arguments at: 'x-message-ttl' ifAbsent:[nil]).
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withQueueDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'Queue' )"

      |queueObject|
		
		queueObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQQueue."ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		
		queueObject ifNotNil:[ (queueObject vhost name = (aDictionnary at: 'vhost')) ifTrue: [ queueObject deletionDate: timestamp ]]
	
			
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserAuthenticationFailed: aDictionnary at: timestamp [
  self notYetImplemented.
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserAuthenticationSucceeded: aDictionnary at: timestamp [
  self notYetImplemented. 
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

		| userName userObject |
		
		userName := (aDictionnary at: 'name').
		
		userObject := aModel entityNamed: userName withType: RMQUser.
		userObject ifNotNil: [ userObject deletionDate: timestamp. ]
	
		
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserPasswordChanged: aDictionnary at: timestamp [
  self notYetImplemented.
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserPasswordCleared: aDictionnary at: timestamp [
  self notYetImplemented.
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserTagsSet: aDictionnary at: timestamp [
  self notYetImplemented.
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withVhostCreated: aDictionnary at: timestamp [
   "a Dictionary( timestamp_in_ms:	1543854933856 name:	smalltalk tracing:	false )"

      | vhostObject |
		
		vhostObject := aModel selectOrAddEntityNamed: (aDictionnary at: 'name') withType: RMQVHost.
	
		vhostObject creationDate: timestamp. 
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withVhostDeleted: aDictionnary at: timestamp [
   self notYetImplemented. 
]
