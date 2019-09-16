"
An ORModel is an Orion Model

Instance Variables
	cache:		used to compute the actual model
	changes:		all the changes performed on the model
	childrenModel:		all the child versions created from the model
	parentModel:		parent model 
	system:		system where the model is stored


"
Class {
	#name : #ORModel,
	#superclass : #MooseModel,
	#instVars : [
		'parentModel',
		'childrenModel',
		'changes',
		'system',
		'cache'
	],
	#category : #OrionCore
}

{ #category : #'class initialization' }
ORModel class >> asMooseDescription [
	^ self meta descriptionOf: MooseModel
]

{ #category : #'class initialization' }
ORModel class >> initialize [
	self defaultState: MooseDevelopmentState
]

{ #category : #persistence }
ORModel class >> isVoyageRoot [
	^ true
]

{ #category : #'class initialization' }
ORModel class >> withParent: aModel [

	^ self new withParent:aModel
]

{ #category : #'adding/removing' }
ORModel >> add: anElement [ 
	super add: anElement. 
	anElement versionIn: self.
	^anElement
]

{ #category : #'adding/removing' }
ORModel >> addAnnotationTypeNamed: aString inModel: aModelVersion [
	aString
		ifNotNil: [ (ORActionAddAnnotationType new
				orionModel: aModelVersion;
				container: self ;
				newName: aString)
				manualRun;
				postRun ]
]

{ #category : #'adding/removing' }
ORModel >> addToListOfChanges: anAction [ 
	self changes add: anAction.
]

{ #category : #changes }
ORModel >> allChanges [

	|collection current|
	collection := OrderedCollection new.
	current := self.
	
	[collection addAllFirst: current changes.
	current := current parentModel.
	current isNil] whileFalse.

	^collection
	
	
]

{ #category : #navigation }
ORModel >> allWithType: aMetaDesription [
	| try |
	try := ORConverter mapping at: aMetaDesription ifAbsent: [ aMetaDesription ].
	^ MooseGroup withAll: (self entityStorage selectAllWithType: try) withDescription: 'All ' , try mooseName asLowercase
]

{ #category : #navigation }
ORModel >> at: anID [

	^self entityStorage at:anID.
]

{ #category : #accessing }
ORModel >> baseName [
	|op|
	op := 1.
	^self name copyFrom: 1 to: ((self name indexOf:$_ ifAbsent:[op := 0.self name size]) - op)
]

{ #category : #accessing }
ORModel >> cache [
	^ cache
]

{ #category : #accessing }
ORModel >> cache: anObject [
	cache := anObject
]

{ #category : #accessing }
ORModel >> changes [
	^ changes
]

{ #category : #accessing }
ORModel >> changes: anObject [
	changes := anObject
]

{ #category : #accessing }
ORModel >> childrenModel [
	^ childrenModel
]

{ #category : #accessing }
ORModel >> childrenModel: anObject [
	childrenModel := anObject
]

{ #category : #testing }
ORModel >> contains: anElement [
	^ anElement orionModel = self.
]

{ #category : #creating }
ORModel >> createEntityFrom: anEntity [
	| newEntity |
	self remove: anEntity.
	newEntity := anEntity shallowCopy.
	newEntity privateState: (ORDefaultState with: newEntity).
	newEntity orionModel: self.
	^ newEntity
]

{ #category : #creating }
ORModel >> createNewChildVersion [
	| newModel |
	newModel := ORModel withParent: self.
	newModel name: self baseName , '_' , Date current yyyymmdd , '_' , Time current print24.
	^ newModel
]

{ #category : #'initialize-release' }
ORModel >> defaultStateClass [ 
	"Answer the default implementator of this element's state." 
	 
	^ORDefaultState
]

{ #category : #'adding/removing' }
ORModel >> delete [
	"remove the version and all its children"
	
	self childrenModel do:[:each | each remove].
	
	self parentModel ifNotNil:[
		self parentModel childrenModel remove: self].
	self = self system sourceModel ifTrue:[
		ORSystem remove: self system
	].
	self system orionModels remove: self.
	
	"ORContext currentModel = self ifTrue:[ORContext currentModel: self parentModel]."
	^ self
]

{ #category : #'adding/removing' }
ORModel >> error [
	Transcript show: 'should not be there'.
	super error
]

{ #category : #'initialize-release' }
ORModel >> initialize [ 
	super initialize.
	childrenModel := OrderedCollection new.
	changes := OrderedCollection new. 
	storage := ORStorage new.
	storage model: self.
	state currentContext: self.
]

{ #category : #testing }
ORModel >> isModifiable [
	^ self childrenModel isEmpty and: [ self ~= self system sourceModel ]
]

{ #category : #accessing }
ORModel >> mooseInterestingEntity [ 
	"-- interestingEntity is called before UI actions, hence we optimize for runtime --" 
	
	self entityStorage. 
	^ self
]

{ #category : #accessing }
ORModel >> parentModel [
	^ parentModel
]

{ #category : #accessing }
ORModel >> parentModel: anObject [
	parentModel := anObject
]

{ #category : #creating }
ORModel >> populateModel [
	self sourceLanguage: self parentModel sourceLanguage.
	self parentModel entityStorage
		do: [ :anElement | 
			self entityStorage add: anElement.
			anElement addModel: self ]
]

{ #category : #diff }
ORModel >> prepareToDiff [
	self setAsCurrentContextForAllContainedEntities
]

{ #category : #'adding/removing' }
ORModel >> remove [

	^self delete
]

{ #category : #'adding/removing' }
ORModel >> remove: anElement [
	"remove an entity in the version"

	anElement removeModel: self.
	^ self entityStorage remove: anElement ifAbsent: [ self error ]
]

{ #category : #creating }
ORModel >> retrieveEntity: anEntity [
	^ (self contains: anEntity)
		ifTrue: [ anEntity ]
		ifFalse: [ | old new |
			old := self at: anEntity orionID.
			new := self createEntityFrom: old.
			new ]
]

{ #category : #initialization }
ORModel >> setAsCurrentContextForAllContainedEntities [
	self do: [ :entity | entity currentContext: self ]
]

{ #category : #accessing }
ORModel >> system [
	^ system
]

{ #category : #accessing }
ORModel >> system: anObject [

	system := anObject.
	anObject orionModels add: self.
	"ORContext currentModel: self."
]

{ #category : #creating }
ORModel >> withParent: aModel [
	self parentModel: aModel.
	aModel childrenModel add: self.
	self system: aModel system.
	self populateModel.
	^ self
]
