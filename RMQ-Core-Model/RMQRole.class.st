Class {
	#name : #RMQRole,
	#superclass : #PulseEntity,
	#instVars : [
		'tag',
		'settingDate',
		'user'
	],
	#category : #'RMQ-Core-Model'
}

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
	^ tag ifNil: [ self tag: Tag none.  tag]
]

{ #category : #accessing }
RMQRole >> tag: anObject [
	tag := self selectEnum: anObject. 
	tag roles add: self.
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
