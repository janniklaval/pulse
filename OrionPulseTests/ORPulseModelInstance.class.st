Class {
	#name : #ORPulseModelInstance,
	#superclass : #Object,
	#category : #OrionPulseTests
}

{ #category : #adding }
ORPulseModelInstance class >> addChildModelNamed: aChild to: aParentModel [

	| model |
	
	model := (ORModel withParent: aParentModel) name: aChild.
	
	^ model
]

{ #category : #'as yet unclassified' }
ORPulseModelInstance class >> addToMoosePanel: aModel [
	
	MooseModel root add: aModel.
]

{ #category : #'as yet unclassified' }
ORPulseModelInstance class >> createFromMooseModel: aModelNumber name: aName [

	| model orMod system |
	
	model := MooseModel root at: aModelNumber.
	orMod := ORPulseConverter convertFromMooseModel: model.
	orMod name: aName.
	
	system := ORSystem new.
	system sourceModel: orMod.
	orMod system: system.
	
	^ orMod
]
