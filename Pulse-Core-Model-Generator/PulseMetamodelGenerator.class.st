Class {
	#name : #PulseMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'enum',
		'authMechanism',
		'componentType',
		'deliveryMode',
		'deploymentMode',
		'encoding',
		'entity',
		'exchangeType',
		'guaranteeMode',
		'messageType',
		'nodeType',
		'state',
		'tag',
		'transportPolitic',
		'source',
		'authentification',
		'binding',
		'bindingWithExchange',
		'bindingWithQueue',
		'channel',
		'cluster',
		'connection',
		'consumerComponent',
		'consumerProcess',
		'exchange',
		'exchangeFormat',
		'message',
		'node',
		'payload',
		'permission',
		'publisherComponent',
		'queue',
		'role',
		'routingKey',
		'tenant',
		'user',
		'vhost'
	],
	#category : #'Pulse-Core-Model-Generator-Pulse-Core-Model-Generator'
}

{ #category : #accessing }
PulseMetamodelGenerator class >> packageName [

	^ #'Pulse'
]

{ #category : #accessing }
PulseMetamodelGenerator class >> prefix [

	^ #'Pulse'
]

{ #category : #definition }
PulseMetamodelGenerator >> defineClasses [

	entity := builder newClassNamed: #Entity.
	enum := builder newClassNamed: #Enum.
	authMechanism := builder newClassNamed: #AuthMechanism.
	componentType := builder newClassNamed: #ComponentType.
	deliveryMode := builder newClassNamed: #DeliveryMode.
	deploymentMode := builder newClassNamed: #DeploymentMode.
	encoding := builder newClassNamed: #Encoding.
	exchangeType := builder newClassNamed: #ExchangeType.
	guaranteeMode := builder newClassNamed: #GuaranteeMode.
	messageType := builder newClassNamed: #MessageType.
	nodeType := builder newClassNamed: #NodeType.
	state := builder newClassNamed: #State.
	tag := builder newClassNamed: #Tag.
	transportPolitic := builder newClassNamed: #TransportPolitic.
	source := builder newClassNamed: #Source.
	authentification := builder newClassNamed: #Authentification.
	binding := builder newClassNamed: #Binding.
	bindingWithExchange := builder newClassNamed: #BindingWithExchange.
	bindingWithQueue := builder newClassNamed: #BindingWithQueue.
	channel := builder newClassNamed: #Channel.
	cluster := builder newClassNamed: #Cluster.
	connection := builder newClassNamed: #Connection.
	consumerComponent := builder newClassNamed: #ConsumerComponent.
	consumerProcess := builder newClassNamed: #ConsumerProcess.
	exchange := builder newClassNamed: #Exchange.
	exchangeFormat := builder newClassNamed: #ExchangeFormat.
	message := builder newClassNamed: #Message.
	node := builder newClassNamed: #Node.
	payload := builder newClassNamed: #Payload.
	permission := builder newClassNamed: #Permission.
	publisherComponent := builder newClassNamed: #PublisherComponent.
	queue := builder newClassNamed: #Queue.
	role := builder newClassNamed: #Role.
	routingKey := builder newClassNamed: #RoutingKey.
	tenant := builder newClassNamed: #Tenant.
	user := builder newClassNamed: #User.
	vhost := builder newClassNamed: #VHost.
]

{ #category : #definition }
PulseMetamodelGenerator >> defineHierarchy [
	
	enum --|> entity.
	authMechanism --|> enum.
	componentType --|> enum.
	deliveryMode --|> enum.
	deploymentMode --|> enum.
	encoding --|> enum.
	exchangeType --|> enum.
	guaranteeMode --|> enum.
	messageType --|> enum.
	nodeType --|> enum.
	state --|> enum.
	tag --|> enum.
	transportPolitic --|> enum.
	source --|> entity.
	authentification --|> entity.
	binding --|> entity.
	bindingWithExchange --|> binding.
	bindingWithQueue --|> binding.
	channel --|> entity.
	cluster --|> entity.
	connection --|> entity.
	consumerComponent --|> entity.
	consumerProcess --|> entity.
	exchange --|> entity.
	exchangeFormat --|> entity.
	message --|> entity.
	node --|> entity.
	payload --|> entity.
	permission --|> entity.
	publisherComponent --|> entity.
	queue --|> entity.
	role --|> entity.
	routingKey --|> entity.
	tenant --|> entity.
	user --|> entity.
	vhost --|> entity.
]

{ #category : #definition }
PulseMetamodelGenerator >> defineProperties [

	((entity property: #pulseName type: #String) comment: 'TODO').
	((enum property: #pulseState type: #String) comment: 'TODO').
	((source property: #path type: #String) comment: 'TODO').
	((authentification property: #failureError type: #Number) comment: 'TODO').
	((authentification property: #success type: #Boolean) comment: 'TODO').
	((authentification property: #timestamp type: #Number) comment: 'TODO').
	((binding property: #creationDate type: #Number) comment: 'TODO').
	((binding property: #deletionDate type: #Number) comment: 'TODO').
	((channel property: #closingDate type: #Number) comment: 'TODO').
	((channel property: #creationDate type: #Number) comment: 'TODO').
	((channel property: #globalPrefetchCount type: #Number) comment: 'TODO').
	((channel property: #idleSince type: #Number) comment: 'TODO').
	((channel property: #pid type: #String) comment: 'TODO').
	((channel property: #prefetchCount type: #Number) comment: 'TODO').
	((connection property: #closingDate type: #Number) comment: 'TODO').
	((connection property: #connectedAt type: #Number) comment: 'TODO').
	((connection property: #connectionType type: #String) comment: 'TODO').
	((connection property: #creationDate type: #Number) comment: 'TODO').
	((connection property: #host type: #String) comment: 'TODO').
	((connection property: #peerHost type: #String) comment: 'TODO').
	((connection property: #peerPort type: #String) comment: 'TODO').
	((connection property: #pid type: #String) comment: 'TODO').
	((connection property: #port type: #Number) comment: 'TODO').
	((connection property: #protocol type: #String) comment: 'TODO').
	((connection property: #ssl type: #Boolean) comment: 'TODO').
	((connection property: #sslHash type: #String) comment: 'TODO').
	((connection property: #sslProtocol type: #String) comment: 'TODO').
	((consumerComponent property: #address type: #String) comment: 'TODO').
	((consumerComponent property: #appId type: #String) comment: 'TODO').
	((consumerComponent property: #author type: #String) comment: 'TODO').
	((consumerComponent property: #guid type: #String) comment: 'TODO').
	((consumerComponent property: #owner type: #String) comment: 'TODO').
	((consumerComponent property: #platform type: #String) comment: 'TODO').
	((consumerComponent property: #tenantId type: #String) comment: 'TODO').
	((consumerComponent property: #version type: #String) comment: 'TODO').
	((consumerProcess property: #ackRequired type: #Boolean) comment: 'TODO').
	((consumerProcess property: #consumerTag type: #String) comment: 'TODO').
	((consumerProcess property: #creationDate type: #Number) comment: 'TODO').
	((consumerProcess property: #deletionDate type: #Number) comment: 'TODO').
	((consumerProcess property: #exclusive type: #Boolean) comment: 'TODO').
	((consumerProcess property: #guid type: #String) comment: 'TODO').
	((exchange property: #autoDelete type: #Boolean) comment: 'TODO').
	((exchange property: #creationDate type: #Number) comment: 'TODO').
	((exchange property: #deletionDate type: #Number) comment: 'TODO').
	((exchange property: #internal type: #Boolean) comment: 'TODO').
	((exchange property: #topicId type: #Number) comment: 'TODO').
	((exchangeFormat property: #exchangeFormatSchema type: #String) comment: 'TODO').
	((exchangeFormat property: #exchangeFormatType type: #String) comment: 'TODO').
	((message property: #encrypted type: #Boolean) comment: 'TODO').
	((message property: #messageId type: #Number) comment: 'TODO').
	((message property: #priority type: #Number) comment: 'TODO').
	((message property: #redelivered type: #Boolean) comment: 'TODO').
	((message property: #timestamp type: #Number) comment: 'TODO').
	((node property: #creationDate type: #Number) comment: 'TODO').
	((node property: #deletionDate type: #Number) comment: 'TODO').
	((node property: #host type: #String) comment: 'TODO').
	((node property: #port type: #Number) comment: 'TODO').
	((node property: #running type: #Boolean) comment: 'TODO').
	((node property: #size_byte type: #Number) comment: 'TODO').
	((permission property: #configureValue type: #String) comment: 'TODO').
	((permission property: #creationDate type: #Number) comment: 'TODO').
	((permission property: #deletionDate type: #Number) comment: 'TODO').
	((permission property: #readValue type: #String) comment: 'TODO').
	((permission property: #writeValue type: #String) comment: 'TODO').
	((publisherComponent property: #address type: #String) comment: 'TODO').
	((publisherComponent property: #appId type: #String) comment: 'TODO').
	((publisherComponent property: #author type: #String) comment: 'TODO').
	((publisherComponent property: #guid type: #String) comment: 'TODO').
	((publisherComponent property: #owner type: #String) comment: 'TODO').
	((publisherComponent property: #platform type: #String) comment: 'TODO').
	((publisherComponent property: #tenantId type: #String) comment: 'TODO').
	((publisherComponent property: #version type: #String) comment: 'TODO').
	((queue property: #autoDelete type: #Boolean) comment: 'TODO').
	((queue property: #creationDate type: #Number) comment: 'TODO').
	((queue property: #deletionDate type: #Number) comment: 'TODO').
	((queue property: #exclusive type: #Boolean) comment: 'TODO').
	((queue property: #expireAfter type: #Number) comment: 'TODO').
	((queue property: #idleSince type: #Number) comment: 'TODO').
	((queue property: #maxLength type: #Number) comment: 'TODO').
	((queue property: #maxLengthBytes type: #Number) comment: 'TODO').
	((queue property: #maxPriority type: #Number) comment: 'TODO').
	((queue property: #messageTTL type: #Number) comment: 'TODO').
	((role property: #settingDate type: #Number) comment: 'TODO').
	((tenant property: #tenantId type: #String) comment: 'TODO').
	((user property: #creationDate type: #Number) comment: 'TODO').
	((user property: #deletionDate type: #Number) comment: 'TODO').
	((user property: #hashingAlgorithm type: #String) comment: 'TODO').
	((user property: #password type: #String) comment: 'TODO').
	((user property: #passwordChangingDate type: #Number) comment: 'TODO').
	((user property: #passwordClearingDate type: #Number) comment: 'TODO').
	((user property: #passwordHash type: #String) comment: 'TODO').
	((vhost property: #creationDate type: #Number) comment: 'TODO').
	((vhost property: #deletionDate type: #Number) comment: 'TODO').
	((vhost property: #tracing type: #Boolean) comment: 'TODO').
	
	((queue property: #durability type: #Boolean) comment: 'TODO').
	((exchange property: #durability type: #Boolean) comment: 'TODO').
]

{ #category : #definition }
PulseMetamodelGenerator >> defineRelations [

	((entity property: #sources) comment: 'TODO') *-* ((source property: #entities) comment: 'TODO').
	((authMechanism property: #connections) comment: 'TODO') -* ((connection property: #authMechanism) comment: 'TODO').
	((componentType property: #publisherComponents) comment: 'TODO') -* ((publisherComponent property: #componentType) comment: 'TODO').
	((componentType property: #consumerComponents) comment: 'TODO') -* ((consumerComponent property: #componentType) comment: 'TODO').
	((deliveryMode property: #messages) comment: 'TODO') -* ((message property: #deliveryMode) comment: 'TODO').
	((deploymentMode property: #consumerComponents) comment: 'TODO') -* ((consumerComponent property: #deploymentMode) comment: 'TODO').
	((deploymentMode property: #publisherComponents) comment: 'TODO') -* ((publisherComponent property: #deploymentMode) comment: 'TODO').
	((encoding property: #payloads) comment: 'TODO') -* ((payload property: #encoding) comment: 'TODO').
	((exchangeType property: #exchanges) comment: 'TODO') -* ((exchange property: #type) comment: 'TODO').
	((guaranteeMode property: #channels) comment: 'TODO') -* ((channel property: #guaranteeMode) comment: 'TODO').
	((messageType property: #messages) comment: 'TODO') -* ((message property: #messageType) comment: 'TODO').
	((nodeType property: #nodes) comment: 'TODO') -* ((node property: #type) comment: 'TODO').
	((state property: #queues) comment: 'TODO') -* ((queue property: #pulseState) comment: 'TODO').
	((state property: #channels) comment: 'TODO') -* ((channel property: #pulseState) comment: 'TODO').
	((state property: #connections) comment: 'TODO') -* ((connection property: #pulseState) comment: 'TODO').
	((state property: #consumerComponents) comment: 'TODO') -* ((consumerComponent property: #pulseState) comment: 'TODO').
	((state property: #publisherComponents) comment: 'TODO') -* ((publisherComponent property: #pulseState) comment: 'TODO').
	((state property: #consumerProcesses) comment: 'TODO') -* ((consumerProcess property: #pulseState) comment: 'TODO').
	((tag property: #roles) comment: 'TODO') -* ((role property: #tag) comment: 'TODO').
	((authentification property: #user) comment: 'TODO') *- ((user property: #authentifications) comment: 'TODO').
	((binding property: #routingKey) comment: 'TODO') -* ((routingKey property: #binding) comment: 'TODO').
	((binding property: #source) comment: 'TODO') *- ((exchange property: #sourceBindings) comment: 'TODO').
	((binding property: #vhost) comment: 'TODO') *- ((vhost property: #bindings) comment: 'TODO').
	((bindingWithExchange property: #destination) comment: 'TODO') *- ((exchange property: #destinationBindings) comment: 'TODO').
	((bindingWithQueue property: #destination) comment: 'TODO') *- ((queue property: #destinationBindings) comment: 'TODO').
	((channel property: #connection) comment: 'TODO') *- ((connection property: #channels) comment: 'TODO').
	((channel property: #consumedQueues) comment: 'TODO') *-* ((queue property: #consumerChannels) comment: 'TODO').
	((channel property: #consumerComponent) comment: 'TODO') *- ((consumerComponent property: #subscribedChannels) comment: 'TODO').
	((channel property: #consumerProcess) comment: 'TODO') *- ((consumerProcess property: #subscribedChannels) comment: 'TODO').
	((channel property: #publisherComponent) comment: 'TODO') *- ((publisherComponent property: #usedChannels) comment: 'TODO').
	((channel property: #user) comment: 'TODO') *- ((user property: #usedChannels) comment: 'TODO').
	((channel property: #user_who_performed_connection) comment: 'TODO') *- ((user property: #initializedChannels) comment: 'TODO').
	((channel property: #vhost) comment: 'TODO') *- ((vhost property: #channels) comment: 'TODO').
	((cluster property: #nodes) comment: 'TODO') -* ((node property: #cluster) comment: 'TODO').
	((connection property: #user) comment: 'TODO') *- ((user property: #usedConnections) comment: 'TODO').
	((connection property: #user_who_performed_connection) comment: 'TODO') *- ((user property: #initializedConnections) comment: 'TODO').
	((connection property: #vhost) comment: 'TODO') *- ((vhost property: #connections) comment: 'TODO').
	((consumerComponent property: #consumerProcesses) comment: 'TODO') -* ((consumerProcess property: #consumerComponent) comment: 'TODO').
	((consumerComponent property: #subscribedChannels) comment: 'TODO') -* ((channel property: #consumerComponent) comment: 'TODO').
	((exchange property: #alternate_exchange_for) comment: 'TODO') -* ((exchange property: #my_alternate_exchange) comment: 'TODO').
	((exchange property: #publishedMessages) comment: 'TODO') -* ((message property: #publishedToExchange) comment: 'TODO').
	((exchange property: #publisherComponents) comment: 'TODO') *-* ((publisherComponent property: #exchanges) comment: 'TODO').
	((exchange property: #queues_for_dead_letter) comment: 'TODO') -* ((queue property: #dead_letter_exchange) comment: 'TODO').
	((exchange property: #user_who_performed_action) comment: 'TODO') *- ((user property: #initializedExchanges) comment: 'TODO').
	((exchange property: #vhost) comment: 'TODO') *- ((vhost property: #exchanges) comment: 'TODO').
	((exchangeFormat property: #messages) comment: 'TODO') -* ((message property: #exchangeFormat) comment: 'TODO').
	((message property: #deliveredFromQueues) comment: 'TODO') *-* ((queue property: #deliveredMessages) comment: 'TODO').
	((message property: #payload) comment: 'TODO') *- ((payload property: #messages) comment: 'TODO').
	((message property: #publisherComponent) comment: 'TODO') *- ((publisherComponent property: #messagesFromPublisher) comment: 'TODO').
	((message property: #routedToQueues) comment: 'TODO') *-* ((queue property: #routedMessages) comment: 'TODO').
	((message property: #routingKeys) comment: 'TODO') *-* ((routingKey property: #messages) comment: 'TODO').
	((node property: #vhosts) comment: 'TODO') -* ((vhost property: #node) comment: 'TODO').
	((permission property: #user) comment: 'TODO') *- ((user property: #permissions) comment: 'TODO').
	((permission property: #vhost) comment: 'TODO') *- ((vhost property: #permissions) comment: 'TODO').
	((queue property: #dead_letter_routing_key) comment: 'TODO') *- ((routingKey property: #queues_for_dead_letter) comment: 'TODO').
	((queue property: #vhost) comment: 'TODO') *- ((vhost property: #queues) comment: 'TODO').
	((role property: #user) comment: 'TODO') *- ((user property: #roles) comment: 'TODO').
	((user property: #vhost) comment: 'TODO') *- ((vhost property: #users) comment: 'TODO').
	
]
