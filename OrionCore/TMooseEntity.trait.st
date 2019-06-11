"
A TMooseEntity is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. 
"
Trait {
	#name : #TMooseEntity,
	#category : #'OrionCore-trait'
}

{ #category : #'as yet unclassified' }
TMooseEntity classSide >> isOrionClass [
	^ true
]

{ #category : #accessing }
TMooseEntity >> addModel: aModel [
	^self privateState addModel: aModel
]

{ #category : #accessing }
TMooseEntity >> currentContext [
	"Answers the model containing the current entity"
	^ self privateState currentContext
]

{ #category : #accessing }
TMooseEntity >> currentContext: aVersion [
	"Answers the model containing the current entity"
	^ self privateState currentContext: aVersion
]

{ #category : #'initialize-release' }
TMooseEntity >> defaultStateClass [ 
	"Answer the default implementator of this element's state."
	^ORDefaultState
]

{ #category : #testing }
TMooseEntity >> isCreatedBetween: anOrionModel and: anotherOrionModel [
		
		^(anOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) isNil
			and:[(anotherOrionModel entityStorage atID: self mooseID ifAbsent:[nil]) notNil].
		
]

{ #category : #testing }
TMooseEntity >> isCreatedIn: anOrionModel [
		|parent|
		parent := anOrionModel parentModel.
		parent isNil 
			ifTrue:[^true]
			ifFalse:[
				^(parent entityStorage atID: self mooseID ifAbsent:[nil]) isNil.
			]
]

{ #category : #testing }
TMooseEntity >> isModifiedBetween: anOrionModel and: anotherOrionModel [
		|old new|
		old := anOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		new := anotherOrionModel entityStorage atID: self mooseID ifAbsent:[^false].
		
		^old mooseModel ~~ new mooseModel.
]

{ #category : #testing }
TMooseEntity >> isModifiedIn: anOrionModel [
	| parent |
	parent := anOrionModel parentModel.
	parent ifNil: [ ^ false ] ifNotNil: [ ^ (parent entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ]
]

{ #category : #testing }
TMooseEntity >> isOrionEntity [
	^ true
]

{ #category : #testing }
TMooseEntity >> isRemovedBetween: anOrionModel and: anotherOrionModel [
	^ (anOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) notNil and: [ (anotherOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ]
]

{ #category : #testing }
TMooseEntity >> isRemovedIn: anOrionModel [
	| parent |
	parent := anOrionModel parentModel.
	parent ifNil: [ ^ (anOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ].
	^ (parent entityStorage atID: self mooseID ifAbsent: [ nil ]) notNil and: [ (anOrionModel entityStorage atID: self mooseID ifAbsent: [ nil ]) isNil ]
]

{ #category : #accessing }
TMooseEntity >> orionID [
	^ self mooseID
]

{ #category : #accessing }
TMooseEntity >> orionModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
TMooseEntity >> orionModel: aModel [
	"Answers the model containing the current entity"
	^ self mooseModel: aModel
]

{ #category : #accessing }
TMooseEntity >> orionModels [
	"Answers the model containing the current entity"
	^ self privateState models
]

{ #category : #accessing }
TMooseEntity >> removeModel: aModel [
	^ self privateState removeModel: aModel
]

{ #category : #accessing }
TMooseEntity >> stateBetween: anOrionModel and: anotherOrionModel [

	(self isCreatedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isCreated].
	(self isModifiedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isModified].
	(self isRemovedBetween: anOrionModel and: anotherOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TMooseEntity >> stateIn: anOrionModel [

	(self isCreatedIn: anOrionModel) ifTrue:[^#isCreated].
	(self isModifiedIn: anOrionModel) ifTrue:[^#isModified].
	(self isRemovedIn: anOrionModel) ifTrue:[^#isRemoved].
	^#notChanged
	
]

{ #category : #accessing }
TMooseEntity >> versionIn: anOrionModel [
	| upEntity |
	upEntity := anOrionModel entityStorage
		atID: self mooseID
		ifAbsent: [ "OREntityNotFoundInCurrentModel signal: self model: anOrionModel."
			^ nil	"Should NEVER happen (excepted in one cases. See (*))... If it is happening, you are NOT in the right model and currentContext of the caller should have been set to the right model where the considered entity is existing. By set, I mean for at least the first entity where you begin the query; the currentContext is transmitted to the other entities  ---VB---
				(*) In fact, this method should answer nil only in one case, and only in this one: 	if an entity of a previous model has been deleted and is acceeded by a single value selector (i.e. not a multivalued one). E.g:						
						Let M1 and M2, 2 models. M1 is the parent of M2. 
						Let A and B 2 entites of M1, where we can access B from A through a method called m(). m() answers either an object or nil.
						If B is deleted in M2, the call of m() on A, in M1 should give B and in M2, nil.
						Calling m(), call privateM() that gives all the B in all the models: B. But, B does not exists in M2.
						I, versionIn:, do not find B in M2 (as expected), so fall in this absent block. AND SHOULD RETURN nil... (so disagree with Jannik Thesis: https://tel.archives-ouvertes.fr/tel-00601546...)" ].
	upEntity currentContext: anOrionModel.
	^ upEntity
]
