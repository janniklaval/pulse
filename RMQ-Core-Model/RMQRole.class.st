Class {
	#name : #RMQRole,
	#superclass : #PulseEntity,
	#instVars : [
		'users',
		'tag',
		'settingDate'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQRole >> initialize [

	super initialize.
	users := Set new.
]

{ #category : #accessing }
RMQRole >> settingDate [
		<MSEProperty: #settingDate type: #Number>
	^ settingDate
]

{ #category : #accessing }
RMQRole >> settingDate: anObject [
	settingDate := anObject
]

{ #category : #accessing }
RMQRole >> tag [
	<MSEProperty: #tag type: #Tag>
	^ self pulseName
]

{ #category : #accessing }
RMQRole >> tag: anObject [
	self pulseName: anObject
]

{ #category : #accessing }
RMQRole >> users [
	<MSEProperty: #users type: #RMQUser opposite:#roles>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQRole >> users: anObject [
	users := anObject
]
