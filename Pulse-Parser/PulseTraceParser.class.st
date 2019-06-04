"
the Message, the dictionnary represents the properties headers :
Exchange	amq.rabbitmq.trace
Routing Key	publish.pubsub.default.consoleSaasUserAccess.publish
Redelivered	●
Properties	
 headers:	
 exchange_name:	pubsub.default.consoleSaasUserAccess.publish
 routing_keys:	message
 properties:	
  app_id:	bl-console-saas
  timestamp:	1550658626
  message_id:	0c38ddd9-2a84-493a-bd5d-1c8d2906350e
  delivery_mode:	2
  headers:	
   X-ExchangeFormatId:	AVRO
   X-TenantId:	default
   X-ClientId:	bl-console-saas
   X-TopicId:	consoleSaasUserAccess
   X-ExchangeFormatSchema:	
 node:	rabbit@fceed0d94b94
 vhost:	/
 connection:	172.17.0.1:43458 -> 172.17.0.2:5672
 channel:	1
 user:	guest
 routed_queues:	pubsub.default.consoleSaasUserAccess.module-profile-updated.subscrib

in the trace messages collected by consuming the trace queue, the type of the message is not explicitlly defined 
published : - routing key : name of the exchange 
            - presence of routed_queues in the headers 
Received : - routing key : name of the queue 
           - no of routed_queues in the headers 

the payload is to be initialized by AmqpCommand -> body 

we must not parse messages from exchange : Properties headers: exchange_name: amq.rabbitmq.event
"
Class {
	#name : #PulseTraceParser,
	#superclass : #PulseParser,
	#instVars : [
		'message'
	],
	#category : #'Pulse-Parser'
}

{ #category : #parsing }
PulseTraceParser >> populate: aModel withTraceMessage: aDictionnary onResource: resource [
	" the Message, 
Exchange	amq.rabbitmq.trace
Routing Key	deliver.events.user.authentication.success
Redelivered	●
Properties	
headers:

the dictionnary represents the properties headers :
 exchange_name:	pubsub.default.consoleSaasUserAccess.publish *
 routing_keys:	message
 properties:	
  app_id:	bl-console-saas *
  timestamp:	1550658626  *
  message_id:	0c38ddd9-2a84-493a-bd5d-1c8d2906350e  *
  delivery_mode:	2 *
  headers:	
   X-ExchangeFormatId:	AVRO *
   X-TenantId:	default *
   X-ClientId:	bl-console-saas
   X-TopicId:	consoleSaasUserAccess
   X-ExchangeFormatSchema:	*
 node:	rabbit@fceed0d94b94  *
 vhost:	/ *
 connection:	172.17.0.1:43458 -> 172.17.0.2:5672  *
 channel:	1  *
 user:	guest  *
 routed_queues:	pubsub.default.consoleSaasUserAccess.module-profile-updated.subscribe"

	| messageObject messageId connection queue user node exchange vhost channel publisherComponent consumerComponent exchangeFormat component tenant tenantId |
	
	node := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'node')
		withType: PulseNode
		sourceName: self sourceName.

	"set the vhost"
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	vhost node
		ifNil: [ node vhosts add: vhost.
			vhost node: node ].
	messageId := (aDictionnary at: 'properties') at: 'message_id'.
	aModel allPulseMessages
		detect: [ :el | el messageID = messageId ]
		ifFound: [ :elementFound | messageObject := elementFound ]
		ifNone: [ messageObject := PulseMessage new.
			messageObject messageID: messageId.
			messageObject mooseModel: aModel.
			aModel add: messageObject ].
	messageObject
		timestamp: ((aDictionnary at: 'properties') at: 'timestamp').

	"set the connection"
	"to do : update regarding to new naming of connection "
	connection := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'connection')
		withType: PulseConnection
		sourceName: self sourceName.
	(vhost connections anySatisfy: [ :e | e = connection ])
		ifFalse: [ vhost connections add: connection.
			connection vhost: vhost ].

	"set the user"
	"to do : update to initialized connections ?"
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'user')
		withType: PulseUser
		sourceName: self sourceName.
	user usedConnections
		detect: [ :conn | conn = connection ]
		ifNone: [ connection user: user.
			user usedConnections add: connection ].
	user vhosts
		detect: [ :vh | vh = vhost ]
		ifNone: [ vhost users add: user.
			user vhosts add: vhost ].

	"channels name is connection + (+ channel+)"
	channel := aModel
		selectOrAddEntityNamed:
			(aDictionnary at: 'connection') , ' ('
				, (aDictionnary at: 'channel') asStringWithCommas , ')'
		withType: PulseChannel
		sourceName: self sourceName.
	channel vhost
		ifNil: [ vhost channels add: channel.
			channel vhost: vhost ].
	channel connection
		ifNil: [ connection channels add: connection.
			channel connection: connection ].
	user usedChannels
		detect: [ :ch | ch = channel ]
		ifNone: [ channel user: user.
			user usedChannels add: channel ].

	"set the exchange"
	exchange := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'exchange_name')
		withType: PulseExchange
		sourceName: self sourceName.
	exchange publishedMessages add: messageObject.
	messageObject publishedToExchange: exchange.
	exchange vhost
		ifNil: [ vhost exchanges add: exchange.
			exchange vhost: vhost ].

	"message delivery mode"
	((aDictionnary at: 'properties') at: 'delivery_mode') = 1
		ifTrue: [ messageObject deliveryMode: PulseDeliveryMode nonPersistent ]
		ifFalse: [ messageObject deliveryMode: PulseDeliveryMode persistent ].
	messageObject deliveryMode messages add: messageObject.

	"to do : separate consumer and publisher !"

	"set the publisher"
	(aDictionnary at: 'properties')
		at: 'app_id'
		ifPresent: [ publisherComponent := aModel
				selectOrAddEntityNamed: ((aDictionnary at: 'properties') at: 'app_id')
				withType: PulsePublisherComponent
				sourceName: self sourceName.
			publisherComponent messagesFromPublisher add: messageObject.
			messageObject publisherComponent: publisherComponent.
			tenantId := aModel
				selectOrAddEntityNamed: (((aDictionnary at: 'properties') at: 'headers') at: 'X-TenantId')
				withType: PulseTenant
				sourceName: self sourceName.
			publisherComponent tenantId: tenantId.
			publisherComponent usedChannels
				detect: [ :ch | ch = channel ]
				ifNone: [ publisherComponent usedChannels add: channel.
					channel publisherComponent: publisherComponent ].
			publisherComponent exchanges
				detect: [ :exch | exch = exchange ]
				ifNone: [ publisherComponent exchanges add: exchange.
					exchange publisherComponents add: publisherComponent ] ].


	"set the exchange format"
	aModel allPulseExchangeFormats
		detect: [ :el | 
			el exchangeFormatSchema
				=
					(((aDictionnary at: 'properties') at: 'headers')
						at: 'X-ExchangeFormatSchema') ]
		ifFound: [ :elementFound | exchangeFormat := elementFound ]
		ifNone: [ exchangeFormat := PulseExchangeFormat new.
			exchangeFormat
				exchangeFormatSchema:
					(((aDictionnary at: 'properties') at: 'headers')
						at: 'X-ExchangeFormatSchema').
			exchangeFormat
				exchangeFormatType:
					(((aDictionnary at: 'properties') at: 'headers')
						at: 'X-ExchangeFormatId').
			exchangeFormat mooseModel: aModel.
			aModel add: exchangeFormat ].
	messageObject exchangeFormat: exchangeFormat.
	exchangeFormat messages add: messageObject.

	"message type according to existance of routed_queues "
	aDictionnary
		at: 'routed_queues'
		ifPresent: [ messageObject messageType: PulseMessageType published.
			messageObject messageType messages add: messageObject ].
	aDictionnary
		at: 'routed_queues'
		ifAbsent: [ messageObject messageType: PulseMessageType received.
			messageObject messageType messages add: messageObject.	" to do : a revoir !"
			queue := aModel
				selectOrAddEntityNamed: resource
				withType: PulseQueue
				sourceName: self sourceName.
			messageObject queue: queue.
			queue messagesFromPublisher add: messageObject.	"to do : a revoir plus de queue dans message et pa de messagesFromPublisher dans queue "
			queue vhost
				ifNil: [ vhost queues add: queue.
					queue vhost: vhost ] ]


	" set routingKeys if the MM is updated "
]

{ #category : #parsing }
PulseTraceParser >> populate: aModel withTraceMessage: aDictionnary withTraceType: traceType onResource: resource [
	" the Message, 
Exchange	amq.rabbitmq.trace
Routing Key	deliver.events.user.authentication.success
Redelivered	●
Properties	
headers:

the dictionnary represents the properties headers :
 exchange_name:	pubsub.default.consoleSaasUserAccess.publish *
 routing_keys:	message
 properties:	
  app_id:	bl-console-saas *
  timestamp:	1550658626  *
  message_id:	0c38ddd9-2a84-493a-bd5d-1c8d2906350e  *
  delivery_mode:	2 *
  headers:	
   X-ExchangeFormatId:	AVRO *
   X-TenantId:	default *
   X-ClientId:	bl-console-saas
   X-TopicId:	consoleSaasUserAccess
   X-ExchangeFormatSchema:	*
 node:	rabbit@fceed0d94b94  *
 vhost:	/ *
 connection:	172.17.0.1:43458 -> 172.17.0.2:5672  *
 channel:	1  *
 user:	guest  *
 routed_queues:	pubsub.default.consoleSaasUserAccess.module-profile-updated.subscribe"

	| messageObject messageId connection queue user node exchange vhost channel publisherComponent consumerComponent exchangeFormat tenantId routedQueue routedQueues routingKey exchangeName consumerComponenetName consumerComponentName |
	node := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'node')
		withType: PulseNode
		sourceName: self sourceName.

	"set the vhost"
	vhost := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'vhost')
		withType: PulseVHost
		sourceName: self sourceName.
	vhost node
		ifNil: [ node vhosts add: vhost.
			vhost node: node ].
	messageObject := aModel
		selectOrAddEntityNamed: ((aDictionnary at: 'properties') at: 'message_id')
		withType: PulseMessage
		sourceName: self sourceName.
	messageObject
		timestamp: ((aDictionnary at: 'properties') at: 'timestamp').

	"set the connection"
	"to do : update regarding to new naming of connection "
	connection := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'connection')
		withType: PulseConnection
		sourceName: self sourceName.
	(vhost connections anySatisfy: [ :e | e = connection ])
		ifFalse: [ vhost connections add: connection.
			connection vhost: vhost ].

	"set the user"
	"to do : update to initialized connections ?"
	user := aModel
		selectOrAddEntityNamed: (aDictionnary at: 'user')
		withType: PulseUser
		sourceName: self sourceName.
	user usedConnections
		detect: [ :conn | conn = connection ]
		ifNone: [ connection user: user.
			user usedConnections add: connection ].
	user vhosts
		detect: [ :vh | vh = vhost ]
		ifNone: [ vhost users add: user.
			user vhosts add: vhost ].

	"channels name is connection + (+ channel+)"
	channel := aModel
		selectOrAddEntityNamed:
			(aDictionnary at: 'connection') , ' ('
				, (aDictionnary at: 'channel') asStringWithCommas , ')'
		withType: PulseChannel
		sourceName: self sourceName.
	channel vhost
		ifNil: [ vhost channels add: channel.
			channel vhost: vhost ].
	channel connection
		ifNil: [ connection channels add: connection.
			channel connection: connection ].
	user usedChannels
		detect: [ :ch | ch = channel ]
		ifNone: [ channel user: user.
			user usedChannels add: channel ].

	"message delivery mode"
	((aDictionnary at: 'properties') at: 'delivery_mode') = 1
		ifTrue: [ messageObject deliveryMode: PulseDeliveryMode nonPersistent ]
		ifFalse: [ messageObject deliveryMode: PulseDeliveryMode persistent ].
	messageObject deliveryMode messages add: messageObject.

	"set the exchange format"
	exchangeFormat := aModel
		selectOrAddEntityNamed:
			(((aDictionnary at: 'properties') at: 'headers')
				at: 'X-ExchangeFormatSchema')
		withType: PulseExchangeFormat
		sourceName: self sourceName.
	"aModel allRMQExchangeFormats
		   detect: [ :el | el exchangeFormatSchema  = (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema') ]
		   ifFound: [ :elementFound | 
			exchangeFormat := elementFound. ]
		   ifNone: [ 
			  exchangeFormat := RMQExchangeFormat new. 
			  exchangeFormat exchangeFormatSchema: (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema'). 
			  exchangeFormat mooseModel: aModel.
		     aModel add: exchangeFormat]."
	exchangeFormat
		exchangeFormatType:
			(((aDictionnary at: 'properties') at: 'headers')
				at: 'X-ExchangeFormatId').
	messageObject exchangeFormat: exchangeFormat.
	exchangeFormat messages add: messageObject.

	"set the exchange in both cases : received or published"
	exchangeName := aDictionnary at: 'exchange_name'.
	exchange := aModel
		selectOrAddEntityNamed: exchangeName
		withType: PulseExchange
		sourceName: self sourceName.
	exchange publishedMessages add: messageObject.
	messageObject publishedToExchange: exchange.
	exchange vhost
		ifNil: [ vhost exchanges add: exchange.
			exchange vhost: vhost ].
	"set topicId"
	((exchangeName substrings: '.') at: 1) = 'pubsub'
		ifTrue: [ exchange topicID: ((exchangeName substrings: '.') at: 3) ].

	"consumer or publisher : tow cases according to trace type"
	traceType = 'publish'
		ifTrue: [ "case message published"
			"set the publisher"
			(aDictionnary at: 'properties')
				at: 'app_id'
				ifPresent: [ publisherComponent := aModel
						selectOrAddEntityNamed: ((aDictionnary at: 'properties') at: 'app_id')
						withType: PulsePublisherComponent
						sourceName: self sourceName.
					publisherComponent
						appId: ((aDictionnary at: 'properties') at: 'app_id').
					publisherComponent messagesFromPublisher add: messageObject.
					messageObject publisherComponent: publisherComponent.
					tenantId := aModel
						selectOrAddEntityNamed: (((aDictionnary at: 'properties') at: 'headers') at: 'X-TenantId')
						withType: PulseTenant
						sourceName: self sourceName.
					publisherComponent tenantId: tenantId.
					publisherComponent usedChannels
						detect: [ :ch | ch = channel ]
						ifNone: [ publisherComponent usedChannels add: channel.
							channel publisherComponent: publisherComponent ].
					publisherComponent exchanges
						detect: [ :exch | exch = exchange ]
						ifNone: [ publisherComponent exchanges add: exchange.
							exchange publisherComponents add: publisherComponent ] ]

			"if routed_queues is present and not null : message published and routed 
	         if routed_queues is present and  null : message published and not routed  "
			"vérifier d'abord si'il y a plus d'un element dans la liste "
			"aDictionnary at: 'routed_queues' ifPresent: 
			    [ 	
              routedQueues := (aDictionnary at: 'routed_queues'). 
              
              ( routedQueues size = 1) 
              ifTrue: [  routedQueue := aModel selectOrAddEntityNamed: routedQueues withType: RMQQueue.				
				      ""link with messages""
				      routedQueue routedMessages add: messageObject.
				      messageObject routedToQueues add: routedQueue.	  
					
					   ""set vhost""		
						routedQueue vhost: vhost. 
						vhost queues add: routedQueue.  ]. 
				  ( routedQueues size >= 1) 
              ifTrue: [  routedQueues do: [ :aRoutedQueue |
				      routedQueue := aModel selectOrAddEntityNamed: aRoutedQueue withType: RMQQueue.				
				      ""link with messages""
				      routedQueue routedMessages add: messageObject.
				      messageObject routedToQueues add: routedQueue.	  
					
					   ""set vhost""		
						routedQueue vhost: vhost. 
						vhost queues add: routedQueue. 
				    ].		
					].	
				 ]." ]
		ifFalse: [ "case message delivered"
			"set the consumer"
			" if routed_queues is not present and trace type deliver : message delivered to consumer"
			"get the module id to create the consumerComponent, the moduleId is part of the resource (here queue),  set subscribedChannel of consumerComponent, link channel to related queue, and queue to the message "
			"set the queue from which the message was delivered "
			queue := aModel
				selectOrAddEntityNamed: resource
				withType: PulseQueue
				sourceName: self sourceName.
			"link with messages"
			queue deliveredMessages add: messageObject.
			messageObject deliveredFromQueues add: queue.

			"set vhost"
			queue vhost: vhost.
			vhost queues add: queue.

			"set the consumer"	" link with message ?"
			" get the consumer component id from the 4 th part of the queue name !!  "
			((resource substrings: '.') at: 1) = 'pubsub'
				ifTrue: [ consumerComponentName := (resource substrings: '.') at: 4.
					consumerComponent := aModel
						selectOrAddEntityNamed: consumerComponentName
						withType: PulseConsumerComponent
						sourceName: self sourceName.
					consumerComponent appId: ((resource substrings: '.') at: 4).
					consumerComponent subscribedChannels
						detect: [ :ch | ch = channel ]
						ifNone: [ consumerComponent subscribedChannels add: channel.
							channel consumerComponent: consumerComponent ] ].
			channel consumedQueues add: queue.
			queue consumerChannels add: channel ]


	" set routingKeys "
	"vérifier d'abord si'il y a plus d'un element dans la liste "
	"(aDictionnary at: 'routing_keys') do: [ :aRoutingKey |
					routingKey := aModel selectOrAddEntityNamed: aRoutingKey withType: RMQRoutingKey.
					routingKey messages add: messageObject. 
					messageObject routingKeys add: routingKey. 
				]."
]