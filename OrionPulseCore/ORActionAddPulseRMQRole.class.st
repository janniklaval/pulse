Class {
	#name : #ORActionAddPulseRMQRole,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'tag',
		'settingDate',
		'user'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQRole >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQRole >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQRole new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self settingDate ifNotNil: [ :e |
		newEntity private_size_byte: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self tag
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self tag.
			newEntity privateTag: theNewEntity orionCopy.
			theNewEntity privateRoles: (theNewEntity privateRoles orionCopy unsafeAdd: newEntity)].
		
	self user
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self user.
			newEntity privateUser: theNewEntity orionCopy.
			theNewEntity privateRoles: (theNewEntity privateRoles orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> settingDate [
	^ settingDate
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> settingDate: anObject [
	settingDate := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> tag [
	^ tag
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> tag: anObject [
	tag := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> user [
	^ user
]

{ #category : #accessing }
ORActionAddPulseRMQRole >> user: anObject [
	user := anObject
]
