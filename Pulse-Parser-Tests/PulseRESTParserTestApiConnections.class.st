Class {
	#name : #PulseRESTParserTestApiConnections,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #accessing }
PulseRESTParserTestApiConnections >> data [
	^ '[
    {
        "reductions_details": {
            "rate": 193.8
        },
        "reductions": 474189394,
        "recv_oct_details": {
            "rate": 1.6
        },
        "recv_oct": 718809,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 2551548,
        "user_who_performed_action": "bus-blsenior",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1539017432474,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-blsenior",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "10.238.15.51",
        "host": "10.238.28.5",
        "peer_port": 49677,
        "port": 5672,
        "name": "10.238.15.51:49677 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 299,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 1,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 44765,
        "recv_cnt": 88798
    },
    {
        "reductions_details": {
            "rate": 174.8
        },
        "reductions": 594585,
        "recv_oct_details": {
            "rate": 0
        },
        "recv_oct": 1314,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 967,
        "user_who_performed_action": "bus-consolesaas",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1541672156404,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-consolesaas",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "10.238.28.3",
        "host": "10.238.28.5",
        "peer_port": 48700,
        "port": 5672,
        "name": "10.238.28.3:48700 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 148,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 0,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 58,
        "recv_cnt": 112
    },
    {
        "reductions_details": {
            "rate": 87.4
        },
        "reductions": 307761,
        "recv_oct_details": {
            "rate": 0
        },
        "recv_oct": 8816,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 1047,
        "user_who_performed_action": "bus-consolesaas",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1541672156509,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-consolesaas",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "10.238.28.3",
        "host": "10.238.28.5",
        "peer_port": 48702,
        "port": 5672,
        "name": "10.238.28.3:48702 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 12,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 0,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 63,
        "recv_cnt": 119
    },
    {
        "reductions_details": {
            "rate": 93.6
        },
        "reductions": 306425,
        "recv_oct_details": {
            "rate": 0
        },
        "recv_oct": 1314,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 967,
        "user_who_performed_action": "bus-consolesaas",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1541672156519,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-consolesaas",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "10.238.28.3",
        "host": "10.238.28.5",
        "peer_port": 48704,
        "port": 5672,
        "name": "10.238.28.3:48704 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 1,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 0,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 58,
        "recv_cnt": 113
    },
    {
        "reductions_details": {
            "rate": 174.8
        },
        "reductions": 1662937,
        "recv_oct_details": {
            "rate": 0
        },
        "recv_oct": 3918,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 112677,
        "user_who_performed_action": "bus-consolesaas",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1541666189342,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-consolesaas",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "10.34.132.254",
        "host": "10.238.28.5",
        "peer_port": 49779,
        "port": 5672,
        "name": "10.34.132.254:49779 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 10,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 1,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 189,
        "recv_cnt": 332
    },
    {
        "reductions_details": {
            "rate": 174.8
        },
        "reductions": 38365077,
        "recv_oct_details": {
            "rate": 0
        },
        "recv_oct": 59156,
        "send_oct_details": {
            "rate": 0
        },
        "send_oct": 310661,
        "user_who_performed_action": "bus-consolesaas",
        "node": "rabbit@CSLSAASRBS1",
        "connected_at": 1541460446474,
        "client_properties": {
            "capabilities": {
                "authentication_failure_close": true,
                "basic.nack": true,
                "connection.blocked": true,
                "consumer_cancel_notify": true,
                "exchange_exchange_bindings": true,
                "publisher_confirms": true
            },
            "copyright": "Copyright (C) 2007-2015 Pivotal Software, Inc.",
            "information": "Licensed under the MPL. See http://www.rabbitmq.com/",
            "platform": "Java",
            "product": "RabbitMQ",
            "version": "3.5.6"
        },
        "channel_max": 0,
        "frame_max": 131072,
        "timeout": 60,
        "vhost": "/",
        "user": "bus-consolesaas",
        "protocol": "AMQP 0-9-1",
        "ssl_hash": null,
        "ssl_cipher": null,
        "ssl_key_exchange": null,
        "ssl_protocol": null,
        "auth_mechanism": "PLAIN",
        "peer_cert_validity": null,
        "peer_cert_issuer": null,
        "peer_cert_subject": null,
        "ssl": false,
        "peer_host": "86.65.167.130",
        "host": "10.238.28.5",
        "peer_port": 20245,
        "port": 5672,
        "name": "86.65.167.130:20245 -> 10.238.28.5:5672",
        "type": "network",
        "garbage_collection": {
            "minor_gcs": 270,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "channels": 1,
        "state": "running",
        "send_pend": 0,
        "send_cnt": 3649,
        "recv_cnt": 7196
    }
]'.
]

{ #category : #initialization }
PulseRESTParserTestApiConnections >> setUp [
	| logP |
	model := PulseModel new.
	model name: 'test'.
	logP := PulseRESTParserApiConnections newOn: 'test'.
	logP populate: model withJson: self data.
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiConnections >> testExistingPopulate [

	| vh u1 u2 c1 c2 node logP |
	
	self assert: model size = 11.
	"connection"
	self assert: model allPulseConnections size = 6.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	self assert: c1 connectedAt = 1539017432474.
	
	self assert: c1 sslProtocol = nil.
	self assert: c1 ssl = false.
	self assert: c1 sslHash = nil.
	self assert: c1 protocol = 'AMQP 0-9-1'.
	
	
	self assert: c1 authMechanism pulseState = 'plain'. 
	self assert: (c1 authMechanism connections anySatisfy: [ :e | e =c1 ]).
	self assert: c2 authMechanism pulseState = 'plain'. 
	self assert: (c2 authMechanism connections anySatisfy: [ :e | e =c2 ]).
	
	"vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (c1 vhost = vh).
	self assert: (c2 vhost = vh).
	self assert: (vh connections anySatisfy: [ :e | e =c1 ]).
	self assert: (vh connections anySatisfy: [ :e | e =c2 ]). 
	
	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).
	
	self assert: c1 pulseState pulseState = 'running'.
	self assert: (c1 pulseState connections anySatisfy: [:e | e = c1 ]).
	self assert: c2 pulseState pulseState = 'running'.
	self assert: (c2 pulseState connections anySatisfy: [:e | e = c2 ]).	
	
	self assert: model size = 11.
	
	logP := PulseRESTParserApiConnections newOn: 'test2'.
	logP populate: model withJson: self data.

	self assert: model size = 11.
	
	"connection"
	self assert: model allPulseConnections size = 6.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	self assert: c1 connectedAt = 1539017432474.
	
	self assert: c1 sslProtocol = nil.
	self assert: c1 ssl = false.
	self assert: c1 sslHash = nil.
	self assert: c1 protocol = 'AMQP 0-9-1'.
	
	
	self assert: c1 authMechanism pulseState = 'plain'. 
	self assert: (c1 authMechanism connections anySatisfy: [ :e | e =c1 ]).
	self assert: c2 authMechanism pulseState = 'plain'. 
	self assert: (c2 authMechanism connections anySatisfy: [ :e | e =c2 ]).
	
	"vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (c1 vhost = vh).
	self assert: (c2 vhost = vh).
	self assert: (vh connections anySatisfy: [ :e | e =c1 ]).
	self assert: (vh connections anySatisfy: [ :e | e =c2 ]). 
	
	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).
	
	self assert: c1 pulseState pulseState = 'running'.
	self assert: (c1 pulseState connections anySatisfy: [:e | e = c1 ]).
	self assert: c2 pulseState pulseState = 'running'.
	self assert: (c2 pulseState connections anySatisfy: [:e | e = c2 ]).	
	
	self assert: model size = 11.
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiConnections >> testPopulate [

	| vh u1 u2 c1 c2 node |
	
	"connection"
	self assert: model allPulseConnections size = 6.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	self assert: c1 connectedAt = 1539017432474.
	
	self assert: c1 sslProtocol = nil.
	self assert: c1 ssl = false.
	self assert: c1 sslHash = nil.
	self assert: c1 protocol = 'AMQP 0-9-1'.
	
	
	self assert: c1 authMechanism pulseState = 'plain'. 
	self assert: (c1 authMechanism connections anySatisfy: [ :e | e =c1 ]).
	self assert: c2 authMechanism pulseState = 'plain'. 
	self assert: (c2 authMechanism connections anySatisfy: [ :e | e =c2 ]).
	
	"vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (c1 vhost = vh).
	self assert: (c2 vhost = vh).
	self assert: (vh connections anySatisfy: [ :e | e =c1 ]).
	self assert: (vh connections anySatisfy: [ :e | e =c2 ]). 
	
	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2 ).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).
	
	self assert: c1 pulseState pulseState = 'running'.
	self assert: (c1 pulseState connections anySatisfy: [:e | e = c1 ]).
	self assert: c2 pulseState pulseState = 'running'.
	self assert: (c2 pulseState connections anySatisfy: [:e | e = c2 ]).	
	
	self assert: model size = 11.
	
]
