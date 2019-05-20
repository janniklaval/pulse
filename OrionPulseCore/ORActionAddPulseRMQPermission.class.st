Class {
	#name : #ORActionAddPulseRMQPermission,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'configureValue',
		'writeValue',
		'readValue',
		'user',
		'vhost',
		'creationDate',
		'deletionDate'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQPermission >> configureValue [
	^ configureValue
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> configureValue: anObject [
	configureValue := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> creationDate [
	^ creationDate
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> deletionDate [
	^ deletionDate
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> deletionDate: anObject [
	deletionDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> name [
	^ vhost mooseName, '.', user mooseName, '>', configureValue mooseName, '_', writeValue mooseName, '_', readValue mooseName
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> readValue [
	^ readValue
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> readValue: anObject [
	readValue := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQPermission >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQPermission new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self configureValue ifNotNil: [ :e |
		newEntity privateConfigureValue: e orionCopy ].
	
	self creationDate ifNotNil: [ :e |
		newEntity privateCreationDate: e orionCopy ].
	
	self deletionDate ifNotNil: [ :e |
		newEntity privateDeletionDate: e orionCopy ].
	
	self name ifNotNil: [ :e |
		newEntity privateName: e orionCopy ].
	
	self readValue ifNotNil: [ :e |
		newEntity privateReadValue: e orionCopy ].
	
	self writeValue ifNotNil: [ :e |
		newEntity privateWriteValue: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self user
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user.
			newEntity privateUser: theNewEntity orionCopy.
			theNewEntity privatePermissions: (theNewEntity privatePermissions orionCopy unsafeAdd: newEntity)].
		
	self vhost
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self vhost.
			newEntity privateVhost: theNewEntity orionCopy.
			theNewEntity privatePermissions: (theNewEntity privatePermissions orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> user [
	^ user
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> user: anObject [
	user := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> vhost [
	^ vhost
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> vhost: anObject [
	vhost := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> writeValue [
	^ writeValue
]

{ #category : #accessing }
ORActionAddPulseRMQPermission >> writeValue: anObject [
	writeValue := anObject
]
