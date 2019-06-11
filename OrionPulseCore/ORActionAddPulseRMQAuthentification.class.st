Class {
	#name : #ORActionAddPulseRMQAuthentification,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'failureError',
		'success',
		'timestamp',
		'user'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> failureError [
	^ failureError
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> failureError: anObject [
	failureError := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQAuthentification >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQAuthentification new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	self failureError ifNotNil: [ :e | 
		newEntity privateFailureError: e orionCopy ].
	
	self success ifNotNil: [ :e | 
		newEntity privateSuccess: e orionCopy ].
	
	self timestamp ifNotNil: [ :e | 
		newEntity privateTimestamp: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	self user
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user.
			newEntity privateUser: theNewEntity orionCopy.
			theNewEntity privateAuthentifications: (theNewEntity privateAuthentifications orionCopy add: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> success [
	^ success
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> success: anObject [
	success := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> timestamp [
	^ timestamp
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> user [
	^ user
]

{ #category : #accessing }
ORActionAddPulseRMQAuthentification >> user: anObject [
	user := anObject
]
