Extension { #name : #ORActionGenerator }

{ #category : #'*Pulse-Core-Model-Generator' }
ORActionGenerator >> createActionClassNameWithType: aTypeOfAction for: anOREntity [
	"^ 'ORAction' , aTypeOfAction , anOREntity superclass name "
	^ 'ORAction' , aTypeOfAction , anOREntity superclass mooseDescription name 
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORActionGenerator >> generateRequiredMethods: anAction forAMovedEntity: anOREntity [
	| stream containerAttributes |
	(anOREntity superclass mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].	
	stream := WriteStream on: ''.
	stream << 'run'; cr; tab; << '<generated: true>'; cr.
	stream tab; << '| theEntity |'; cr.
	stream tab; << 'theEntity := self orionModel retrieveEntity: entity.'; cr.
	containerAttributes := anOREntity mooseDescription allContainerAttributes.
	self
		generateGettersAndSettersFrom: containerAttributes
		on: anAction
		withPackage: anOREntity mooseDescription package.
	anOREntity mooseDescription allContainerAttributes
		do: [ :aContainerProp | 
			stream tab; << 'self '; << aContainerProp implementingSelector; << ' ifNotNil: ['; cr.
			stream tab; tab; << '| theNewContainer |'; cr.
			stream tab tab << 'entity ' << aContainerProp implementingSelector.
			stream cr tab tab tab << 'ifNotNil: [ | theOldContainer |'.
			stream cr; tab; tab; tab; tab; << 'theOldContainer := self orionModel retrieveEntity: entity '; 
					<< aContainerProp implementingSelector; << '.'; cr.
			stream tab; tab; tab; tab; << 'theOldContainer private'; << aContainerProp opposite implementingSelector capitalized asMutator; 
					<< ' (theOldContainer private'; << aContainerProp opposite implementingSelector capitalized; 
					<< ' orionCopy orionRemove: theEntity) ].'; cr.
			stream tab; tab; << 'theNewContainer := self orionModel retrieveEntity: self '; << aContainerProp implementingSelector; 
					<< '.'; cr.
			stream tab; tab; << 'theEntity private'; << aContainerProp implementingSelector capitalized asMutator; 
					<< ' theNewContainer.'; cr.
			stream tab; tab; << 'theNewContainer private'; << aContainerProp opposite implementingSelector capitalized asMutator; 
					<< ' (theNewContainer private'; << aContainerProp opposite implementingSelector capitalized; 
					<< ' orionCopy unsafeAdd: theEntity)'; cr.
			stream tab; << '].'; cr ].
	stream tab << 'theEntity resetMooseName.'.
	stream cr tab; << '^ theEntity'.
	anAction compileSilently: stream contents classified: 'method execution - generated'
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORActionGenerator >> generateRequiredMethods: anAction forARemovedEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity superclass mooseDescription allComplexAttributesWithOpposite
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forARemovedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORActionGenerator >> generateRequiredMethods: anAction forAnAddEntity: anOREntity [
	self
		applyGenerationOfActionsOn: anOREntity superclass mooseDescription allAttributes
		onBlock: [ :assoc | 
			self
				generateRequiredMethods: anAction
				forAnAddedEntity: anOREntity
				withPackage: assoc key
				withProps: assoc value ]
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORActionGenerator class >> runOnPulseClasses [
	^ self
		createActionsForORClasses:
			(((RPackage organizer packageNamed: 'OrionPulseEntities-Class')
				classes ))
]
