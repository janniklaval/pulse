"
A ORActionAddMessage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddMessage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'publisherComponent',
		'pulseName',
		'exchangeFormat',
		'timestamp',
		'messageId',
		'sources',
		'payload',
		'routingKeys',
		'deliveryMode',
		'deliveredFromQueues',
		'routedToQueues',
		'messageType',
		'redelivered',
		'encrypted',
		'priority',
		'publishedToExchange'
	],
	#category : #'OrionPulseEntities-Action'
}
