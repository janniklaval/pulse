Class {
	#name : #PulseAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #'Pulse-Notification'
}

{ #category : #accessing }
PulseAnnouncement >> entity [
	^ entity
]

{ #category : #accessing }
PulseAnnouncement >> entity: anObject [
	entity := anObject
]
