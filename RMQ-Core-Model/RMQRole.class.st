Class {
	#name : #RMQRole,
	#superclass : #PulseEntity,
	#instVars : [
		'user',
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
RMQRole >> name [
	<MSEProperty: #name type: #String>
	^ self tag
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
RMQRole >> user [
	<MSEProperty: #user type: #RMQUser opposite:#roles>
	^ user
]

{ #category : #accessing }
RMQRole >> user: anObject [
	user := anObject
]
