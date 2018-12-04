"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiChannels populate: model withJson: '[
    {
        ""reductions_details"": {
            ""rate"": 0
        },
        ""reductions"": 644848,
        ""message_stats"": {
            ""deliver_get_details"": {
                ""rate"": 0
            },
            ""deliver_get"": 573,
            ""ack_details"": {
                ""rate"": 0
            },
            ""ack"": 573,
            ""redeliver_details"": {
                ""rate"": 0
            },
            ""redeliver"": 0,
            ""deliver_no_ack_details"": {
                ""rate"": 0
            },
            ""deliver_no_ack"": 0,
            ""deliver_details"": {
                ""rate"": 0
            },
            ""deliver"": 573,
            ""get_no_ack_details"": {
                ""rate"": 0
            },
            ""get_no_ack"": 0,
            ""get_details"": {
                ""rate"": 0
            },
            ""get"": 0
        },
        ""user_who_performed_action"": ""bus-blsenior"",
        ""vhost"": ""/"",
        ""user"": ""bus-blsenior"",
        ""number"": 1,
        ""name"": ""10.238.15.51:49677 -> 10.238.28.5:5672 (1)"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connection_details"": {
            ""peer_host"": ""10.238.15.51"",
            ""peer_port"": 49677,
            ""name"": ""10.238.15.51:49677 -> 10.238.28.5:5672""
        },
        ""garbage_collection"": {
            ""minor_gcs"": 2,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""state"": ""running"",
        ""global_prefetch_count"": 0,
        ""prefetch_count"": 1,
        ""acks_uncommitted"": 0,
        ""messages_uncommitted"": 0,
        ""messages_unconfirmed"": 0,
        ""messages_unacknowledged"": 0,
        ""consumer_count"": 1,
        ""confirm"": false,
        ""transactional"": false,  
        ""idle_since"": ""2018-11-08 9:47:09""
    },
    {
        ""reductions_details"": {
            ""rate"": 0
        },
        ""reductions"": 41264,
        ""message_stats"": {
            ""deliver_get_details"": {
                ""rate"": 0
            },
            ""deliver_get"": 27,
            ""ack_details"": {
                ""rate"": 0
            },
            ""ack"": 27,
            ""redeliver_details"": {
                ""rate"": 0
            },
            ""redeliver"": 0,
            ""deliver_no_ack_details"": {
                ""rate"": 0
            },
            ""deliver_no_ack"": 0,
            ""deliver_details"": {
                ""rate"": 0
            },
            ""deliver"": 27,
            ""get_no_ack_details"": {
                ""rate"": 0
            },
            ""get_no_ack"": 0,
            ""get_details"": {
                ""rate"": 0
            },
            ""get"": 0
        },
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""number"": 1,
        ""name"": ""10.34.132.254:49779 -> 10.238.28.5:5672 (1)"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connection_details"": {
            ""peer_host"": ""10.34.132.254"",
            ""peer_port"": 49779,
            ""name"": ""10.34.132.254:49779 -> 10.238.28.5:5672""
        },
        ""garbage_collection"": {
            ""minor_gcs"": 2,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""state"": ""running"",
        ""global_prefetch_count"": 0,
        ""prefetch_count"": 1,
        ""acks_uncommitted"": 0,
        ""messages_uncommitted"": 0,
        ""messages_unconfirmed"": 0,
        ""messages_unacknowledged"": 0,
        ""consumer_count"": 1,
        ""confirm"": false,
        ""transactional"": false,
        ""idle_since"": ""2018-11-08 9:47:09""
    },
    {
        ""reductions_details"": {
            ""rate"": 0
        },
        ""reductions"": 110519,
        ""message_stats"": {
            ""deliver_get_details"": {
                ""rate"": 0
            },
            ""deliver_get"": 72,
            ""ack_details"": {
                ""rate"": 0
            },
            ""ack"": 72,
            ""redeliver_details"": {
                ""rate"": 0
            },
            ""redeliver"": 0,
            ""deliver_no_ack_details"": {
                ""rate"": 0
            },
            ""deliver_no_ack"": 0,
            ""deliver_details"": {
                ""rate"": 0
            },
            ""deliver"": 72,
            ""get_no_ack_details"": {
                ""rate"": 0
            },
            ""get_no_ack"": 0,
            ""get_details"": {
                ""rate"": 0
            },
            ""get"": 0
        },
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""number"": 1,
        ""name"": ""86.65.167.130:20245 -> 10.238.28.5:5672 (1)"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connection_details"": {
            ""peer_host"": ""86.65.167.130"",
            ""peer_port"": 20245,
            ""name"": ""86.65.167.130:20245 -> 10.238.28.5:5672""
        },
        ""garbage_collection"": {
            ""minor_gcs"": 2,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""state"": ""running"",
        ""global_prefetch_count"": 0,
        ""prefetch_count"": 1,
        ""acks_uncommitted"": 0,
        ""messages_uncommitted"": 0,
        ""messages_unconfirmed"": 0,
        ""messages_unacknowledged"": 0,
        ""consumer_count"": 1,
        ""confirm"": false,
        ""transactional"": false,
        ""idle_since"": ""2018-11-08 9:47:10""
    }
]'
"
Class {
	#name : #RMQRESTParserApiChannels,
	#superclass : #RMQRESTParser,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQRESTParserApiChannels class >> populate: aModel withJson: aString [
	| parser rmqObjects user channel vhost user_who_performed_action channelName node connection |
	parser := PPParserResource current
		parserAt: PPJsonParser.
	rmqObjects := parser parse: aString.
	

	rmqObjects do: [ :anObject |
		
		"(anObject at: 'consumer_count')."
		
		channelName := (anObject at: 'name').
		
		channel := aModel entityNamed: channelName withType: RMQChannel
			ifAbsent:[ 
				|newChannel |
				newChannel := RMQChannel new
					channel: channelName.
				aModel add: newChannel.
				
				newChannel ].
		
		
		(anObject at: 'confirm') ifTrue: [ 			channel	guaranteeMode: (GuaranteeMode confirm).
			channel guaranteeMode channels add: channel].
		 
		(anObject at: 'transactional')ifTrue: [ 			channel	guaranteeMode: (GuaranteeMode transactional).
			channel guaranteeMode channels add: channel].
		
		(anObject at: 'state') = 'running' ifTrue: [ 			channel	rmqState: (State running).
			channel rmqState channels add: channel].
		
		(anObject at: 'state') = 'idle' ifTrue: [ 			channel	rmqState: (State idle).
			channel rmqState channels add: channel].
		
		(anObject at: 'state') = 'other' ifTrue: [ 			channel	rmqState: (State other).
			channel rmqState channels add: channel].
		
		channel idleSince: (anObject at: 'idle_since').
		
		user_who_performed_action := aModel entityNamed: (anObject at: 'user_who_performed_action') withType: RMQUser
			ifAbsent:[   
				|newUser |
				newUser := RMQUser new
					userString: (anObject at: 'user_who_performed_action').
				aModel add: newUser.
				newUser ].
		channel user_who_performed_connection:  user_who_performed_action.
		user_who_performed_action initializedChannels add: channel.
		
		
		user := aModel entityNamed: (anObject at: 'user') withType: RMQUser
			ifAbsent:[   
				|newUser |
				newUser := RMQUser new
					userString: (anObject at: 'user').
				aModel add: newUser.
				newUser ].
		channel users add: user.
		user usedChannels add: channel.
		
		
		
		vhost := aModel entityNamed: (anObject at: 'vhost') withType: RMQVHost
			ifAbsent:[  
				|newVhost |
				newVhost := RMQVHost new
					vhostString: (anObject at: 'vhost').
				aModel add: newVhost.
				newVhost ].
		channel vhost: vhost.
		vhost channels add: channel.
		
		node := aModel entityNamed: (anObject at: 'node') withType: RMQNode
			ifAbsent:[  
				|newNode |
				newNode := RMQNode new
					nodeString: (anObject at: 'node').
				aModel add: newNode.
				vhost node: newNode.
				newNode vhosts add: vhost.
				newNode ].
		
		
		
		connection := aModel entityNamed: ((anObject at: 'connection_details') at: 'name') withType: RMQConnection
			ifAbsent:[  
				|newConnection |
				newConnection := RMQConnection new
					connectionString: ((anObject at: 'connection_details') at: 'name').
				aModel add: newConnection.
				newConnection ].
		connection peerHost: ((anObject at: 'connection_details') at: 'peer_host').
		connection peerPort: ((anObject at: 'connection_details') at: 'peer_port').
	]
]
