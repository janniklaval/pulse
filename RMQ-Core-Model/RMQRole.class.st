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
	"users := Set new."
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
RMQRole >> user [
	<MSEProperty: #user type: #RMQUser opposite:#roles>
	^ user
]

{ #category : #accessing }
RMQRole >> user: anObject [
	user := anObject
]
