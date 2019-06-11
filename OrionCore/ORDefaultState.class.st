Class {
	#name : #ORDefaultState,
	#superclass : #MooseDevelopmentState,
	#category : #OrionCore
}

{ #category : #adding }
ORDefaultState >> addModel: anORModel [
	^ attributes
		at: #privateModels
		ifPresent: [ :e | e add: anORModel ]
		ifAbsentPut: [ OrderedCollection with: anORModel ]
]

{ #category : #accessing }
ORDefaultState >> allProperties [ 
	 
	^self allPropertiesOR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> allPropertiesOR: aVersion [
	 
	^propertyCache values collect:[:e | e versionIn: aVersion]
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name ifAbsent: aBlock [ 
	 
	^ self attributeAt: name ifAbsent: aBlock OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name ifAbsent: aBlock OR: aVersion [
	 
	^ (attributes at: name ifAbsent: [aBlock value])  versionIn: aVersion.
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name ifAbsentPut: aBlock [ 
	 
	^self attributeAt: name ifAbsentPut: aBlock OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name ifAbsentPut: aBlock OR: aVersion [
	 
	^( attributes  at: name ifAbsentPut: ((aBlock value) versionIn: aVersion))
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name put: value [ 
	 
	^ self attributeAt: name put: value OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> attributeAt: name put: value OR: aVersion [
	 
	^ attributes at: name put: (value versionIn: aVersion).
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name ifAbsent: aBlock [ 
	 
	^ self cacheAt: name ifAbsent: aBlock OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name ifAbsent: aBlock OR: aVersion [
	 
	"^ (queryCache at: name->aVersion ifAbsent: [aBlock value]) versionIn: aVersion."
	^aBlock value versionIn: aVersion.
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name ifAbsentPut: aBlock [ 

	^ self cacheAt: name ifAbsentPut: aBlock OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name ifAbsentPut: aBlock OR: aVersion [

	"^ (queryCache at: name->aVersion ifAbsentPut: aBlock) versionIn: aVersion."
	^aBlock value versionIn: aVersion.
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name put: value [ 
	 
	^ self cacheAt: name put: value OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> cacheAt: name put: value OR: aVersion [
	 
	^ queryCache at: name->aVersion put: (value versionIn: aVersion).
]

{ #category : #accessing }
ORDefaultState >> currentContext [
	^ attributes at: #currentContext ifAbsentPut: [ self model ]
]

{ #category : #accessing }
ORDefaultState >> currentContext: aVersion [ 
	 
	^ attributes at: #currentContext
		put: aVersion
]

{ #category : #accessing }
ORDefaultState >> entityCache [ 
	 
	^self entityCacheOR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> entityCacheOR: aVersion [
	 
	^queryCache versionIn: aVersion
]

{ #category : #accessing }
ORDefaultState >> flushAttributes [
	 
	attributes initialize
]

{ #category : #accessing }
ORDefaultState >> flushGroups [ 
	 
	queryCache initialize
]

{ #category : #accessing }
ORDefaultState >> flushProperties [ 
	 
	propertyCache initialize
]

{ #category : #testing }
ORDefaultState >> hasMooseModel [
	^attributes includesKey: #privateModel
]

{ #category : #accessing }
ORDefaultState >> includesKey: selector [ 
	 
	^propertyCache includesKey: selector
]

{ #category : #accessing }
ORDefaultState >> initialize: anOREntity [ 
	 
	attributes := SmallDictionary new. 
	propertyCache := SmallDictionary new. 
	queryCache := SmallDictionary new.
	entity := anOREntity
]

{ #category : #accessing }
ORDefaultState >> model [ 
	 
	^attributes at: #privateModel 
		ifAbsent: [MooseModel ownerOf: self entity]
]

{ #category : #accessing }
ORDefaultState >> model: anObject [
	self addModel: anObject.
	^ attributes at: #privateModel put: anObject
]

{ #category : #accessing }
ORDefaultState >> models [
	^ attributes at: #privateModels ifAbsent: [ OrderedCollection new ]
]

{ #category : #accessing }
ORDefaultState >> printString [
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."
	self flag: #TODO.
	^ super printString
]

{ #category : #accessing }
ORDefaultState >> privateAttributes [

	^ attributes
]

{ #category : #accessing }
ORDefaultState >> privateAttributes: aDictionnary [

	attributes := aDictionnary.
]

{ #category : #accessing }
ORDefaultState >> propertyAt: name ifAbsent: aBlock [ 
	 
	^ self propertyAt: name ifAbsent: aBlock OR: self currentContext

]

{ #category : #accessing }
ORDefaultState >> propertyAt: name ifAbsent: aBlock OR: aVersion [
	 
	^ (propertyCache  at: name ifAbsent: [aBlock value]) versionIn: aVersion.

]

{ #category : #accessing }
ORDefaultState >> propertyAt: name ifAbsentPut: aBlock [ 
	 
	^ self propertyAt: name ifAbsentPut: aBlock OR: self currentContext

]

{ #category : #accessing }
ORDefaultState >> propertyAt: name ifAbsentPut: aBlock OR: aVersion [
	 
	^ (propertyCache  at: name ifAbsentPut: aBlock)versionIn: aVersion.

]

{ #category : #accessing }
ORDefaultState >> propertyAt: name put: value [ 
	 
	^ self propertyAt: name put: value OR: self currentContext
]

{ #category : #accessing }
ORDefaultState >> propertyAt: name put: value OR: aVersion [
	 
	^ propertyCache  at: name put: (value versionIn: aVersion).

]

{ #category : #accessing }
ORDefaultState >> queryCache [
	^self entityCache
]

{ #category : #'as yet unclassified' }
ORDefaultState >> removeModel: anORModel [
	^ attributes at: #privateModels ifPresent: [ :e | e remove: anORModel ] ifAbsentPut: [ OrderedCollection new ]
]
