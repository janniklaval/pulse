Class {
	#name : #RMQUser,
	#superclass : #PulseEntity,
	#instVars : [
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
		'passwordClearingDate',
		'passwordChangingDate',
		'authentifications',
		'initializedExchanges'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQUser >> authentifications [
	<MSEProperty: #authentifications type: #RMQAuthentification opposite: #user>
	<multivalued>
	^ authentifications
]

{ #category : #accessing }
RMQUser >> authentifications: anObject [
	authentifications := anObject
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
	usedConnections := Set new.
	vhosts :=Set new.
	usedChannels :=Set new.
	roles :=Set new.
	permissions :=Set new.
	initializedExchanges := Set new.
	initializedChannels  := Set new.
	initializedConnections  := Set new.
]

{ #category : #accessing }
RMQUser >> initializedChannels [
	<MSEProperty: #initializedChannels type: #RMQChannel opposite:#user_who_performed_connection>
	<multivalued>
	^ initializedChannels
]

{ #category : #accessing }
RMQUser >> initializedChannels: anObject [
	initializedChannels := anObject
]

{ #category : #accessing }
RMQUser >> initializedConnections [
	<MSEProperty: #initializedConnections type: #RMQConnection opposite:#user_who_performed_connection>
	<multivalued>
	^ initializedConnections
]

{ #category : #accessing }
RMQUser >> initializedConnections: anObject [
	initializedConnections := anObject
]

{ #category : #accessing }
RMQUser >> initializedExchanges [
	<MSEProperty: #initializedExchanges type: #RMQExchange opposite:#user_who_performed_action>
	<multivalued>
	^ initializedExchanges
]

{ #category : #accessing }
RMQUser >> initializedExchanges: anObject [
	initializedExchanges := anObject
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
RMQUser >> passwordClearingDate [
	<MSEProperty: #passwordClearingDate type: #Number>
	^ passwordClearingDate
]

{ #category : #accessing }
RMQUser >> passwordClearingDate: anObject [
	passwordClearingDate := anObject
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
	<MSEProperty: #roles type: #RMQRole opposite:#user>
	<multivalued>
	^ roles
]

{ #category : #accessing }
RMQUser >> roles: anObject [
	roles := anObject
]

{ #category : #accessing }
RMQUser >> usedChannels [
	<MSEProperty: #usedChannels type: #RMQChannel opposite:#user>
	<multivalued>
	^ usedChannels
]

{ #category : #accessing }
RMQUser >> usedChannels: anObject [
	usedChannels := anObject
]

{ #category : #accessing }
RMQUser >> usedConnections [
	<MSEProperty: #usedConnections type: #RMQConnection opposite:#user>
	<multivalued>
	^ usedConnections
]

{ #category : #accessing }
RMQUser >> usedConnections: anObject [
	usedConnections := anObject
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
