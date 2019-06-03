"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiConnections populate: model withJson: '[
    {
        ""reductions_details"": {
            ""rate"": 193.8
        },
        ""reductions"": 474189394,
        ""recv_oct_details"": {
            ""rate"": 1.6
        },
        ""recv_oct"": 718809,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 2551548,
        ""user_who_performed_action"": ""bus-blsenior"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1539017432474,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-blsenior"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""10.238.15.51"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 49677,
        ""port"": 5672,
        ""name"": ""10.238.15.51:49677 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 299,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 1,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 44765,
        ""recv_cnt"": 88798
    },
    {
        ""reductions_details"": {
            ""rate"": 174.8
        },
        ""reductions"": 594585,
        ""recv_oct_details"": {
            ""rate"": 0
        },
        ""recv_oct"": 1314,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 967,
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1541672156404,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""10.238.28.3"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 48700,
        ""port"": 5672,
        ""name"": ""10.238.28.3:48700 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 148,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 0,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 58,
        ""recv_cnt"": 112
    },
    {
        ""reductions_details"": {
            ""rate"": 87.4
        },
        ""reductions"": 307761,
        ""recv_oct_details"": {
            ""rate"": 0
        },
        ""recv_oct"": 8816,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 1047,
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1541672156509,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""10.238.28.3"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 48702,
        ""port"": 5672,
        ""name"": ""10.238.28.3:48702 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 12,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 0,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 63,
        ""recv_cnt"": 119
    },
    {
        ""reductions_details"": {
            ""rate"": 93.6
        },
        ""reductions"": 306425,
        ""recv_oct_details"": {
            ""rate"": 0
        },
        ""recv_oct"": 1314,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 967,
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1541672156519,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""10.238.28.3"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 48704,
        ""port"": 5672,
        ""name"": ""10.238.28.3:48704 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 1,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 0,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 58,
        ""recv_cnt"": 113
    },
    {
        ""reductions_details"": {
            ""rate"": 174.8
        },
        ""reductions"": 1662937,
        ""recv_oct_details"": {
            ""rate"": 0
        },
        ""recv_oct"": 3918,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 112677,
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1541666189342,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""10.34.132.254"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 49779,
        ""port"": 5672,
        ""name"": ""10.34.132.254:49779 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 10,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 1,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 189,
        ""recv_cnt"": 332
    },
    {
        ""reductions_details"": {
            ""rate"": 174.8
        },
        ""reductions"": 38365077,
        ""recv_oct_details"": {
            ""rate"": 0
        },
        ""recv_oct"": 59156,
        ""send_oct_details"": {
            ""rate"": 0
        },
        ""send_oct"": 310661,
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""node"": ""rabbit@CSLSAASRBS1"",
        ""connected_at"": 1541460446474,
        ""client_properties"": {
            ""capabilities"": {
                ""authentication_failure_close"": true,
                ""basic.nack"": true,
                ""connection.blocked"": true,
                ""consumer_cancel_notify"": true,
                ""exchange_exchange_bindings"": true,
                ""publisher_confirms"": true
            },
            ""copyright"": ""Copyright (C) 2007-2015 Pivotal Software, Inc."",
            ""information"": ""Licensed under the MPL. See http://www.rabbitmq.com/"",
            ""platform"": ""Java"",
            ""product"": ""RabbitMQ"",
            ""version"": ""3.5.6""
        },
        ""channel_max"": 0,
        ""frame_max"": 131072,
        ""timeout"": 60,
        ""vhost"": ""/"",
        ""user"": ""bus-consolesaas"",
        ""protocol"": ""AMQP 0-9-1"",
        ""ssl_hash"": null,
        ""ssl_cipher"": null,
        ""ssl_key_exchange"": null,
        ""ssl_protocol"": null,
        ""auth_mechanism"": ""PLAIN"",
        ""peer_cert_validity"": null,
        ""peer_cert_issuer"": null,
        ""peer_cert_subject"": null,
        ""ssl"": false,
        ""peer_host"": ""86.65.167.130"",
        ""host"": ""10.238.28.5"",
        ""peer_port"": 20245,
        ""port"": 5672,
        ""name"": ""86.65.167.130:20245 -> 10.238.28.5:5672"",
        ""type"": ""network"",
        ""garbage_collection"": {
            ""minor_gcs"": 270,
            ""fullsweep_after"": 65535,
            ""min_heap_size"": 233,
            ""min_bin_vheap_size"": 46422,
            ""max_heap_size"": 0
        },
        ""channels"": 1,
        ""state"": ""running"",
        ""send_pend"": 0,
        ""send_cnt"": 3649,
        ""recv_cnt"": 7196
    }
]'
"
Class {
	#name : #RMQRESTParserApiConnections,
	#superclass : #RMQParser,
	#category : #'RMQ-Core-Parser'
}

{ #category : #parsing }
RMQRESTParserApiConnections >> populate: aModel withJson: aString [
	| parser rmqObjects connectionName connection vhost node user user_who_performed_action |
	parser := PPParserResource current parserAt: PPJsonParser.
	sourceName := aString.
	rmqObjects := parser parse: aString.
	rmqObjects
		do: [ :anObject | 
			connectionName := anObject at: 'name'.
			connection := aModel
				selectOrAddEntityNamed: connectionName
				withType: PulseConnection
				sourceName: self sourceName.
			connection host: (anObject at: 'host').
			connection port: (anObject at: 'port').
			connection peerHost: (anObject at: 'peer_host').
			connection peerPort: (anObject at: 'peer_port').
			connection connectedAt: (anObject at: 'connected_at').
			(anObject at: 'auth_mechanism') = 'PLAIN'
				ifTrue: [ connection authMechanism: PulseAuthMechanism plain.
					"connection authMechanism connections add: connection" ].
			(anObject at: 'auth_mechanism') = 'AMQPLAIN'
				ifTrue: [ connection authMechanism: PulseAuthMechanism amqPlain.
					"connection authMechanism connections add: connection" ].
			(anObject at: 'auth_mechanism') = 'RABBIT_CR_DEMO'
				ifTrue: [ connection authMechanism: PulseAuthMechanism rabbit_cr_demo.
					"connection authMechanism connections add: connection" ].
			connection sslProtocol: (anObject at: 'ssl_protocol').
			connection ssl: (anObject at: 'ssl').
			connection sslHash: (anObject at: 'ssl_hash').
			connection protocol: (anObject at: 'protocol').
			vhost := aModel
				selectOrAddEntityNamed: (anObject at: 'vhost')
				withType: PulseVHost
				sourceName: self sourceName.
			connection vhost: vhost.
			"vhost connections add: connection."
			node := aModel
				entityNamed: (anObject at: 'node')
				withType: PulseNode
				ifAbsent: [ | newNode |
					newNode := PulseNode new
						pulseName: (anObject at: 'node');
						mooseModel: aModel.
					vhost node: newNode.
					"newNode vhosts add: vhost."
					newNode ].
			user := aModel
				selectOrAddEntityNamed: (anObject at: 'user')
				withType: PulseUser
				sourceName: self sourceName.
			connection user: user.
			"user usedConnections add: connection."
			user_who_performed_action := aModel
				selectOrAddEntityNamed: (anObject at: 'user_who_performed_action')
				withType: PulseUser
				sourceName: self sourceName.
			connection user_who_performed_connection: user_who_performed_action.
			"user_who_performed_action initializedConnections add: connection."
			(anObject at: 'state') = 'running'
				ifTrue: [ connection pulseState: PulseState running.
					"connection pulseState connections add: connection" ].
			(anObject at: 'state') = 'idle'
				ifTrue: [ connection pulseState: PulseState idle.
					"connection pulseState connections add: connection" ].
			(anObject at: 'state') = 'other'
				ifTrue: [ connection pulseState: PulseState other.
					"connection pulseState connections add: connection" ] ]
]
