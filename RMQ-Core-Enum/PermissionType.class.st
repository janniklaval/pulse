Class {
	#name : #PermissionType,
	#superclass : #Type,
	#instVars : [
		'permissions'
	],
	#category : #'RMQ-Core-Enum'
}

{ #category : #actions }
PermissionType class >> configure [
	^ self new state: #configure
]

{ #category : #actions }
PermissionType class >> read [
	^ self new state: #read
]

{ #category : #actions }
PermissionType class >> write [
	^ self new state: #write
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
