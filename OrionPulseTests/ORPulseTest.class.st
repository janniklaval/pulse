Class {
	#name : #ORPulseTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #OrionPulseTests
}

{ #category : #Accessing }
ORPulseTest >> model [
	model
		ifNil: [ | mod system |
			"mod := PulseModel new."
			mod := MooseModel root at: 1.
			mod name: 'ORPulseModelTest'.
			model := ORConverter convertFromMooseModel: mod.
			model name: 'Parent Model'.
			system := ORSystem new.
			system sourceModel: model.
			model system: system.
			^ model ]
		ifNotNil: [ ^ model ]
]
