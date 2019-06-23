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
			MooseModel root reset.
			MooseModel resetMeta.
			PulseLogParser parse: 'trace/traces4.log'.
			mod := MooseModel root at: 1.
			model := ORPulseConverter convertFromMooseModel: mod.
			model name: 'ORPulseModelTest Parent'.
			system := ORSystem new.
			system sourceModel: model.
			model system: system.
			^ model ]
		ifNotNil: [ ^ model ]
]
