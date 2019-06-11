Class {
	#name : #PulseRESTParserTestApiChannels,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #accessing }
PulseRESTParserTestApiChannels >> data [
	^ '[
    {
        "reductions_details": {
            "rate": 0
        },
        "reductions": 644848,
        "message_stats": {
            "deliver_get_details": {
                "rate": 0
            },
            "deliver_get": 573,
            "ack_details": {
                "rate": 0
            },
            "ack": 573,
            "redeliver_details": {
                "rate": 0
            },
            "redeliver": 0,
            "deliver_no_ack_details": {
                "rate": 0
            },
            "deliver_no_ack": 0,
            "deliver_details": {
                "rate": 0
            },
            "deliver": 573,
            "get_no_ack_details": {
                "rate": 0
            },
            "get_no_ack": 0,
            "get_details": {
                "rate": 0
            },
            "get": 0
        },
        "user_who_performed_action": "bus-blsenior",
        "vhost": "/",
        "user": "bus-blsenior",
        "number": 1,
        "name": "10.238.15.51:49677 -> 10.238.28.5:5672 (1)",
        "node": "rabbit@CSLSAASRBS1",
        "connection_details": {
            "peer_host": "10.238.15.51",
            "peer_port": 49677,
            "name": "10.238.15.51:49677 -> 10.238.28.5:5672"
        },
        "garbage_collection": {
            "minor_gcs": 2,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "state": "running",
        "global_prefetch_count": 0,
        "prefetch_count": 1,
        "acks_uncommitted": 0,
        "messages_uncommitted": 0,
        "messages_unconfirmed": 0,
        "messages_unacknowledged": 0,
        "consumer_count": 1,
        "confirm": false,
        "transactional": false,  
        "idle_since": "2018-11-08 9:47:09"
    },
    {
        "reductions_details": {
            "rate": 0
        },
        "reductions": 41264,
        "message_stats": {
            "deliver_get_details": {
                "rate": 0
            },
            "deliver_get": 27,
            "ack_details": {
                "rate": 0
            },
            "ack": 27,
            "redeliver_details": {
                "rate": 0
            },
            "redeliver": 0,
            "deliver_no_ack_details": {
                "rate": 0
            },
            "deliver_no_ack": 0,
            "deliver_details": {
                "rate": 0
            },
            "deliver": 27,
            "get_no_ack_details": {
                "rate": 0
            },
            "get_no_ack": 0,
            "get_details": {
                "rate": 0
            },
            "get": 0
        },
        "user_who_performed_action": "bus-consolesaas",
        "vhost": "/",
        "user": "bus-consolesaas",
        "number": 1,
        "name": "10.34.132.254:49779 -> 10.238.28.5:5672 (1)",
        "node": "rabbit@CSLSAASRBS1",
        "connection_details": {
            "peer_host": "10.34.132.254",
            "peer_port": 49779,
            "name": "10.34.132.254:49779 -> 10.238.28.5:5672"
        },
        "garbage_collection": {
            "minor_gcs": 2,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "state": "running",
        "global_prefetch_count": 0,
        "prefetch_count": 1,
        "acks_uncommitted": 0,
        "messages_uncommitted": 0,
        "messages_unconfirmed": 0,
        "messages_unacknowledged": 0,
        "consumer_count": 1,
        "confirm": false,
        "transactional": false,
        "idle_since": "2018-11-08 9:47:09"
    },
    {
        "reductions_details": {
            "rate": 0
        },
        "reductions": 110519,
        "message_stats": {
            "deliver_get_details": {
                "rate": 0
            },
            "deliver_get": 72,
            "ack_details": {
                "rate": 0
            },
            "ack": 72,
            "redeliver_details": {
                "rate": 0
            },
            "redeliver": 0,
            "deliver_no_ack_details": {
                "rate": 0
            },
            "deliver_no_ack": 0,
            "deliver_details": {
                "rate": 0
            },
            "deliver": 72,
            "get_no_ack_details": {
                "rate": 0
            },
            "get_no_ack": 0,
            "get_details": {
                "rate": 0
            },
            "get": 0
        },
        "user_who_performed_action": "bus-consolesaas",
        "vhost": "/",
        "user": "bus-consolesaas",
        "number": 1,
        "name": "86.65.167.130:20245 -> 10.238.28.5:5672 (1)",
        "node": "rabbit@CSLSAASRBS1",
        "connection_details": {
            "peer_host": "86.65.167.130",
            "peer_port": 20245,
            "name": "86.65.167.130:20245 -> 10.238.28.5:5672"
        },
        "garbage_collection": {
            "minor_gcs": 2,
            "fullsweep_after": 65535,
            "min_heap_size": 233,
            "min_bin_vheap_size": 46422,
            "max_heap_size": 0
        },
        "state": "running",
        "global_prefetch_count": 0,
        "prefetch_count": 1,
        "acks_uncommitted": 0,
        "messages_uncommitted": 0,
        "messages_unconfirmed": 0,
        "messages_unacknowledged": 0,
        "consumer_count": 1,
        "confirm": false,
        "transactional": false,
        "idle_since": "2018-11-08 9:47:10"
    }
]'.
]

{ #category : #initialization }
PulseRESTParserTestApiChannels >> setUp [

	| logP |
	model := PulseModel new.
	model name: 'test'.
	logP := PulseRESTParserApiChannels newOn: 'test'.
	logP populate: model withJson: self data.
	
	
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiChannels >> testExistingPopulate [

	| vh ch1 ch2 u1 u2 c1 c2 node logP |
	
	self assert: model size = 11.
	"channels"
	self assert: model allPulseChannels size = 3.
	ch1 := (model allPulseChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allPulseChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	self assert: ch1 guaranteeMode name = 'none'. 
	self assert: (ch1 guaranteeMode channels anySatisfy: [ :e | e =ch1 ]).
	self assert: ch2 guaranteeMode name = 'none'. 
	self assert: (ch2 guaranteeMode channels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: ch1 pulseState name = 'running'.
	self assert: (ch1 pulseState channels anySatisfy: [:e | e = ch1 ]).
	self assert: ch1 idleSince = '2018-11-08 9:47:09'.	
	
	self assert: ch2 pulseState name = 'running'.
	self assert: (ch2 pulseState channels anySatisfy: [:e | e = ch2 ]).
	self assert: ch2 idleSince = '2018-11-08 9:47:09'.	
		
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 initializedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 initializedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user_who_performed_connection = u1 ).
	self assert: (ch2 user_who_performed_connection =u2).
	
	"channels vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (ch1 vhost = vh).
	self assert: (ch2 vhost = vh).
	self assert: (vh channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (vh channels anySatisfy: [ :e | e =ch2 ]).  

	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	
	"connection"
	self assert: model allPulseConnections size = 3.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	
	"connection channels"
	self assert: (c1 channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (c2 channels anySatisfy: [ :e | e =ch2 ]).
	self assert: ch1 connection = c1.
	self assert: ch2 connection = c2.	
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2 ).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).
	self assert: model size = 11.
	
	logP := PulseRESTParserApiChannels newOn: 'test2'.
	logP populate: model withJson: self data.
	
	
	self assert: model size = 11.
	"channels"
	self assert: model allPulseChannels size = 3.
	ch1 := (model allPulseChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allPulseChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	self assert: ch1 guaranteeMode name = 'none'. 
	self assert: (ch1 guaranteeMode channels anySatisfy: [ :e | e =ch1 ]).
	self assert: ch2 guaranteeMode name = 'none'. 
	self assert: (ch2 guaranteeMode channels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: ch1 pulseState name = 'running'.
	self assert: (ch1 pulseState channels anySatisfy: [:e | e = ch1 ]).
	self assert: ch1 idleSince = '2018-11-08 9:47:09'.	
	
	self assert: ch2 pulseState name = 'running'.
	self assert: (ch2 pulseState channels anySatisfy: [:e | e = ch2 ]).
	self assert: ch2 idleSince = '2018-11-08 9:47:09'.	
		
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 initializedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 initializedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user_who_performed_connection = u1 ).
	self assert: (ch2 user_who_performed_connection =u2).
	
	"channels vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (ch1 vhost = vh).
	self assert: (ch2 vhost = vh).
	self assert: (vh channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (vh channels anySatisfy: [ :e | e =ch2 ]).  

	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	
	"connection"
	self assert: model allPulseConnections size = 3.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	
	"connection channels"
	self assert: (c1 channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (c2 channels anySatisfy: [ :e | e =ch2 ]).
	self assert: ch1 connection = c1.
	self assert: ch2 connection = c2.	
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2 ).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).

]

{ #category : #'testing - simple' }
PulseRESTParserTestApiChannels >> testPopulate [

	| vh ch1 ch2 u1 u2 c1 c2 node |
	
	"channels"
	self assert: model allPulseChannels size = 3.
	ch1 := (model allPulseChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allPulseChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	self assert: ch1 guaranteeMode name = 'none'. 
	self assert: (ch1 guaranteeMode channels anySatisfy: [ :e | e =ch1 ]).
	self assert: ch2 guaranteeMode name = 'none'. 
	self assert: (ch2 guaranteeMode channels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: ch1 pulseState name = 'running'.
	self assert: (ch1 pulseState channels anySatisfy: [:e | e = ch1 ]).
	self assert: ch1 idleSince = '2018-11-08 9:47:09'.	
	
	self assert: ch2 pulseState name = 'running'.
	self assert: (ch2 pulseState channels anySatisfy: [:e | e = ch2 ]).
	self assert: ch2 idleSince = '2018-11-08 9:47:09'.	
		
	"users"
	self assert: model allPulseUsers size = 2.
	u1 := (model allPulseUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 initializedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 initializedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user_who_performed_connection = u1 ).
	self assert: (ch2 user_who_performed_connection =u2).
	
	"channels vhost"
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (ch1 vhost = vh).
	self assert: (ch2 vhost = vh).
	self assert: (vh channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (vh channels anySatisfy: [ :e | e =ch2 ]).  

	"node"
	"node vhost"
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	
	"connection"
	self assert: model allPulseConnections size = 3.
	c1 := (model allPulseConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allPulseConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	self assert: c1 host = '10.238.28.5'. 
	self assert: c1 port = 5672.
	
	"connection channels"
	self assert: (c1 channels anySatisfy: [ :e | e =ch1 ]).
	self assert: (c2 channels anySatisfy: [ :e | e =ch2 ]).
	self assert: ch1 connection = c1.
	self assert: ch2 connection = c2.	
	
	"connection users"
	self assert: (c1 user =u1 ).
	self assert: (c2 user =u2 ).
	self assert: (u1 usedConnections anySatisfy: [ :e | e =c1 ]).
	self assert: (u2 usedConnections anySatisfy: [ :e | e =c2 ]).
	
	self assert: model size = 11.
	
	
]
