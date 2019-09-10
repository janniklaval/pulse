"
A ORActionAddConsumerProcess is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddConsumerProcess,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'consumerTag',
		'pulseState',
		'pulseName',
		'guid',
		'sources',
		'ackRequired',
		'exclusive',
		'subscribedChannels',
		'consumerComponent',
		'creationDate',
		'deletionDate'
	],
	#category : #'OrionPulseEntities-Action'
}
