Class {
	#name : #RMQLogParserTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'RMQ-Core-Parser-Tests'
}

{ #category : #initialization }
RMQLogParserTest >> data [

	^ '[{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.3541.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdCBKU09O",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			
		}
	},
	"queue": "none",
	"routed_queues": ["testRMQ"],
	"routing_keys": [""],
	"timestamp": "2018-02-13 10:38:44:903",
	"type": "published",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4286.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdA==",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			"h1": "h1test"
		}
	},
	"queue": "none",
	"routed_queues": [],
	"routing_keys": ["RoutingT"],
	"timestamp": "2018-02-13 11:02:29:030",
	"type": "published",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4307.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdA==",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			"h1": "h1test"
		}
	},
	"queue": "none",
	"routed_queues": ["testRMQ"],
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:02:36:099",
	"type": "published",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4584.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdA==",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			
		}
	},
	"queue": "testRMQ",
	"routed_queues": "none",
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:09:30:753",
	"type": "received",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4605.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dHR0",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			
		}
	},
	"queue": "testRMQ",
	"routed_queues": "none",
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:09:36:316",
	"type": "received",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4624.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdA==",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			
		}
	},
	"queue": "testRMQ",
	"routed_queues": "none",
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:09:37:144",
	"type": "received",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4641.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdCBKU09O",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			
		}
	},
	"queue": "testRMQ",
	"routed_queues": "none",
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:09:37:873",
	"type": "received",
	"user": "guest",
	"vhost": "/"
},{
	"channel": 1,
	"connection": "<rabbit@b782bc5f4af0.1.4658.0>",
	"exchange": "test",
	"node": "rabbit@b782bc5f4af0",
	"payload": "dGVzdA==",
	"properties": {
		"delivery_mode": 1,
		"headers": {
			"h1": "h1test"
		}
	},
	"queue": "testRMQ",
	"routed_queues": "none",
	"routing_keys": [""],
	"timestamp": "2018-02-13 11:09:38:646",
	"type": "received",
	"user": "guest",
	"vhost": "/"
}]'
]

{ #category : #initialization }
RMQLogParserTest >> setUp [

	model := PulseModel new.
	model name: 'test'.
	RMQLogParser populate: model withJson: self data.
	
	
]

{ #category : #initialization }
RMQLogParserTest >> testPopulate [

	^false
]
