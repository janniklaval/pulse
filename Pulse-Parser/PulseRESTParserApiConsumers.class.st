"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiConsumers populate: model withJson: '[
    {
        ""arguments"": {},
        ""prefetch_count"": 1,
        ""ack_required"": true,
        ""exclusive"": false,
        ""consumer_tag"": ""0ee13b3c-5863-3a22-a38a-bfc00325e051.pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe"",
        ""channel_details"": {
            ""peer_host"": ""86.65.167.130"",
            ""peer_port"": 20245,
            ""connection_name"": ""86.65.167.130:20245 -> 10.238.28.5:5672"",
            ""user"": ""bus-consolesaas"",
            ""number"": 1,
            ""node"": ""rabbit@CSLSAASRBS1"",
            ""name"": ""86.65.167.130:20245 -> 10.238.28.5:5672 (1)""
        },
        ""queue"": {
            ""vhost"": ""/"",
            ""name"": ""pubsub.default.consoleSaasUserAccess.user-access-logger-socle.subscribe""
        }
    },
    {
        ""arguments"": {},
        ""prefetch_count"": 1,
        ""ack_required"": true,
        ""exclusive"": false,
        ""consumer_tag"": ""f736f22f-c4b3-31f9-b4c2-1827c5c62022.pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe"",
        ""channel_details"": {
            ""peer_host"": ""10.238.15.51"",
            ""peer_port"": 49677,
            ""connection_name"": ""10.238.15.51:49677 -> 10.238.28.5:5672"",
            ""user"": ""bus-blsenior"",
            ""number"": 1,
            ""node"": ""rabbit@CSLSAASRBS1"",
            ""name"": ""10.238.15.51:49677 -> 10.238.28.5:5672 (1)""
        },
        ""queue"": {
            ""vhost"": ""/"",
            ""name"": ""pubsub.default.consoleSaasUserAccess.blsenior-interop-module-default.subscribe""
        }
    },
    {
        ""arguments"": {},
        ""prefetch_count"": 1,
        ""ack_required"": true,
        ""exclusive"": false,
        ""consumer_tag"": ""f9a05ed0-674f-3b9f-b407-972fc7f60fbe.pubsub.default.consoleSaasUserAccess.logger-default.subscribe"",
        ""channel_details"": {
            ""peer_host"": ""10.34.132.254"",
            ""peer_port"": 49779,
            ""connection_name"": ""10.34.132.254:49779 -> 10.238.28.5:5672"",
            ""user"": ""bus-consolesaas"",
            ""number"": 1,
            ""node"": ""rabbit@CSLSAASRBS1"",
            ""name"": ""10.34.132.254:49779 -> 10.238.28.5:5672 (1)""
        },
        ""queue"": {
            ""vhost"": ""/"",
            ""name"": ""pubsub.default.consoleSaasUserAccess.logger-default.subscribe""
        }
    }
]'
"
Class {
	#name : #PulseRESTParserApiConsumers,
	#superclass : #PulseParser,
	#category : #'Pulse-Parser'
}

{ #category : #parsing }
PulseRESTParserApiConsumers >> populate: aModel withJson: aString [
	| parser rmqObjects queueName queue vhost consumerTag component channelName channel user node connection |
	parser := PPParserResource current parserAt: PPJsonParser.
	sourceName := aString.
	rmqObjects := parser parse: aString.
	rmqObjects
		do: [ :anObject | 
			consumerTag := anObject at: 'consumer_tag'.
			component := aModel allPulseConsumerProcesses
				detect: [ :e | e consumerTag = consumerTag ]
				ifNone: [ | newComponent |
					newComponent := PulseConsumerProcess new consumerTag: consumerTag.
					aModel add: newComponent.
					newComponent ].
			component ackRequired: (anObject at: 'ack_required').
			component exclusive: (anObject at: 'exclusive').
			queueName := (anObject at: 'queue') at: 'name'.
			queue := aModel
				selectOrAddEntityNamed: queueName
				withType: PulseQueue
				sourceName: self sourceName.
			vhost := aModel
				selectOrAddEntityNamed: ((anObject at: 'queue') at: 'vhost')
				withType: PulseVHost
				sourceName: self sourceName.
			queue vhost: vhost.
			vhost queues add: queue.
			channelName := (anObject at: 'channel_details') at: 'name'.
			channel := aModel
				selectOrAddEntityNamed: channelName
				withType: PulseChannel
				sourceName: self sourceName.
			component subscribedChannels add: channel.
			channel consumerProcess: component.
			channel consumedQueues add: queue.
			queue consumerChannels add: channel.
			user := aModel
				selectOrAddEntityNamed: ((anObject at: 'channel_details') at: 'user')
				withType: PulseUser
				sourceName: self sourceName.
			channel user: user.
			user usedChannels add: channel.
			node := aModel
				entityNamed: ((anObject at: 'channel_details') at: 'node')
				withType: PulseNode
				ifAbsent: [ | newNode |
					newNode := PulseNode new
						pulseName: ((anObject at: 'channel_details') at: 'node');
						mooseModel: aModel.
					vhost node: newNode.
					newNode vhosts add: vhost.
					newNode ].
			connection := aModel
				selectOrAddEntityNamed: ((anObject at: 'channel_details') at: 'connection_name')
				withType: PulseConnection
				sourceName: self sourceName.
			connection
				peerHost: ((anObject at: 'channel_details') at: 'peer_host').
			connection
				peerPort: ((anObject at: 'channel_details') at: 'peer_port').
			connection channels add: channel.
			channel connection: connection.
			connection user: user.
			user usedConnections add: connection ]
]
