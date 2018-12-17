Class {
	#name : #PermissionType,
	#superclass : #Type,
	#instVars : [
		'permissions'
	],
	#classVars : [
		'configure',
		'read',
		'write'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #actions }
PermissionType class >> configure [
	^ configure ifNil: [configure := self new state: #configure]
]

{ #category : #actions }
PermissionType class >> initialize [
	"self initialize"
	super initialize.
	configure := nil.
	read := nil.
	write := nil.
]

{ #category : #actions }
PermissionType class >> read [
	^ read ifNil: [read := self new state: #read]
]

{ #category : #actions }
PermissionType class >> write [
	^ write ifNil: [write := self new state: #write]
]

{ #category : #accessing }
PermissionType >> initialize [

	super initialize.
	permissions := Set new.
]

{ #category : #accessing }
PermissionType >> permissions [
	<MSEProperty: #permissions type: #RMQPermission opposite:#type>
	<multivalued>
	^ permissions
]

{ #category : #accessing }
PermissionType >> permissions: anObject [
	permissions := anObject
]
