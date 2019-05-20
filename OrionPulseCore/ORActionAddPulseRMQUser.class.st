Class {
	#name : #ORActionAddPulseRMQUser,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
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
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQUser >> authentifications [
	^ authentifications
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> authentifications: anObject [
	authentifications := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> hashingAlgorithm [
	^ hashingAlgorithm
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> hashingAlgorithm: anObject [
	hashingAlgorithm := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedChannels [
	^ initializedChannels
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedChannels: anObject [
	initializedChannels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedConnections [
	^ initializedConnections
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedConnections: anObject [
	initializedConnections := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedExchanges [
	^ initializedExchanges
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> initializedExchanges: anObject [
	initializedExchanges := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> password [
	^ password
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordChangingDate [
	^ passwordChangingDate
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordChangingDate: anObject [
	passwordChangingDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordClearingDate [
	^ passwordClearingDate
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordClearingDate: anObject [
	passwordClearingDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordHash [
	^ passwordHash
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> passwordHash: anObject [
	passwordHash := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> permissions [
	^ permissions
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> permissions: anObject [
	permissions := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> roles [
	^ roles
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> roles: anObject [
	roles := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQUser >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQUser new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self hashingAlgorithm ifNotNil: [ :e |
		newEntity privateHashingAlgorithm: e orionCopy ].
	
	self password ifNotNil: [ :e |
		newEntity privatePassword: e orionCopy ].
	
	self passwordChangingDate ifNotNil: [ :e |
		newEntity privatePasswordChangingDate: e orionCopy ].
	
	self passwordClearingDate ifNotNil: [ :e |
		newEntity privatePasswordClearingDate: e orionCopy ].
	
	self passwordHash ifNotNil: [ :e |
		newEntity privatePasswordHash: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self authentifications
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self authentifications collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateAuthentifications: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUser: newEntity ] ].
		
	self initializedChannels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self initializedChannels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateInitializedChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_user_who_performed_connection: newEntity ] ].
		
	self initializedConnections 
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self initializedConnections collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateInitializedConnections: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_user_who_performed_connection: newEntity ] ].
		
	self initializedExchanges
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self initializedExchanges collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateInitializedExchanges: theNewEntities orionCopy.
			theNewEntities do: [ :e | e private_user_who_performed_action: newEntity ] ].
		
	self permissions
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self permissions collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privatePermissions: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUser: newEntity ] ].
		
	self roles
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self roles collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateRoles: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUser: newEntity ] ].
		
	self usedChannels
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self usedChannels collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateUsedChannels: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUser: newEntity ] ].
		
	self usedConnections
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self usedConnections collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateUsedConnections: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUser: newEntity ] ].
		
	self vhosts
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self vhosts collect: [ :e | self orionModel retrieveEntity: e ]).
			newEntity privateVhosts: theNewEntities orionCopy.
			theNewEntities do: [ :e | e privateUsers: (e privateUsers orionCopy unsafeAdd: newEntity) ] ].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> usedChannels [
	^ usedChannels
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> usedChannels: anObject [
	usedChannels := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> usedConnections [
	^ usedConnections
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> usedConnections: anObject [
	usedConnections := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> vhosts [
	^ vhosts
]

{ #category : #accessing }
ORActionAddPulseRMQUser >> vhosts: anObject [
	vhosts := anObject
]
