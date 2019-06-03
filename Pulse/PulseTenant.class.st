Class {
	#name : #PulseTenant,
	#superclass : #PulseEntity,
	#instVars : [
		'tenantId'
	],
	#category : #'Pulse-Entities'
}

{ #category : #meta }
PulseTenant class >> annotation [

	<MSEClass: #Tenant super: #PulseEntity>
	<package: #Pulse>
	<generated>
	^self
]

{ #category : #generator }
PulseTenant class >> generatedSlotNames [
	<generated>
	'PulseTenant class>>#generatedSlotNames'.
	^ #(tenantId)
]

{ #category : #generator }
PulseTenant class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
PulseTenant class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
PulseTenant >> tenantId [

	<MSEProperty: #tenantId type: #String>
	<generated>
	<MSEComment: 'TODO'>
	^ tenantId
]

{ #category : #accessing }
PulseTenant >> tenantId: anObject [

	<generated>
	tenantId := anObject

]
