Class {
	#name : #RMQVHost,
	#superclass : #MooseEntity,
	#instVars : [
		'vhostString',
		'node',
		'users',
		'connections',
		'queues',
		'exchanges',
		'bindings',
		'attachedPermissions',
		'channels',
		'tracing',
		'creationDate',
		'deletionDate'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQVHost >> attachedPermissions [
	<MSEProperty: #attachedPermissions type: #RMQPermission opposite:#attachedVHost>
	^ attachedPermissions
]

{ #category : #accessing }
RMQVHost >> attachedPermissions: anObject [
	attachedPermissions := anObject
]

{ #category : #accessing }
RMQVHost >> channels [
	<MSEProperty: #channels type: #RMQChannel opposite:#vhost>
	<multivalued>
	^ channels
]

{ #category : #accessing }
RMQVHost >> channels: anObject [
	channels := anObject
]

{ #category : #accessing }
RMQVHost >> connections [
	<MSEProperty: #connections type: #RMQConnection opposite:#vhost>
	<multivalued>
	^ connections
]

{ #category : #accessing }
RMQVHost >> connections: anObject [
	connections := anObject
]

{ #category : #accessing }
RMQVHost >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQVHost >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQVHost >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQVHost >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQVHost >> exchanges [
	<MSEProperty: #exchanges type: #RMQExchange opposite:#vhost>
	<multivalued>
	^ exchanges
]

{ #category : #accessing }
RMQVHost >> exchanges: anObject [
	exchanges := anObject
]

{ #category : #initialization }
RMQVHost >> initialize [

	super initialize.
	users := OrderedCollection new.
	connections := OrderedCollection new.
	queues := OrderedCollection new.
	exchanges := OrderedCollection new.
	channels := OrderedCollection new.
]

{ #category : #accessing }
RMQVHost >> name [
	<MSEProperty: #name type: #String>
	^ self vhostString
]

{ #category : #accessing }
RMQVHost >> node [
	<MSEProperty: #node type: #RMQNode opposite:#vhosts>
	^ node
]

{ #category : #accessing }
RMQVHost >> node: anObject [
	node := anObject
]

{ #category : #accessing }
RMQVHost >> queues [
	<MSEProperty: #queues type: #RMQQueue opposite:#vhost>
	<multivalued>
	^ queues
]

{ #category : #accessing }
RMQVHost >> queues: anObject [
	queues := anObject
]

{ #category : #accessing }
RMQVHost >> tracing [
	<MSEProperty: #tracing type: #Boolean>
	^ tracing
]

{ #category : #accessing }
RMQVHost >> tracing: anObject [
	tracing := anObject
]

{ #category : #accessing }
RMQVHost >> users [
	<MSEProperty: #users type: #RMQUser opposite:#vhosts>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQVHost >> users: anObject [
	users := anObject
]

{ #category : #accessing }
RMQVHost >> vhostString [
	<MSEProperty: #vhost type: #String>
	^ vhostString
]

{ #category : #accessing }
RMQVHost >> vhostString: anObject [
	vhostString := anObject
]
