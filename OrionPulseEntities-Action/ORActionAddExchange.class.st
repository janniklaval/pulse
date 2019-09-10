"
A ORActionAddExchange is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddExchange,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'publisherComponents',
		'pulseName',
		'type',
		'publishedMessages',
		'autoDelete',
		'sourceBindings',
		'queues_for_dead_letter',
		'sources',
		'alternate_exchange_for',
		'destinationBindings',
		'durability',
		'vhost',
		'internal',
		'topicID',
		'user_who_performed_action',
		'creationDate',
		'deletionDate',
		'my_alternate_exchange'
	],
	#category : #'OrionPulseEntities-Action'
}
