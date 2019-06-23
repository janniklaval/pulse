Extension { #name : #PulseRole }

{ #category : #'*OrionPulseCore' }
PulseRole >> privateSettingDate [
	^ settingDate
]

{ #category : #'*OrionPulseCore' }
PulseRole >> privateSettingDate: anObject [
	settingDate := anObject
]

{ #category : #'*OrionPulseCore' }
PulseRole >> privateTag [
	^ tag ifNil: [ self tag: PulseTag none.  tag]
]

{ #category : #'*OrionPulseCore' }
PulseRole >> privateTag: anObject [
	tag := self selectEnum: anObject. 
	tag roles add: self.
]
