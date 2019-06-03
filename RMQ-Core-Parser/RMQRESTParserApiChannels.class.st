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
	#superclass : #RMQParser,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQRESTParserApiChannels >> populate: aModel withJson: aString [
	| parser rmqObjects user channel vhost user_who_performed_action channelName node connection |
	parser := PPParserResource current parserAt: PPJsonParser.
	sourceName := aString.
	rmqObjects := parser parse: aString.
	rmqObjects
		do: [ :anObject | 
			"(anObject at: 'consumer_count')."
			channelName := anObject at: 'name'.
			channel := aModel
				selectOrAddEntityNamed: channelName
				withType: PulseChannel
				sourceName: self sourceName.
			(anObject at: 'confirm')
				ifTrue: [ channel guaranteeMode: PulseGuaranteeMode confirm.
					channel guaranteeMode channels add: channel ].
			(anObject at: 'transactional')
				ifTrue: [ channel guaranteeMode: PulseGuaranteeMode transactional.
					channel guaranteeMode channels add: channel ].
			(anObject at: 'state') = 'running'
				ifTrue: [ channel pulseState: PulseState running.
					channel pulseState channels add: channel ].
			(anObject at: 'state') = 'idle'
				ifTrue: [ channel pulseState: PulseState idle.
					channel pulseState channels add: channel ].
			(anObject at: 'state') = 'other'
				ifTrue: [ channel pulseState: PulseState other.
					channel pulseState channels add: channel ].
			channel idleSince: (anObject at: 'idle_since').
			user_who_performed_action := aModel
				selectOrAddEntityNamed: (anObject at: 'user_who_performed_action')
				withType: PulseUser
				sourceName: self sourceName.
			channel user_who_performed_connection: user_who_performed_action.
			user_who_performed_action initializedChannels add: channel.
			user := aModel
				selectOrAddEntityNamed: (anObject at: 'user')
				withType: PulseUser
				sourceName: self sourceName.
			channel user: user.
			user usedChannels add: channel.
			vhost := aModel
				selectOrAddEntityNamed: (anObject at: 'vhost')
				withType: PulseVHost
				sourceName: self sourceName.
			channel vhost: vhost.
			vhost channels add: channel.
			node := aModel
				entityNamed: (anObject at: 'node')
				withType: PulseNode
				ifAbsent: [ | newNode |
					newNode := PulseNode new
						pulseName: (anObject at: 'node');
						mooseModel: aModel.
					vhost node: newNode.
					newNode vhosts add: vhost.
					newNode ].
			connection := aModel
				selectOrAddEntityNamed: ((anObject at: 'connection_details') at: 'name')
				withType: PulseConnection
				sourceName: self sourceName.
			connection
				peerHost: ((anObject at: 'connection_details') at: 'peer_host').
			connection
				peerPort: ((anObject at: 'connection_details') at: 'peer_port').
			connection
				host:
					((((anObject at: 'connection_details') at: 'name') substrings: '->')
						second substrings: ':') first withBlanksCondensed.	"'10.238.15.51:49677 -> 10.238.28.5:5672'"
			connection
				port:
					((((anObject at: 'connection_details') at: 'name') substrings: '->')
						second substrings: ':') second withBlanksCondensed asInteger.	"'10.238.15.51:49677 -> 10.238.28.5:5672'"
			connection channels add: channel.
			channel connection: connection.
			connection user: user.
			user usedConnections add: connection ]
]
