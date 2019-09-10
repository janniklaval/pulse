"
A ORActionAddQueue is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddQueue,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'routedMessages',
		'maxPriority',
		'expiresAfter',
		'idleSince',
		'pulseState',
		'pulseName',
		'autoDelete',
		'sources',
		'deliveredMessages',
		'maxLengthBytes',
		'maxLength',
		'exclusive',
		'durability',
		'vhost',
		'destinationBindings',
		'dead_letter_exchange',
		'dead_letter_routing_key',
		'consumerChannels',
		'messageTTL',
		'creationDate',
		'deletionDate'
	],
	#category : #'OrionPulseEntities-Action'
}
