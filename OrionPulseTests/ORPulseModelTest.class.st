Class {
	#name : #ORPulseModelTest,
	#superclass : #ORPulseTest,
	#category : #OrionPulseTests
}

{ #category : #'testing OrionModel' }
ORPulseModelTest >> testModelCreation [
	| asS orionModel |
	asS := self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.
	self assert: asS orionModels size equals: 2.
	self assert: (asS sourceModel childrenModel includes: orionModel).
	self assert: orionModel parentModel equals: asS sourceModel. 
	self assert: orionModel system equals: asS.
	self assert: orionModel sourceLanguage equals: asS sourceModel sourceLanguage.
	self assert: orionModel entityStorage size equals: asS sourceModel entityStorage size.
]
