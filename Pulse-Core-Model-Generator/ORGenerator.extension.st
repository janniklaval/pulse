Extension { #name : #ORGenerator }

{ #category : #'*Pulse-Core-Model-Generator' }
ORGenerator >> makeORForPulseClasses: aColl [
	"For all the class of the collection, Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	aColl select: [ :aClass | aClass inheritsFrom: PulseEntity ] thenDo: [ :c | self makeOR: c ]
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORGenerator class >> makeORForPulseClasses: aCollectionOfClasses [
	^ self new makeORForPulseClasses: aCollectionOfClasses
]

{ #category : #'*Pulse-Core-Model-Generator' }
ORGenerator class >> runOnPulseClasses [
	^ self
		makeORForPulseClasses:
			(((RPackage organizer packageNamed: 'Pulse')
				classes ) )
]
