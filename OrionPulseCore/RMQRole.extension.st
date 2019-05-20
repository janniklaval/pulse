Extension { #name : #RMQRole }

{ #category : #'*OrionPulseCore' }
RMQRole >> privateSettingDate [
	^ settingDate
]

{ #category : #'*OrionPulseCore' }
RMQRole >> privateSettingDate: anObject [
	settingDate := anObject
]

{ #category : #'*OrionPulseCore' }
RMQRole >> privateTag [
	^ tag ifNil: [ self tag: Tag none.  tag]
]

{ #category : #'*OrionPulseCore' }
RMQRole >> privateTag: anObject [
	tag := self selectEnum: anObject. 
	tag roles add: self.
]

{ #category : #'*OrionPulseCore' }
RMQRole >> privateUser [
	^ user
]

{ #category : #'*OrionPulseCore' }
RMQRole >> privateUser: anObject [
	user := anObject
]
