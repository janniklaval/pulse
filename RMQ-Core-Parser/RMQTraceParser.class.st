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
	#name : #RMQTraceParser,
	#superclass : #Object,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQTraceParser >> populate: aModel withTraceMessage: aDictionnary onResource: resource [

" the Message, the dictionnary represents the properties headers :
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
 
			| messageObject messageId connection queue user node exchange vhost channel component  tenant exchangeFormat|
			
			node := aModel selectOrAddEntityNamed: (aDictionnary at: 'node') withType: RMQNode.
			
			"set the vhost"
			vhost := aModel selectOrAddEntityNamed: (aDictionnary at: 'vhost') withType: RMQVHost.
		  	vhost node ifNil:[ node vhosts add: vhost.	vhost node: node. ].
			
			messageId := ((aDictionnary at: 'properties') at: 'message_id'). 
			
			aModel allRMQMessages
		   detect: [ :el | el messageID  = messageId ]
		   ifFound: [ :elementFound | 
			messageObject := elementFound. ]
		   ifNone: [ 
			  messageObject := RMQMessage new. 
			  messageObject messageID: messageId.
			  messageObject mooseModel: aModel. 
			  aModel add: messageObject ].
		   
			messageObject timestamp: ((aDictionnary at: 'properties') at: 'timestamp').
			
			"set the connection"
			"to do : update regarding to new naming of connection "
			connection := aModel selectOrAddEntityNamed: (aDictionnary at: 'connection') withType: RMQConnection.
         (vhost connections anySatisfy: [ :e | e = connection ])
		   ifFalse: [ vhost connections add: connection. connection vhost: vhost ].
         
         "set the user"
         "to do : update to initialized connections ?"
			user := aModel selectOrAddEntityNamed: (aDictionnary at: 'user') withType: RMQUser.
			user usedConnections 
				detect: [:conn| conn = connection ]
				ifNone: [
					connection user: user.
					user usedConnections add: connection.
				].
			user vhosts 
				detect: [:vh| vh = vhost ]
				ifNone: [
					vhost users add: user.
					user vhosts add: vhost.
				].
			
			"channels name is connection + (+ channel+)"
			channel := aModel selectOrAddEntityNamed: ((aDictionnary at: 'connection'), ' (', ((aDictionnary at: 'channel') asStringWithCommas), ')' ) withType: RMQChannel.
			
			channel vhost ifNil:[
				vhost channels add: channel.
				channel vhost: vhost.
			].
			channel connection ifNil:[
				connection channels add: connection.
				channel connection: connection.
			].
			user usedChannels 
				detect: [:ch| ch = channel ]
				ifNone: [
					channel user: user.
					user usedChannels add: channel.
			].
			
			"set the exchange"
			exchange := aModel selectOrAddEntityNamed: ( aDictionnary at: 'exchange_name') withType: RMQExchange.
			exchange messages add: messageObject.
			messageObject exchange: exchange.
			exchange vhost ifNil:[ vhost exchanges add: exchange. exchange vhost: vhost. ].
		
			"message delivery mode"
			(((aDictionnary at: 'properties') at: 'delivery_mode') = 1) ifTrue: [ messageObject deliveryMode: (DeliveryMode nonPersistent) ]
			                                           ifFalse: [ messageObject deliveryMode: (DeliveryMode persistent) ].    
			 messageObject deliveryMode messages add: messageObject.          
					
          "set the publisher"        
			(aDictionnary at: 'properties') at: 'app_id' ifPresent:[
				component := aModel selectOrAddEntityNamed: ((aDictionnary at: 'properties') at: 'app_id') withType: RMQComponent.
				component senderMessages add: messageObject.
				messageObject senderComponent:component.
				
				tenant := aModel selectOrAddEntityNamed: (((aDictionnary at: 'properties') at: 'headers') at: 'X-TenantId') withType: RMQTenant. "to do : update !!"
				component tenants add: tenant. 
				tenant component: component. 
			
				component subscribedChannels 
					detect: [:ch| ch = channel ]
					ifNone: [
						component subscribedChannels add: channel.
						channel subscribedComponent: component.
					].
			
				component exchanges 
					detect: [:exch| exch = exchange ]
					ifNone: [
						component exchanges add: exchange.
						exchange components add: component.
					].
			].
		
		
		   "set the exchange format"
		   aModel allRMQExchangeFormats
		   detect: [ :el | el exchangeFormatSchema  = (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema') ]
		   ifFound: [ :elementFound | 
			exchangeFormat := elementFound. ]
		   ifNone: [ 
			  exchangeFormat := RMQExchangeFormat new. 
			  exchangeFormat exchangeFormatSchema: (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatSchema'). 
			  exchangeFormat exchangeFormatType: (((aDictionnary at: 'properties') at: 'headers') at: 'X-ExchangeFormatId').
			  exchangeFormat mooseModel: aModel.
		     aModel add: exchangeFormat].
		     messageObject exchangeFormat: exchangeFormat. 
		     exchangeFormat messages add: messageObject. 
		
	      "message type according to existance of routed_queues "
			aDictionnary at: 'routed_queues' ifPresent: [ messageObject messageType: (MessageType published). messageObject messageType messages add: messageObject ].
			aDictionnary at: 'routed_queues'  ifAbsent: [ messageObject messageType: (MessageType received). messageObject messageType messages add: messageObject. " to do : or set received to true !"
				                                         queue := aModel selectOrAddEntityNamed: resource withType: RMQQueue.
				                                         messageObject queue: queue.
				                                         queue sendedMessages add: messageObject.
				                                         queue vhost ifNil:[	vhost queues add: queue. queue vhost: vhost ].
				                                       ].
			
		   	
			" set routingKeys if the MM is updated "
			
		
			

			
	
]
