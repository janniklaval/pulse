Class {
	#name : #RMQUser,
	#superclass : #MooseEntity,
	#instVars : [
		'userString',
		'vhosts',
		'password',
		'passwordHash',
		'hashingAlgorithm',
		'roles',
		'permissions',
		'usedChannels',
		'initializedChannels',
		'usedConnections',
		'initializedConnections',
		'creationDate',
		'deletionDate',
		'passwordCreationDate',
		'passwordChangingDate',
		'authentification'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQUser >> authentification [
	<MSEProperty: #authentification type: #RMQAuthentification opposite: #user>
	<multivalued>
	^ authentification
]

{ #category : #accessing }
RMQUser >> authentification: anObject [
	authentification := anObject
]

{ #category : #accessing }
RMQUser >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQUser >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQUser >> deletionDate [
	<MSEProperty: #deletionDate type: #Number>
	^ deletionDate
]

{ #category : #accessing }
RMQUser >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
RMQUser >> hashingAlgorithm [
	<MSEProperty: #hashingAlgorithm type: #String>
	^ hashingAlgorithm
]

{ #category : #accessing }
RMQUser >> hashingAlgorithm: anObject [
	hashingAlgorithm := anObject
]

{ #category : #initialization }
RMQUser >> initialize [

	super initialize.
	usedConnections := OrderedCollection new.
	vhosts :=OrderedCollection new.
	usedChannels :=OrderedCollection new.
	roles :=OrderedCollection new.
	permissions :=OrderedCollection new.
]

{ #category : #accessing }
RMQUser >> initializedChannels [
	<MSEProperty: #initializedChannels type: #RMQChannel opposite:#initializer>
	<multivalued>
	^ initializedChannels
]

{ #category : #accessing }
RMQUser >> initializedChannels: anObject [
	initializedChannels := anObject
]

{ #category : #accessing }
RMQUser >> initializedConnections [
	<MSEProperty: #initializedConnections type: #RMQConnection opposite:#initializer>
	<multivalued>
	^ initializedConnections
]

{ #category : #accessing }
RMQUser >> initializedConnections: anObject [
	initializedConnections := anObject
]

{ #category : #accessing }
RMQUser >> name [
	<MSEProperty: #name type: #String>
	^ self userString
]

{ #category : #accessing }
RMQUser >> password [
	<MSEProperty: #password type: #String>
	^ password
]

{ #category : #accessing }
RMQUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
RMQUser >> passwordChangingDate [
	<MSEProperty: #passwordChangingDate type: #Number>
	^ passwordChangingDate
]

{ #category : #accessing }
RMQUser >> passwordChangingDate: anObject [
	passwordChangingDate := anObject
]

{ #category : #accessing }
RMQUser >> passwordCreationDate [
	<MSEProperty: #passwordCreationDate type: #Number>
	^ passwordCreationDate
]

{ #category : #accessing }
RMQUser >> passwordCreationDate: anObject [
	passwordCreationDate := anObject
]

{ #category : #accessing }
RMQUser >> passwordHash [
	<MSEProperty: #passwordHash type: #String>
	^ passwordHash
]

{ #category : #accessing }
RMQUser >> passwordHash: anObject [
	passwordHash := anObject
]

{ #category : #accessing }
RMQUser >> permissions [
	<MSEProperty: #permissions type: #RMQPermission opposite:#user>
	<multivalued>
	^ permissions
]

{ #category : #accessing }
RMQUser >> permissions: anObject [
	permissions := anObject
]

{ #category : #accessing }
RMQUser >> roles [
	<MSEProperty: #roles type: #RMQRole opposite:#users>
	<multivalued>
	^ roles
]

{ #category : #accessing }
RMQUser >> roles: anObject [
	roles := anObject
]

{ #category : #accessing }
RMQUser >> usedChannels [
	<MSEProperty: #usedChannels type: #RMQChannel opposite:#users>
	<multivalued>
	^ usedChannels
]

{ #category : #accessing }
RMQUser >> usedChannels: anObject [
	usedChannels := anObject
]

{ #category : #accessing }
RMQUser >> usedConnections [
	<MSEProperty: #usedConnections type: #RMQConnection opposite:#users>
	<multivalued>
	^ usedConnections
]

{ #category : #accessing }
RMQUser >> usedConnections: anObject [
	usedConnections := anObject
]

{ #category : #accessing }
RMQUser >> userString [
	<MSEProperty: #user type: #String>
	^ userString
]

{ #category : #accessing }
RMQUser >> userString: anObject [
	userString := anObject
]

{ #category : #accessing }
RMQUser >> vhosts [
	<MSEProperty: #vhosts type: #RMQVHost opposite:#users>
	<multivalued>
	^ vhosts
]

{ #category : #accessing }
RMQUser >> vhosts: anObject [
	vhosts := anObject
]
