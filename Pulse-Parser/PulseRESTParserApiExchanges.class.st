"
model := MooseModel new.
model name: 'test'.
MooseModel root add: model.
RMQRESTParserApiExchanges populate: model withJson: '[
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""direct"",
        ""vhost"": ""/"",
        ""name"": """"
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""direct"",
        ""vhost"": ""/"",
        ""name"": ""amq.direct""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""fanout"",
        ""vhost"": ""/"",
        ""name"": ""amq.fanout""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""headers"",
        ""vhost"": ""/"",
        ""name"": ""amq.headers""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""headers"",
        ""vhost"": ""/"",
        ""name"": ""amq.match""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": true,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""topic"",
        ""vhost"": ""/"",
        ""name"": ""amq.rabbitmq.event""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": true,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""topic"",
        ""vhost"": ""/"",
        ""name"": ""amq.rabbitmq.trace""
    },
    {
        ""user_who_performed_action"": ""rmq-internal"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": false,
        ""durable"": true,
        ""type"": ""topic"",
        ""vhost"": ""/"",
        ""name"": ""amq.topic""
    },
    {
        ""message_stats"": {
            ""publish_in_details"": {
                ""rate"": 0
            },
            ""publish_in"": 853,
            ""publish_out_details"": {
                ""rate"": 0
            },
            ""publish_out"": 3412
        },
        ""user_who_performed_action"": ""bus-consolesaas"",
        ""arguments"": {},
        ""internal"": false,
        ""auto_delete"": true,
        ""durable"": true,
        ""type"": ""topic"",
        ""vhost"": ""/"",
        ""name"": ""pubsub.default.consoleSaasUserAccess.publish""
    }
]'
"
Class {
	#name : #PulseRESTParserApiExchanges,
	#superclass : #PulseParser,
	#category : #'Pulse-Parser'
}

{ #category : #parsing }
PulseRESTParserApiExchanges >> populate: aModel withJson: aString [
	| parser rmqObjects exchangeName exchange vhost user_who_performed_action |

	sourceName := aString.
	rmqObjects := STONJSON fromString: aString.
	rmqObjects
		do: [ :anObject | 
			exchangeName := anObject at: 'name'.
			exchange := aModel
				selectOrAddEntityNamed: exchangeName
				withType: PulseExchange
				sourceName: self sourceName.
			"set topicId"
			(((exchangeName substrings: '.') at: 1) = 'pubsub')
				ifTrue: [ exchange topicID: ((exchangeName substrings: '.') at: 3) ].

			"exchange type: (anObject at: 'type').
		exchange type exchanges add: exchange."
			(anObject at: 'type') = 'topic'
				ifTrue: [ exchange type: PulseExchangeType topic.
					exchange type exchanges add: exchange ].
			(anObject at: 'type') = 'direct'
				ifTrue: [ exchange type: PulseExchangeType direct.
					exchange type exchanges add: exchange ].
			(anObject at: 'type') = 'fanout'
				ifTrue: [ exchange type: PulseExchangeType fanout.
					exchange type exchanges add: exchange ].
			(anObject at: 'type') = 'headers'
				ifTrue: [ exchange type: PulseExchangeType headers.
					exchange type exchanges add: exchange ].
			vhost := aModel
				selectOrAddEntityNamed: (anObject at: 'vhost')
				withType: PulseVHost
				sourceName: self sourceName.
			exchange vhost: vhost.
			vhost exchanges add: exchange.
			user_who_performed_action := aModel
				selectOrAddEntityNamed: (anObject at: 'user_who_performed_action')
				withType: PulseUser
				sourceName: self sourceName.
			exchange user_who_performed_action: user_who_performed_action.
			user_who_performed_action initializedExchanges add: exchange.


			"exchange durability: (exchange at: 'durable')."
			(anObject at: 'durable') = true
				ifTrue: [ exchange durability: true ].
			(anObject at: 'durable') = false
				ifTrue: [ exchange durability: false ].
			exchange internal: (anObject at: 'internal') ]
]
