"
A ORActionAddRoutingKey is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddRoutingKey,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'queues_for_dead_letter',
		'sources',
		'messages',
		'bindings'
	],
	#category : #'OrionPulseEntities-Action'
}
