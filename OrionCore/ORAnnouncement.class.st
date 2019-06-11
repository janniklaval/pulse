"
An ORAnnouncement is an abstract announcement.

Instance Variables
	entity:		cooresponds to the entity on which the change occured
"
Class {
	#name : #ORAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #'OrionCore-announcement'
}

{ #category : #accessing }
ORAnnouncement >> entity [
	^ entity
]

{ #category : #accessing }
ORAnnouncement >> entity: anObject [
	entity := anObject
]
