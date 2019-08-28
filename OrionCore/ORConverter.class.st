Class {
	#name : #ORConverter,
	#superclass : #Object,
	#classVars : [
		'association',
		'modelShouldHaveOnlyOrionClasses'
	],
	#category : #OrionCore
}

{ #category : #'initialize-release' }
ORConverter class >> buildFromMooseModel: aMooseModel [
	"make all necessary to convert a model"

	| model system |
	model := ORConverter convertFromMooseModel: aMooseModel.
	system := ORSystem new.
	system sourceModel: model.
	model system: system.
	system name: 'Orion ' , model name.
	ORSystem add: system.
	(MooseModel root includes: aMooseModel)
		ifTrue: [ MooseModel root remove: aMooseModel ].
	^ model
]

{ #category : #'initialize-release' }
ORConverter class >> convertFromMooseModel: aMooseModel [
	"take a MooseModel and convert it in a ORModel"

	| model state |
	model := ORModel new.
	model name: aMooseModel name.
	model sourceLanguage: aMooseModel sourceLanguage.
	aMooseModel entities copy
		do: [ :anEntity | 
			| myNewClass newAtt |
			myNewClass := self mapping at: anEntity class ifAbsent: [ nil ].
			myNewClass
				ifNotNil: [ anEntity primitiveChangeClassTo: myNewClass new.
					state := anEntity privateState.
					state primitiveChangeClassTo: anEntity defaultStateClass new.
					newAtt := SmallDictionary new.
					state privateAttributes do: [ :attr | newAtt at: attr key put: attr value ].
					state privateAttributes: newAtt.
					anEntity privateState: state.
					model add: anEntity ] ].
	^ model
]

{ #category : #'initialize-release' }
ORConverter class >> initConverter [

		association := SmallDictionary new.
		association at: FAMIXClass put: ORClass.
		association at: FAMIXInvocation put: ORInvocation.
		association at: FAMIXMethod put: ORMethod.
		association at: FAMIXNamespace put: ORNamespace.
		association at: FAMIXPackage put: ORPackage.
		association at: FAMIXReference put: ORReference.
		association at: FAMIXInheritance put: ORInheritance.
		association at: FAMIXAccess put: ORAccess.
		association at: FAMIXAttribute put: ORAttribute.
		association at: FAMIXComment put: ORComment.
		association at: FAMIXFunction put: ORFunction.
		association at: FAMIXGlobalVariable put: ORGlobalVariable.
		association at: FAMIXImplicitVariable put: ORImplicitVariable.
		association at: FAMIXLocalVariable put: ORLocalVariable.
		association at: FAMIXParameter put: ORParameter.
		association at: FAMIXParameterType put: ORParameterType.
		association at: FAMIXParameterizableClass put: ORParameterizableClass.
		association at: FAMIXParameterizedType put: ORParameterizedType.
		association at: FAMIXPrimitiveType put: ORPrimitiveType.
		association at: FAMIXUnknownVariable put: ORUnknownVariable.
		association at: FAMIXAnnotationInstance put: ORAnnotationInstance.
		association at: FAMIXAnnotationInstanceAttribute put: ORAnnotationInstanceAttribute.
		association at: FAMIXAnnotationType put: ORAnnotationType.
		association at: FAMIXAnnotationTypeAttribute put: ORAnnotationTypeAttribute.
		association at: FAMIXCaughtException put: ORCaughtException.
		association at: FAMIXDeclaredException put: ORDeclaredException.
		association at: FAMIXEnumValue put: OREnumValue.
		association at: FAMIXEnum put: OREnum.
		association at: FAMIXType put: ORType.
		association at: FAMIXJavaSourceLanguage put: ORJavaSourceLanguage.
		"association at: FAMIXFile put: ORFile.
		association at: FAMIXFolder put: ORFolder."
		association at: FAMIXThrownException put: ORThrownException. 
		association at: FAMIXPharoAnchor put: ORPharoAnchor.
		association at: FAMIXFileAnchor put: ORFileAnchor .
		association at: FAMIXSourceTextAnchor put: ORSourceTextAnchor .
		association at: FAMIXIndexedFileAnchor put: ORIndexedFileAnchor .
		association at: FAMIXMultipleFileAnchor put: ORMultipleFileAnchor .
		association at: FAMIXAbstractFileAnchor put: ORAbstractFileAnchor .
		^association
]

{ #category : #'initialize-release' }
ORConverter class >> initialize [
	modelShouldHaveOnlyOrionClasses := false.
	association := nil.
]

{ #category : #'initialize-release' }
ORConverter class >> mapping [

	^association ifNil:[
		self initConverter
	]
]

{ #category : #'initialize-release' }
ORConverter class >> modelShouldHaveOnlyOrionClasses [
	^ modelShouldHaveOnlyOrionClasses
]

{ #category : #'initialize-release' }
ORConverter class >> modelShouldHaveOnlyOrionClasses: aBoolean [
	modelShouldHaveOnlyOrionClasses := aBoolean
]
