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
	
	| bindingObject source destination routingKeyName routingKey destType sourceName destinationName |
		
	destType := (aDictionnary at: 'destination_kind').
	sourceName := (aDictionnary at: 'source_name').
	destinationName := (aDictionnary at: 'destination_name').
	
	"if the binding does not exist, create it"
	bindingObject := aModel entityNamed: (sourceName, '>', destinationName)  withType: RMQBinding
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
			
		bindingObject creationDate: timestamp.  
		
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
		routingKey binding: bindingObject.
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withBindingDeleted: aDictionnary at: timestamp [
"aDictionnary : destination_kind source_kind, arguments (aDictionnary), destination_name, routing_key, source_name"
"todo : set the arguments"
	
	| bindingObject destType sourceName destinationName |
		
	destType := (aDictionnary at: 'destination_kind').
	sourceName := (aDictionnary at: 'source_name').
	destinationName := (aDictionnary at: 'destination_name').
	
	"if the binding does not exist, create it"
	bindingObject := aModel entityNamed: (sourceName, '>', destinationName)  withType: RMQBinding.
	bindingObject = nil ifFalse: [ 
		 bindingObject routingKey name = (aDictionnary at: 'routing_key') & bindingObject destinationType = destType ifTrue: [ 
			 	bindingObject deletionDate: timestamp.  
			 ]
		 ]
	
	

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
RMQEventParser >> populate: aModel withChannelCreated: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhostName vhost arguments|

		queueName := (aDictionnary at: 'name').
		
		"if the queue does not exist, create it"
		queueObject := aModel entityNamed: queueName withType: RMQQueue "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle "
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new queueString: queueName .
				aModel add: newQueue.
				newQueue ]. "ask Jannik : why this line"
			
		"queueObjects do: [ :queueObject| |vhostName vhost arguments| "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
RMQEventParser >> populate: aModel withChanneldeleted: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhostName vhost arguments|

		queueName := (aDictionnary at: 'name').
		
		"if the queue does not exist, create it"
		queueObject := aModel entityNamed: queueName withType: RMQQueue "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle "
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new queueString: queueName .
				aModel add: newQueue.
				newQueue ]. "ask Jannik : why this line"
			
		"queueObjects do: [ :queueObject| |vhostName vhost arguments| "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
RMQEventParser >> populate: aModel withConnectionCreated: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhostName vhost arguments|

		queueName := (aDictionnary at: 'name').
		
		"if the queue does not exist, create it"
		queueObject := aModel entityNamed: queueName withType: RMQQueue "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle "
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new queueString: queueName .
				aModel add: newQueue.
				newQueue ]. "ask Jannik : why this line"
			
		"queueObjects do: [ :queueObject| |vhostName vhost arguments| "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
RMQEventParser >> populate: aModel withConnectionDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhostName vhost arguments|

		queueName := (aDictionnary at: 'name').
		
		"if the queue does not exist, create it"
		queueObject := aModel entityNamed: queueName withType: RMQQueue "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle "
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new queueString: queueName .
				aModel add: newQueue.
				newQueue ]. "ask Jannik : why this line"
			
		"queueObjects do: [ :queueObject| |vhostName vhost arguments| "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
	
		| exchangeName exchangeObject vhostName vhost args altExchName altExch|
		
		exchangeName := (aDictionnary at: 'name').
		
		"if the exchange does not exist, create it"
		exchangeObject := aModel entityNamed: exchangeName withType: RMQExchange "same problem as queues"
			ifAbsent:[ 
				|newExchange |
				newExchange := RMQExchange new
					exchangeString: (aDictionnary at: 'name').
				aModel add: newExchange.
				newExchange ].
			
		exchangeObject creationDate: timestamp.
			
		exchangeObject type: (aDictionnary at: 'type').
		exchangeObject internal: (aDictionnary at: 'internal').
		exchangeObject autoDelete: (aDictionnary at: 'auto_delete').
		exchangeObject durability:(aDictionnary at: 'durable').
		
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
		exchangeObject vhost: vhost.
		vhost exchanges add: exchangeObject.
		
		
		args := (aDictionnary at: 'arguments').
		
	   altExchName := (args at: 'alternate-exchange' ifAbsent:[nil]).
		altExchName ifNotNil:[
			altExch := aModel entityNamed: altExchName withType: RMQExchange
				ifAbsent:[
					|newExch |
					newExch := RMQExchange new
						exchangeString: altExchName.
					aModel add: newExch.
					newExch
				].
			exchangeObject my_alternate_exchange: altExch.
			altExch alternate_exchange_for add: exchangeObject.
		].
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withExchangeDeleted: aDictionnary at: timestamp [
   "a Dictionary( 'vhost'->'/' 'name'->'Queue' )"

      |exchangeObject|
		
		exchangeObject := aModel entityNamed: (aDictionnary at: 'name') withType: RMQExchange."ici on peut avoir une liste ! à revoir dans ex: populate: aModel withQueues: anArray dans RMQRestParser "
		
		(exchangeObject = nil) ifFalse: [ 
			  (exchangeObject vhost name = (aDictionnary at: 'vhost')) ifTrue: [ exchangeObject deletionDate: timestamp ]	  
			  ]
	
			
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionCreated: aDictionnary at: timestamp [
  "aDictionnary : timestamp_in_ms:	1543851859334 user:	testcreation vhost:	/ configure:	.* write:	.* read:	.*"
						
	" create user and vhost if they do not exist ?"
	
   | userName permissionObject |
		
		userName := (aDictionnary at: 'name').
		
		"todo ? create 3 permission objects, one for each type"
		permissionObject := aModel entityNamed: userName withType: RMQPermission "// what identifies a permission ??"
			ifAbsent:[   
				| newPermission |
				newPermission := RMQPermission new.
				"todo : set parameters "
				aModel add: newPermission.
				newPermission ].
			
	   permissionObject vhost: (aDictionnary at: 'vhost').
		permissionObject creationDate: timestamp. 
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withPermissionDeleted: aDictionnary at: timestamp [
" aDictionnary ex :  timestamp_in_ms:	1543853881862 user:	testuser vhost:	/"
  | userName permissionObject |
		
		userName := (aDictionnary at: 'name').
		
		permissionObject := aModel entityNamed: userName withType: RMQPermission. "// what identifies a permission ??"
		permissionObject = nil ifFalse: [ permissionObject vhost = ( aDictionnary at: 'vhost')  ifTrue: [permissionObject deletionDate: timestamp.] ]
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withQueueCreated: aDictionnary at: timestamp [
   "a Dictionary( 'durable'->true 'vhost'->'/' 'auto_delete'->false  'name'->'Queue' 'exclusive'->false 'arguments'->a Dictionary() 'owner_pid'->string )"

      |queueName queueObject vhostName vhost arguments|

		queueName := (aDictionnary at: 'name').
		
		"if the queue does not exist, create it"
		queueObject := aModel entityNamed: queueName withType: RMQQueue "ici on peut avoir une liste ! à revoir dans ex: populate:withQueues: dans RMQRestParser. ++ est ce que cette méthode est définie de façon à rendre une liste ? sinon le nom de la resources dans rabbitmq ne doit pas être l'identifiant de l'objet dans le modèle "
			ifAbsent:[  
				|newQueue |
				newQueue := RMQQueue new queueString: queueName .
				aModel add: newQueue.
				newQueue ]. "ask Jannik : why this line"
			
		"queueObjects do: [ :queueObject| |vhostName vhost arguments| "
			
		queueObject creationDate: timestamp. 
		
		queueObject autoDelete: (aDictionnary at: 'auto_delete').
		queueObject durability:(aDictionnary at: 'durable').
		queueObject exclusive:(aDictionnary at: 'exclusive').
		
	   "create the Vhost if it does not exist and link it to the queue"
		vhostName := (aDictionnary at: 'vhost').
		vhost := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[
				|newVhost |
				newVhost := RMQVHost new
					vhostString: vhostName.
				aModel add: newVhost.
				newVhost
			].
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
		
		(queueObject = nil) ifFalse: [ 
			  (queueObject vhost name = (aDictionnary at: 'vhost')) ifTrue: [ queueObject deletionDate: timestamp ]	  
			  ]
	
			
		
		
	
			



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

		| userName userObject |
		
		userName := (aDictionnary at: 'name').
		
		userObject := aModel entityNamed: userName withType: RMQUser
			ifAbsent:[   
				|newUser |
				newUser := RMQUser new
					userString: userName.
				aModel add: newUser.
				newUser ].
	
		userObject creationDate: timestamp. 
		
		
		
]

{ #category : #parsing }
RMQEventParser >> populate: aModel withUserDeleted: aDictionnary at: timestamp [
  " aDictionnary example: timestamp_in_ms:	1543851766334 name:	testcreation"

		| userName userObject |
		
		userName := (aDictionnary at: 'name').
		
		userObject := aModel entityNamed: userName withType: RMQUser.
		userObject = nil ifFalse: [ userObject deletionDate: timestamp. ]
	
		
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

      |vhostObject vhostName|
		
		vhostName := (aDictionnary at: 'name').
		
		vhostObject := aModel entityNamed: vhostName withType: RMQVHost
			ifAbsent:[   
				| newVhost |
				newVhost := RMQUser new
					userString: vhostName.
				aModel add: newVhost.
				newVhost ].
	
		vhostObject creationDate: timestamp. 
		
		
	
			



]

{ #category : #parsing }
RMQEventParser >> populate: aModel withVhostDeleted: aDictionnary at: timestamp [
   self notYetImplemented. 
]
