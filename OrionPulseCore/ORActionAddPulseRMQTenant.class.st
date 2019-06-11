Class {
	#name : #ORActionAddPulseRMQTenant,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'pulseName',
		'component'
	],
	#category : #'OrionPulseCore-Action'
}

{ #category : #accessing }
ORActionAddPulseRMQTenant >> component [
	^ component
]

{ #category : #accessing }
ORActionAddPulseRMQTenant >> component: anObject [
	component := anObject
]

{ #category : #accessing }
ORActionAddPulseRMQTenant >> pulseName [
	^ pulseName
]

{ #category : #accessing }
ORActionAddPulseRMQTenant >> pulseName: anObject [
	pulseName := anObject
]

{ #category : #'method execution' }
ORActionAddPulseRMQTenant >> run [

	| newEntity |
	super run.
	newEntity := ORPulseRMQTenant new.
	self orionModel add: newEntity.
	
	"Set primitive not derived properties of the entity"
	
	self pulseName ifNotNil: [ :e | 
		newEntity privatePulseName: e orionCopy ].
	
	self tenantId ifNotNil: [ :e |
		newEntity privateTenantId: e orionCopy ].
	
	"Set complex not derived properties of the entity"
	
	self component
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self component.
			newEntity privateComponent: theNewEntity orionCopy.
			theNewEntity privateTenants: (theNewEntity privateTenants orionCopy unsafeAdd: newEntity)].
		
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
]

{ #category : #accessing }
ORActionAddPulseRMQTenant >> tenantId [
	^ self pulseName
]
