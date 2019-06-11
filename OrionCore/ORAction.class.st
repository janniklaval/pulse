"
An ORAction is an abstract class corresponding to any action that can be performed on an entity.

Instance Variables
	childrenActions:		corresponds to the collection of actions composing the given action
	cost:		<Object>
	entity:		entity on which the action is performed
	orionModel:		the Orion model on which the action is performed
	parentAction:		the parent action if it has been performed inside the execution of another action.

"
Class {
	#name : #ORAction,
	#superclass : #Object,
	#instVars : [
		'entity',
		'orionModel',
		'cost',
		'parentAction',
		'childrenActions'
	],
	#category : #'OrionCore-action'
}

{ #category : #'initialize-release' }
ORAction class >> description [
	^'action'
]

{ #category : #testing }
ORAction class >> isAddition [
	^ false
]

{ #category : #testing }
ORAction class >> isMove [
	^ false
]

{ #category : #testing }
ORAction class >> isRemoval [
	^ false
]

{ #category : #testing }
ORAction class >> isRename [
	^ false
]

{ #category : #'initialize-release' }
ORAction class >> needs: anElement [
	^self subclassResponsibility
]

{ #category : #accessing }
ORAction >> addChildAction: anAction [
	childrenActions add:  anAction
]

{ #category : #testing }
ORAction >> belongsToParentModel [
	"True if the entity of the change belongs to the parent model, else false. For the paired change, it is not appliable"
	^ self subclassResponsibility
]

{ #category : #accessing }
ORAction >> childrenActions [
	^ childrenActions
]

{ #category : #accessing }
ORAction >> cost [
	^ cost
]

{ #category : #accessing }
ORAction >> cost: anObject [
	cost := anObject
]

{ #category : #accessing }
ORAction >> currentContext [
	^ self orionModel
]

{ #category : #accessing }
ORAction >> entity [
	^ entity
]

{ #category : #accessing }
ORAction >> entity: anObject [
	entity := anObject
]

{ #category : #'initialize-release' }
ORAction >> initialize [
	cost := 1.
	parentAction := nil.
	childrenActions := OrderedCollection new.
]

{ #category : #testing }
ORAction >> isAddition [
	^ self class isAddition
]

{ #category : #accessing }
ORAction >> isManual [
	^ parentAction isNil
]

{ #category : #testing }
ORAction >> isMove [
	^ self class isMove
]

{ #category : #testing }
ORAction >> isPairedChange [
	^ false
]

{ #category : #testing }
ORAction >> isRemoval [
	^ self class isRemoval
]

{ #category : #testing }
ORAction >> isRename [
	^ self class isRename
]

{ #category : #'method execution' }
ORAction >> manualRun [

	self parentAction: nil.
	self run
]

{ #category : #accessing }
ORAction >> orionModel [
	^ orionModel
]

{ #category : #accessing }
ORAction >> orionModel: anObject [
	orionModel := anObject.
	"anObject changes add: self"
]

{ #category : #accessing }
ORAction >> parentAction [
	^ parentAction
]

{ #category : #accessing }
ORAction >> parentAction: anAction [
	parentAction ifNotNil: [parentAction removeChildAction: self].
	parentAction := anAction.
	anAction ifNotNil: [anAction addChildAction: self].
]

{ #category : #'initialize-release' }
ORAction >> postRun [

	orionModel addToListOfChanges: self.	
	orionModel system announcer announce: ORAnnouncement.
]

{ #category : #printing }
ORAction >> printOn: stream [ 

	stream 
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: entity class name;
		nextPut: $);
		nextPutAll:  entity mooseName
]

{ #category : #printing }
ORAction >> printWorkspace [

	^ '>', self class description, '>> '
]

{ #category : #accessing }
ORAction >> removeChildAction: anAction [
	childrenActions remove: anAction ifAbsent: [nil].
]

{ #category : #'method execution' }
ORAction >> run [
	self runOR: self orionModel
]

{ #category : #'method execution' }
ORAction >> runExtendedPropertiesForEntity: anOREntity [
	(Pragma allNamed: #toRun in: self class)
		do: [ :pragma | self perform: pragma methodSelector with: anOREntity ]
]

{ #category : #'method execution' }
ORAction >> runOR: aVersion [

	aVersion system announcer announce: ORAnnouncement.
	entity := entity versionIn: aVersion.
	^self
]

{ #category : #'method execution' }
ORAction >> runOnNewVersionFrom: previousVersion [

	| newModel |
	newModel := previousVersion createNewChildVersion.
	self orionModel: newModel.
	^self manualRun.
]
