Class {
	#name : #PulseRESTGetter,
	#superclass : #Object,
	#instVars : [
		'ipAddr',
		'portAddr',
		'username',
		'password'
	],
	#category : #'Pulse-Parser'
}

{ #category : #public }
PulseRESTGetter >> alivenessTestOfVhost: vhost [

	^self get: 'aliveness-test/', vhost
]

{ #category : #public }
PulseRESTGetter >> bindings [

	^self get: 'bindings'
]

{ #category : #public }
PulseRESTGetter >> bindingsInVHost: vhost [

	^self get: 'bindings/', vhost
]

{ #category : #public }
PulseRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andExchange: exchange2 [

	^self get: 'bindings/', vhost, '/e/', exchange, '/e/', exchange2
]

{ #category : #public }
PulseRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andExchange: exchange2 props: props [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', exchange2, '/', props
]

{ #category : #public }
PulseRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andQueue: queue [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', queue
]

{ #category : #public }
PulseRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andQueue: queue props: props [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', queue, '/', props
]

{ #category : #public }
PulseRESTGetter >> bindingsOfDestinationExchange: exchange inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', exchange, '/bindings/destination'
]

{ #category : #public }
PulseRESTGetter >> bindingsOfQueue: queue inVHost: vhost [

	^self get: 'queues/', vhost, '/', queue, '/bindings'
]

{ #category : #public }
PulseRESTGetter >> bindingsOfSourceExchange: exchange inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', exchange, '/bindings/source'
]

{ #category : #private }
PulseRESTGetter >> buildUrlForApi: aString [

	 "self new buildUrlForApi:'definitions'"

	^ 'http://', ipAddr, ':', portAddr,'/api/', aString

]

{ #category : #public }
PulseRESTGetter >> channel: name [

	^self get: 'channels/', name
]

{ #category : #public }
PulseRESTGetter >> channels [

	^self get: 'channels'
]

{ #category : #public }
PulseRESTGetter >> clustername [

	^self get: 'cluster-name'
]

{ #category : #public }
PulseRESTGetter >> connection: name [

	^self get: 'connections/', name
]

{ #category : #public }
PulseRESTGetter >> connectionChannels: name [

	^self get: 'connections/', name, '/channels'
]

{ #category : #public }
PulseRESTGetter >> connections [

	^self get: 'connections'
]

{ #category : #public }
PulseRESTGetter >> consumers [

	^self get: 'consumers'
]

{ #category : #public }
PulseRESTGetter >> consumersInVHost: name [

	^self get: 'consumers/', name
]

{ #category : #public }
PulseRESTGetter >> definitions [

	^self get: 'definitions'
]

{ #category : #public }
PulseRESTGetter >> exchange: name inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', name
]

{ #category : #public }
PulseRESTGetter >> exchanges [

	^self get: 'exchanges'
]

{ #category : #public }
PulseRESTGetter >> exchangesInVHost: name [

	^self get: 'exchanges/', name
]

{ #category : #public }
PulseRESTGetter >> extensions [

	^self get: 'extensions'
]

{ #category : #private }
PulseRESTGetter >> get: aURLString [

	^ (ZnEasy get: (self buildUrlForApi: aURLString) username: username password: password) contents.
]

{ #category : #initialization }
PulseRESTGetter >> initialize [

	super initialize.
	ipAddr := 'localhost'.
	portAddr := '15672'.
	username := 'guest'.
	password := 'guest'
	

]

{ #category : #accessing }
PulseRESTGetter >> ipAddr [
	^ ipAddr
]

{ #category : #accessing }
PulseRESTGetter >> ipAddr: anObject [
	ipAddr := anObject
]

{ #category : #public }
PulseRESTGetter >> node: name [

	^self get: 'nodes/', name
]

{ #category : #public }
PulseRESTGetter >> nodes [

	^self get: 'nodes'
]

{ #category : #public }
PulseRESTGetter >> overview [

	^self get: 'overview'
]

{ #category : #public }
PulseRESTGetter >> parameter: name ofComponent: comp inVhost: vhost [

	^self get: 'parameters/',  comp, '/', vhost, '/', name
]

{ #category : #public }
PulseRESTGetter >> parameters [

	^self get: 'parameters'
]

{ #category : #public }
PulseRESTGetter >> parametersOfComponent: name [

	^self get: 'parameters/', name
]

{ #category : #accessing }
PulseRESTGetter >> password [
	^ password
]

{ #category : #accessing }
PulseRESTGetter >> password: anObject [
	password := anObject
]

{ #category : #public }
PulseRESTGetter >> permissionOfUser: name [

	^self get: 'users/', name, '/permissions'
]

{ #category : #public }
PulseRESTGetter >> permissionOfUser: name inVHost: vhost [

	^self get: 'permissions/', vhost, '/', name
]

{ #category : #public }
PulseRESTGetter >> permissionOfVhost: name [

	^self get: 'vhosts/', name, '/permissions'
]

{ #category : #public }
PulseRESTGetter >> permissions [

	^self get: 'permissions'
]

{ #category : #public }
PulseRESTGetter >> policies [

	^self get: 'policies'
]

{ #category : #public }
PulseRESTGetter >> policiesOfVhost: vhost [

	^self get: 'policies/', vhost
]

{ #category : #public }
PulseRESTGetter >> policy: name ofVhost: vhost [

	^self get: 'policies/', vhost, '/', name
]

{ #category : #accessing }
PulseRESTGetter >> portAddr [
	^ portAddr
]

{ #category : #accessing }
PulseRESTGetter >> portAddr: anObject [
	portAddr := anObject
]

{ #category : #public }
PulseRESTGetter >> queue: name inVHost: vhost [

	^self get: 'queues/', vhost, '/', name
]

{ #category : #public }
PulseRESTGetter >> queues [

	^self get: 'queues'
]

{ #category : #public }
PulseRESTGetter >> queuesInVHost: vhost [

	^self get: 'queues/', vhost
]

{ #category : #public }
PulseRESTGetter >> user: name [

	^self get: 'users/', name
]

{ #category : #accessing }
PulseRESTGetter >> username [
	^ username
]

{ #category : #accessing }
PulseRESTGetter >> username: anObject [
	username := anObject
]

{ #category : #public }
PulseRESTGetter >> users [

	^self get: 'users'
]

{ #category : #public }
PulseRESTGetter >> vhost: name [

	^self get: 'vhosts/', name
]

{ #category : #public }
PulseRESTGetter >> vhosts [

	^self get: 'vhosts'
]

{ #category : #public }
PulseRESTGetter >> whoami [

	^self get: 'whoami'
]
