Class {
	#name : #PulseRESTParserTestApiExchanges,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #accessing }
PulseRESTParserTestApiExchanges >> data [
	^ '[
	{
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": false,
        "auto_delete": false,
        "durable": true,
        "type": "direct",
        "vhost": "/",
        "name": "amq.direct"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": false,
        "auto_delete": false,
        "durable": true,
        "type": "fanout",
        "vhost": "/",
        "name": "amq.fanout"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": false,
        "auto_delete": false,
        "durable": true,
        "type": "headers",
        "vhost": "/",
        "name": "amq.headers"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": false,
        "auto_delete": false,
        "durable": true,
        "type": "headers",
        "vhost": "/",
        "name": "amq.match"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": true,
        "auto_delete": false,
        "durable": true,
        "type": "topic",
        "vhost": "/",
        "name": "amq.rabbitmq.event"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": true,
        "auto_delete": false,
        "durable": true,
        "type": "topic",
        "vhost": "/",
        "name": "amq.rabbitmq.trace"
    },
    {
        "user_who_performed_action": "rmq-internal",
        "arguments": {},
        "internal": false,
        "auto_delete": false,
        "durable": true,
        "type": "topic",
        "vhost": "/",
        "name": "amq.topic"
    },
    {
        "message_stats": {
            "publish_in_details": {
                "rate": 0
            },
            "publish_in": 853,
            "publish_out_details": {
                "rate": 0
            },
            "publish_out": 3412
        },
        "user_who_performed_action": "bus-consolesaas",
        "arguments": {},
        "internal": false,
        "auto_delete": true,
        "durable": true,
        "type": "topic",
        "vhost": "/",
        "name": "pubsub.default.consoleSaasUserAccess.publish"
    }
]'.
]

{ #category : #initialization }
PulseRESTParserTestApiExchanges >> setUp [
	| logP |
	model := PulseModel new.
	model name: 'test'.
	logP := PulseRESTParserApiExchanges newOn: 'test'.
	logP populate: model withJson: self data.
	
	
	
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiExchanges >> testExistingPopulate [

	| t1 t2 vh user logP |
	self assert: model size = 12.
	self assert: model allPulseExchanges size = 8.
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish']).
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'amq.rabbitmq.event']).
	
	t1 := model allPulseExchanges detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish'].
	t2 := model allPulseExchanges detect: [:e | e name = 'amq.rabbitmq.event'].

	self assert: t1 durability = true.
	self assert: t2 durability = true.
	
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh exchanges anySatisfy: [ :e | e =t1 ]).
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
	
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
		
	
	self assert: model allPulseUsers size = 2.
	user := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	self assert: (t1 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t1 ]).
	self assert: (user initializedExchanges size = 1).	
	
	user := (model allPulseUsers detect: [:e | e name = 'rmq-internal']).
	self assert: (t2 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t2 ]).
	self assert: (user initializedExchanges size = 7).	
	self assert: model size = 12.
	
	logP := PulseRESTParserApiExchanges newOn: 'test2'.
	logP populate: model withJson: self data.
	
	self assert: model size = 12.
	self assert: model allPulseExchanges size = 8.
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish']).
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'amq.rabbitmq.event']).
	
	t1 := model allPulseExchanges detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish'].
	t2 := model allPulseExchanges detect: [:e | e name = 'amq.rabbitmq.event'].

	self assert: t1 durability = true.
	self assert: t2 durability = true.
	
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh exchanges anySatisfy: [ :e | e =t1 ]).
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
	
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
		
	
	self assert: model allPulseUsers size = 2.
	user := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	self assert: (t1 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t1 ]).
	self assert: (user initializedExchanges size = 1).	
	
	user := (model allPulseUsers detect: [:e | e name = 'rmq-internal']).
	self assert: (t2 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t2 ]).
	self assert: (user initializedExchanges size = 7).	
	self assert: model size = 12.

]

{ #category : #'testing - simple' }
PulseRESTParserTestApiExchanges >> testPopulate [

	| t1 t2 vh user |
	self assert: model allPulseExchanges size = 8.
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish']).
	self assert: (model allPulseExchanges anySatisfy: [:e | e name = 'amq.rabbitmq.event']).
	
	t1 := model allPulseExchanges detect: [:e | e name = 'pubsub.default.consoleSaasUserAccess.publish'].
	t2 := model allPulseExchanges detect: [:e | e name = 'amq.rabbitmq.event'].

	self assert: t1 durability = true.
	self assert: t2 durability = true.
	
	self assert: t1 internal = false.
	self assert: t2 internal = true.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh exchanges anySatisfy: [ :e | e =t1 ]).
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
	
	self assert: (vh exchanges anySatisfy: [ :e | e =t2 ]).
	self assert: (vh exchanges size = 8).	
		
	
	self assert: model allPulseUsers size = 2.
	user := (model allPulseUsers detect: [:e | e name = 'bus-consolesaas']).
	self assert: (t1 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t1 ]).
	self assert: (user initializedExchanges size = 1).	
	
	user := (model allPulseUsers detect: [:e | e name = 'rmq-internal']).
	self assert: (t2 user_who_performed_action  = user).
	self assert: (user initializedExchanges  anySatisfy: [ :e | e =t2 ]).
	self assert: (user initializedExchanges size = 7).	
	

]
