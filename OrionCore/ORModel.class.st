"
An ORModel is an Orion Model

Instance Variables
	cache:		used to compute the actual model
	changes:		all the changes performed on the model
	childrenModel:		all the child versions created from the model
	parentModel:		parent model 
	system:		system where the model is stored


"
Class {
	#name : #ORModel,
	#superclass : #MooseModel,
	#instVars : [
		'parentModel',
		'childrenModel',
		'changes',
		'system',
		'cache'
	],
	#category : #OrionCore
}

{ #category : #'class initialization' }
ORModel class >> asMooseDescription [
	^ self meta descriptionOf: MooseModel
]

{ #category : #'class initialization' }
ORModel class >> initialize [
	self defaultState: MooseDevelopmentState
]

{ #category : #persistence }
ORModel class >> isVoyageRoot [
	^ true
]

{ #category : #'class initialization' }
ORModel class >> withParent: aModel [

	^ self new withParent:aModel
]

{ #category : #'adding/removing' }
ORModel >> add: anElement [ 
	super add: anElement. 
	anElement versionIn: self.
	^anElement
]

{ #category : #'adding/removing' }
ORModel >> addAnnotationTypeNamed: aString inModel: aModelVersion [
	aString
		ifNotNil: [ (ORActionAddAnnotationType new
				orionModel: aModelVersion;
				container: self ;
				newName: aString)
				manualRun;
				postRun ]
]

{ #category : #'adding/removing' }
ORModel >> addToListOfChanges: anAction [ 
	self changes add: anAction.
]

{ #category : #'RMQ accessing' }
ORModel >> allAuthMechanisms [
	<navigation: 'All AuthMechanisms group'>
	^self allWithType: AuthMechanism
]

{ #category : #changes }
ORModel >> allChanges [

	|collection current|
	collection := OrderedCollection new.
	current := self.
	
	[collection addAllFirst: current changes.
	current := current parentModel.
	current isNil] whileFalse.

	^collection
	
	
]

{ #category : #'RMQ accessing' }
ORModel >> allComponentTypes [
	<navigation: 'All ComponentTypes group'>
	^self allWithType: ComponentType
]

{ #category : #'RMQ accessing' }
ORModel >> allDeliveryModes [
	<navigation: 'All delivery modes group'>
	^self allWithType: DeliveryMode
]

{ #category : #'RMQ accessing' }
ORModel >> allDeploymentModes [
	<navigation: 'All Deployment modes group'>
	^self allWithType: DeploymentMode
]

{ #category : #'RMQ accessing' }
ORModel >> allDurabilities [
	<navigation: 'All Durabilities group'>
	^self allWithType: Durability
]

{ #category : #'RMQ accessing' }
ORModel >> allEncodings [
	<navigation: 'All Encodings group'>
	^self allWithType: Encoding
]

{ #category : #'RMQ accessing' }
ORModel >> allExchangeTypes [
	<navigation: 'All ExchangeTypes group'>
	^self allWithType: ExchangeType
]

{ #category : #'RMQ accessing' }
ORModel >> allGuaranteeModes [
	<navigation: 'All GuaranteeModes group'>
	^self allWithType: GuaranteeMode
]

{ #category : #'RMQ accessing' }
ORModel >> allMessageTypes [
	<navigation: 'All Message types group'>
	^self allWithType: MessageType
]

{ #category : #'RMQ accessing' }
ORModel >> allNodeTypes [
	<navigation: 'All NodeTypes group'>
	^self allWithType: NodeType
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQAuthentifications [
	<navigation: 'All RMQ authentification group'>
	^self allWithType: RMQAuthentification
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQBindingWithExchanges [
	<navigation: 'All RMQ Bindings with Exchanges group'>
	^self allWithType: RMQBindingWithExchange
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQBindingWithQueues [
	<navigation: 'All RMQ Bindings with Queues group'>
	^self allWithType: RMQBindingWithQueue
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQBindings [
	<navigation: 'All RMQ Bindings group'>
	^((self allWithType: RMQBindingWithExchange) union: (self allWithType: RMQBindingWithQueue))
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQChannels [
	<navigation: 'All RMQ channels group'>
	^self allWithType: RMQChannel
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQClusters [
	<navigation: 'All RMQ clusters group'>
	^self allWithType: RMQCluster
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQComponents [
	<navigation: 'All RMQ components group'>
	^self allWithType: RMQComponent
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQConnections [
	<navigation: 'All RMQ connections group'>
	^self allWithType: RMQConnection
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQExchangeFormats [
	<navigation: 'All RMQ exchangeFormats group'>
	^self allWithType: RMQExchangeFormat
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQExchanges [
	<navigation: 'All RMQ exchanges group'>
	^self allWithType: RMQExchange
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQMessages [
	<navigation: 'All RMQ messages group'>
	^self allWithType: RMQMessage
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQNodes [
	<navigation: 'All RMQ nodes group'>
	^self allWithType: RMQNode
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQPayloads [
	<navigation: 'All RMQ payloads group'>
	^self allWithType: RMQPayload
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQPermissions [
	<navigation: 'All RMQ permissions group'>
	^self allWithType: RMQPermission
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQQueues [
	<navigation: 'All RMQ queues group'>
	^self allWithType: RMQQueue
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQRoles [
	<navigation: 'All RMQ roles group'>
	^self allWithType: RMQRole
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQRoutingKeys [
	<navigation: 'All RMQ routing keys group'>
	^self allWithType: RMQRoutingKey
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQUsers [
	<navigation: 'All RMQ users group'>
	^self allWithType: RMQUser
]

{ #category : #'RMQ accessing' }
ORModel >> allRMQVHosts [
	<navigation: 'All RMQ vhosts group'>
	^self allWithType: RMQVHost
]

{ #category : #'RMQ accessing' }
ORModel >> allStates [
	<navigation: 'All States group'>
	^self allWithType: State
]

{ #category : #'RMQ accessing' }
ORModel >> allTags [
	<navigation: 'All Tags group'>
	^self allWithType: Tag
]

{ #category : #'RMQ accessing' }
ORModel >> allWithPulseType: aMetaDesription [
	| try |
	try := ORPulseConverter mapping at: aMetaDesription ifAbsent: [ aMetaDesription ].
	^ MooseGroup withAll: (self entityStorage selectAllWithType: try) withDescription: 'All ' , try mooseName asLowercase
]

{ #category : #navigation }
ORModel >> allWithType: aMetaDesription [
	| try |
	try := ORConverter mapping at: aMetaDesription ifAbsent: [ aMetaDesription ].
	^ MooseGroup withAll: (self entityStorage selectAllWithType: try) withDescription: 'All ' , try mooseName asLowercase
]

{ #category : #navigation }
ORModel >> at: anID [

	^self entityStorage at:anID.
]

{ #category : #accessing }
ORModel >> baseName [
	|op|
	op := 1.
	^self name copyFrom: 1 to: ((self name indexOf:$_ ifAbsent:[op := 0.self name size]) - op)
]

{ #category : #accessing }
ORModel >> cache [
	^ cache
]

{ #category : #accessing }
ORModel >> cache: anObject [
	cache := anObject
]

{ #category : #accessing }
ORModel >> changes [
	^ changes
]

{ #category : #accessing }
ORModel >> changes: anObject [
	changes := anObject
]

{ #category : #accessing }
ORModel >> childrenModel [
	^ childrenModel
]

{ #category : #accessing }
ORModel >> childrenModel: anObject [
	childrenModel := anObject
]

{ #category : #testing }
ORModel >> contains: anElement [
	^ anElement orionModel = self.
]

{ #category : #creating }
ORModel >> createEntityFrom: anEntity [
	| newEntity |
	self remove: anEntity.
	newEntity := anEntity shallowCopy.
	newEntity privateState: (ORDefaultState with: newEntity).
	newEntity orionModel: self.
	^ newEntity
]

{ #category : #creating }
ORModel >> createNewChildVersion [
	| newModel |
	newModel := ORModel withParent: self.
	newModel name: self baseName , '_' , Date current yyyymmdd , '_' , Time current print24.
	^ newModel
]

{ #category : #'initialize-release' }
ORModel >> defaultStateClass [ 
	"Answer the default implementator of this element's state." 
	 
	^ORDefaultState
]

{ #category : #'adding/removing' }
ORModel >> delete [
	"remove the version and all its children"
	
	self childrenModel do:[:each | each remove].
	
	self parentModel ifNotNil:[
		self parentModel childrenModel remove: self].
	self = self system sourceModel ifTrue:[
		ORSystem remove: self system
	].
	self system orionModels remove: self.
	
	"ORContext currentModel = self ifTrue:[ORContext currentModel: self parentModel]."
	^ self
]

{ #category : #'adding/removing' }
ORModel >> error [
	Transcript show: 'should not be there'.
	super error
]

{ #category : #'initialize-release' }
ORModel >> initialize [ 
	super initialize.
	childrenModel := OrderedCollection new.
	changes := OrderedCollection new. 
	storage := ORStorage new.
	storage model: self.
	state currentContext: self.
]

{ #category : #testing }
ORModel >> isModifiable [
	^ self childrenModel isEmpty and: [ self ~= self system sourceModel ]
]

{ #category : #accessing }
ORModel >> mooseInterestingEntity [ 
	"-- interestingEntity is called before UI actions, hence we optimize for runtime --" 
	
	self entityStorage. 
	^ self
]

{ #category : #accessing }
ORModel >> parentModel [
	^ parentModel
]

{ #category : #accessing }
ORModel >> parentModel: anObject [
	parentModel := anObject
]

{ #category : #creating }
ORModel >> populateModel [
	self sourceLanguage: self parentModel sourceLanguage.
	self parentModel entityStorage
		do: [ :anElement | 
			self entityStorage add: anElement.
			anElement addModel: self ]
]

{ #category : #diff }
ORModel >> prepareToDiff [
	self setAsCurrentContextForAllContainedEntities
]

{ #category : #'adding/removing' }
ORModel >> remove [

	^self delete
]

{ #category : #'adding/removing' }
ORModel >> remove: anElement [
	"remove an entity in the version"

	anElement removeModel: self.
	^ self entityStorage remove: anElement ifAbsent: [ self error ]
]

{ #category : #creating }
ORModel >> retrieveEntity: anEntity [
	^ (self contains: anEntity)
		ifTrue: [ anEntity ]
		ifFalse: [ | old new |
			old := self at: anEntity orionID.
			new := self createEntityFrom: old.
			new ]
]

{ #category : #'RMQ adding' }
ORModel >> selectOrAddEntityNamed: aName withType: aType [ 

	^ self entityNamed: aName withType: aType 
			ifAbsent:[ 
				|newEntity |
				newEntity := aType new
					pulseName: aName;
					mooseModel: self.
				
				newEntity ].
]

{ #category : #initialization }
ORModel >> setAsCurrentContextForAllContainedEntities [
	self do: [ :entity | entity currentContext: self ]
]

{ #category : #accessing }
ORModel >> system [
	^ system
]

{ #category : #accessing }
ORModel >> system: anObject [

	system := anObject.
	anObject orionModels add: self.
	"ORContext currentModel: self."
]

{ #category : #creating }
ORModel >> withParent: aModel [
	self parentModel: aModel.
	aModel childrenModel add: self.
	self system: aModel system.
	self populateModel.
	^ self
]
