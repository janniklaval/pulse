Class {
	#name : #RMQRESTParserTestApiConsumers,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #accessing }
RMQRESTParserTestApiConsumers >> data [
	^ '[
    {
        "arguments": {},
        "prefetch_count": 1,
        "ack_required": true,
        "exclusive": false,
        "consumer_tag": "0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe",
        "channel_details": {
            "peer_host": "86.65.167.130",
            "peer_port": 20245,
            "connection_name": "86.65.167.130:20245 -> 10.238.28.5:5672",
            "user": "bus-consolesaas",
            "number": 1,
            "node": "rabbit@CSLSAASRBS1",
            "name": "86.65.167.130:20245 -> 10.238.28.5:5672 (1)"
        },
        "queue": {
            "vhost": "/",
            "name": "pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe"
        }
    },
    {
        "arguments": {},
        "prefetch_count": 1,
        "ack_required": true,
        "exclusive": false,
        "consumer_tag": "f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe",
        "channel_details": {
            "peer_host": "10.238.15.51",
            "peer_port": 49677,
            "connection_name": "10.238.15.51:49677 -> 10.238.28.5:5672",
            "user": "bus-blsenior",
            "number": 1,
            "node": "rabbit@CSLSAASRBS1",
            "name": "10.238.15.51:49677 -> 10.238.28.5:5672 (1)"
        },
        "queue": {
            "vhost": "/",
            "name": "pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe"
        }
    },
    {
        "arguments": {},
        "prefetch_count": 1,
        "ack_required": true,
        "exclusive": false,
        "consumer_tag": "f9a05ed0-674f-3b9f-b407-972fc7f60fbe.pubsub.default.consoleSaasUserAccess.logger-default.subscribe",
        "channel_details": {
            "peer_host": "10.34.132.254",
            "peer_port": 49779,
            "connection_name": "10.34.132.254:49779 -> 10.238.28.5:5672",
            "user": "bus-consolesaas",
            "number": 1,
            "node": "rabbit@CSLSAASRBS1",
            "name": "10.34.132.254:49779 -> 10.238.28.5:5672 (1)"
        },
        "queue": {
            "vhost": "/",
            "name": "pubsub.default.consoleSaasUserAccess.logger-default.subscribe"
        }
    }
]'.
]

{ #category : #initialization }
RMQRESTParserTestApiConsumers >> setUp [

	model := PulseModel new.
	model name: 'test'.
	RMQRESTParserApiConsumers populate: model withJson: self data.
	
	
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiConsumers >> testExistingPopulate [

	| t1 t2 vh ch1 ch2 q1 q2 u1 u2 c1 c2 node |
	self assert: model size = 16.
	self assert: model allRMQComponents size = 3.
	
	
	self assert: (model allRMQComponents anySatisfy: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe']).
	self assert: (model allRMQComponents anySatisfy: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	
	t1 := model allRMQComponents detect: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe'].
	t2 := model allRMQComponents detect: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe'].

	self assert: t1 ackRequired = true.
	self assert: t2 ackRequired = true.
	
	self assert: t1 exclusive = false.
	self assert: t2 exclusive = false.

	"channels"
	self assert: model allRMQChannels size = 3.
	ch1 := (model allRMQChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allRMQChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	" queue channels"
	self assert: model allRMQQueues size = 3.
	q1 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	q2 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.logger-default.subscribe']).
	self assert: (ch1 consumedQueues anySatisfy: [ :e | e =q1 ]).
	self assert: (ch2 consumedQueues anySatisfy: [ :e | e =q2 ]).
	self assert: (q1 consumerChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (q2 consumerChannels anySatisfy: [ :e | e =ch2 ]).
		
	"queue + vhost"
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (q1 vhost = vh).
	self assert: (q2 vhost = vh).
		
	"users"
	self assert: model allRMQUsers size = 2.
	u1 := (model allRMQUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allRMQUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 usedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 usedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user =u1).
	self assert: (ch2 user=u2 ).
	
	"connection"
	self assert: model allRMQConnections size = 3.
	c1 := (model allRMQConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allRMQConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	
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
	
	"node"
	"node vhost"
	node := (model allRMQNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	RMQRESTParserApiConsumers populate: model withJson: self data.
	
	self assert: model size = 16.
	self assert: model allRMQComponents size = 3.
	
	
	self assert: (model allRMQComponents anySatisfy: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe']).
	self assert: (model allRMQComponents anySatisfy: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	
	t1 := model allRMQComponents detect: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe'].
	t2 := model allRMQComponents detect: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe'].

	self assert: t1 ackRequired = true.
	self assert: t2 ackRequired = true.
	
	self assert: t1 exclusive = false.
	self assert: t2 exclusive = false.

	"channels"
	self assert: model allRMQChannels size = 3.
	ch1 := (model allRMQChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allRMQChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	" queue channels"
	self assert: model allRMQQueues size = 3.
	q1 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	q2 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.logger-default.subscribe']).
	self assert: (ch1 consumedQueues anySatisfy: [ :e | e =q1 ]).
	self assert: (ch2 consumedQueues anySatisfy: [ :e | e =q2 ]).
	self assert: (q1 consumerChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (q2 consumerChannels anySatisfy: [ :e | e =ch2 ]).
		
	"queue + vhost"
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (q1 vhost = vh).
	self assert: (q2 vhost = vh).
		
	"users"
	self assert: model allRMQUsers size = 2.
	u1 := (model allRMQUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allRMQUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 usedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 usedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user =u1 ).
	self assert: (ch2 user=u2 ).
	
	"connection"
	self assert: model allRMQConnections size = 3.
	c1 := (model allRMQConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allRMQConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	
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
	
	"node"
	"node vhost"
	node := (model allRMQNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
	
	
]

{ #category : #'testing - simple' }
RMQRESTParserTestApiConsumers >> testPopulate [

	| t1 t2 vh ch1 ch2 q1 q2 u1 u2 c1 c2 node |
	self assert: model allRMQComponents size = 3.
	
	
	self assert: (model allRMQComponents anySatisfy: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe']).
	self assert: (model allRMQComponents anySatisfy: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	
	t1 := model allRMQComponents detect: [:e | e name = '0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe'].
	t2 := model allRMQComponents detect: [:e | e name = 'f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe'].

	self assert: t1 ackRequired = true.
	self assert: t2 ackRequired = true.
	
	self assert: t1 exclusive = false.
	self assert: t2 exclusive = false.

	"channels"
	self assert: model allRMQChannels size = 3.
	ch1 := (model allRMQChannels detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672 (1)']).
	ch2 := (model allRMQChannels detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672 (1)']).
	
	" queue channels"
	self assert: model allRMQQueues size = 3.
	q1 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe']).
	q2 := (model allRMQQueues detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.logger-default.subscribe']).
	self assert: (ch1 consumedQueues anySatisfy: [ :e | e =q1 ]).
	self assert: (ch2 consumedQueues anySatisfy: [ :e | e =q2 ]).
	self assert: (q1 consumerChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (q2 consumerChannels anySatisfy: [ :e | e =ch2 ]).
		
	"queue + vhost"
	vh := (model allRMQVHosts detect: [:e | e name = '/']).
	self assert: (q1 vhost = vh).
	self assert: (q2 vhost = vh).
		
	"users"
	self assert: model allRMQUsers size = 2.
	u1 := (model allRMQUsers detect: [:e | e name = 'bus-blsenior']).
	u2 := (model allRMQUsers detect: [:e | e name = 'bus-consolesaas']).
	
	"channels users"
	self assert: (u1 usedChannels anySatisfy: [ :e | e =ch1 ]).
	self assert: (u2 usedChannels anySatisfy: [ :e | e =ch2 ]).
	
	self assert: (ch1 user =u1).
	self assert: (ch2 user =u2).
	
	"connection"
	self assert: model allRMQConnections size = 3.
	c1 := (model allRMQConnections detect: [:e | e name = '10.238.15.51:49677 -> 10.238.28.5:5672']).
	c2 := (model allRMQConnections detect: [:e | e name = '10.34.132.254:49779 -> 10.238.28.5:5672']).
	self assert: c1 peerHost = '10.238.15.51'. 
	self assert: c1 peerPort = 49677.
	
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
	
	"node"
	"node vhost"
	node := (model allRMQNodes detect: [:e | e name = 'rabbit@CSLSAASRBS1']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
	
]
