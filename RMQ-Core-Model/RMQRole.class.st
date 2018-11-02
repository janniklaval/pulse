Class {
	#name : #RMQRole,
	#superclass : #MooseEntity,
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
	users := OrderedCollection new.
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
	^ tag
]

{ #category : #accessing }
RMQRole >> tag: anObject [
	tag := anObject
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
