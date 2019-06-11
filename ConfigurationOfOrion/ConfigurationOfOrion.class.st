"
ConfigurationOfOrion loadBleedingEdge
"
Class {
	#name : #ConfigurationOfOrion,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #ConfigurationOfOrion
}

{ #category : #private }
ConfigurationOfOrion class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #catalog }
ConfigurationOfOrion class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ 'No release yet! But works under Moose 6.1 (Pharo 6)'"'- Version number - Date - topics
[[[
	ConfigurationOfXXX project version: ''xx'' ) load					
]]]
or simply
- Version number - Date - topics
- Version number - Date - topics
- Version number - Date - topics.'"
]

{ #category : #catalog }
ConfigurationOfOrion class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ 'Orion is an amazing project . You can get in contact with our great programmers: Jannik Laval <jannik.laval@univ-lyon2.fr>, Nicolas Anquetil <Nicolas.Anquetil@inria.fr> & Anne Etien <anne.etien@univ-lille1.fr>.'
]

{ #category : #catalog }
ConfigurationOfOrion class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'Orion is an interactive prototyping tool for reengineering, to simulate changes and compare their impact on multiple versions of software source code models.'
]

{ #category : #catalog }
ConfigurationOfOrion class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ 'Orion is too complex to be explained in these few lines. But to play with it, first create a Moose model (or import it), in the moose panel, do a right click and do Orion > Convert to ORModel. Now, open the Orion panel: you can create a child model and begin to create, delete, modify the entities.'
]

{ #category : #catalog }
ConfigurationOfOrion class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(Moose model delta versioning) 
]

{ #category : #private }
ConfigurationOfOrion class >> ensureMetacello [
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://smalltalkhub.com/mc/dkh/metacello/main';
				package: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]
]

{ #category : #'metacello tool support' }
ConfigurationOfOrion class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #accessing }
ConfigurationOfOrion class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #accessing }
ConfigurationOfOrion class >> loadBleedingEdge [
	(self project version: #bleedingEdge) load.
]

{ #category : #accessing }
ConfigurationOfOrion class >> loadDevelopment [
	(self project version: #development) load.
]

{ #category : #accessing }
ConfigurationOfOrion class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline01: spec [ 
	<version: '01-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://ss3.gemstone.com/ss/Orion'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
						
	].
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline02: spec [ 
	<version: '02-baseline'>
	spec for: #common do: [
		spec blessing: #baseline.
	
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionBrowser';
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2'.
		spec repository: 'http://smalltalkhub.com/mc/AnneEtien/FamixDiff/main'.
		spec 
			package: 'Famix-Diff-Orion'.
	].
]

{ #category : #baselines }
ConfigurationOfOrion >> baseline03: spec [
	<version: '03-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
		spec 
			package: 'OrionCore';
			package: 'OrionFamixCore' with: [
				spec requires: #('OrionCore' 'OrionCore' ). ];
			package: 'OrionBrowser' with: [
				spec requires: #('OrionCore' 'OrionFamixCore' 'OrionCore' 'OrionFamixCore' ). ];
			package: 'OrionTest';
			package: 'Orion-TestModel-Constellation1';
			package: 'Orion-TestModel-Constellation2';
			package: 'OrionFamixJava' with: [
				spec requires: #('OrionFamixCore' ). ];
			package: 'Famix-Diff-Orion'.
		spec 
			group: 'default' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2');
			group: 'java' with: #('OrionCore' 'OrionFamixCore' 'OrionBrowser' 'OrionTest' 'Orion-TestModel-Constellation1' 'Orion-TestModel-Constellation2' 'OrionFamixJava' ). ].

]

{ #category : #baselines }
ConfigurationOfOrion >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'pharo2.x' version: '03-baseline'.	
	spec for: #'pharo3.x' version: '03-baseline'.
	spec for: #'common' version: '03-baseline'.
]

{ #category : #accessing }
ConfigurationOfOrion >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]
]
