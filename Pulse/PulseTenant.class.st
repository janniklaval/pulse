Class {
	#name : #PulseTenant,
	#superclass : #PulseEntity,
	#instVars : [
		'#tenantId => FMProperty'
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
