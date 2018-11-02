Class {
	#name : #RMQRESTGetter,
	#superclass : #Object,
	#instVars : [
		'ipAddr',
		'portAddr',
		'username',
		'password'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #public }
RMQRESTGetter >> alivenessTestOfVhost: vhost [

	^self get: 'aliveness-test/', vhost
]

{ #category : #public }
RMQRESTGetter >> bindings [

	^self get: 'bindings'
]

{ #category : #public }
RMQRESTGetter >> bindingsInVHost: vhost [

	^self get: 'bindings/', vhost
]

{ #category : #public }
RMQRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andExchange: exchange2 [

	^self get: 'bindings/', vhost, '/e/', exchange, '/e/', exchange2
]

{ #category : #public }
RMQRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andExchange: exchange2 props: props [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', exchange2, '/', props
]

{ #category : #public }
RMQRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andQueue: queue [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', queue
]

{ #category : #public }
RMQRESTGetter >> bindingsInVHost: vhost betweenExchange: exchange andQueue: queue props: props [

	^self get: 'bindings/', vhost, '/e/', exchange, '/q/', queue, '/', props
]

{ #category : #public }
RMQRESTGetter >> bindingsOfDestinationExchange: exchange inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', exchange, '/bindings/destination'
]

{ #category : #public }
RMQRESTGetter >> bindingsOfQueue: queue inVHost: vhost [

	^self get: 'queues/', vhost, '/', queue, '/bindings'
]

{ #category : #public }
RMQRESTGetter >> bindingsOfSourceExchange: exchange inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', exchange, '/bindings/source'
]

{ #category : #private }
RMQRESTGetter >> buildUrlForApi: aString [

	 "self new buildUrlForApi:'definitions'"

	^ 'http://', ipAddr, ':', portAddr,'/api/', aString

]

{ #category : #public }
RMQRESTGetter >> channel: name [

	^self get: 'channels/', name
]

{ #category : #public }
RMQRESTGetter >> channels [

	^self get: 'channels'
]

{ #category : #public }
RMQRESTGetter >> clustername [

	^self get: 'cluster-name'
]

{ #category : #public }
RMQRESTGetter >> connection: name [

	^self get: 'connections/', name
]

{ #category : #public }
RMQRESTGetter >> connectionChannels: name [

	^self get: 'connections/', name, '/channels'
]

{ #category : #public }
RMQRESTGetter >> connections [

	^self get: 'connections'
]

{ #category : #public }
RMQRESTGetter >> consumers [

	^self get: 'consumers'
]

{ #category : #public }
RMQRESTGetter >> consumersInVHost: name [

	^self get: 'consumers/', name
]

{ #category : #public }
RMQRESTGetter >> definitions [

	^self get: 'definitions'
]

{ #category : #public }
RMQRESTGetter >> exchange: name inVHost: vhost [

	^self get: 'exchanges/', vhost, '/', name
]

{ #category : #public }
RMQRESTGetter >> exchanges [

	^self get: 'exchanges'
]

{ #category : #public }
RMQRESTGetter >> exchangesInVHost: name [

	^self get: 'exchanges/', name
]

{ #category : #public }
RMQRESTGetter >> extensions [

	^self get: 'extensions'
]

{ #category : #private }
RMQRESTGetter >> get: aURLString [

	^ (ZnEasy get: (self buildUrlForApi: aURLString) username: username password: password) contents.
]

{ #category : #initialization }
RMQRESTGetter >> initialize [

	super initialize.
	ipAddr := 'localhost'.
	portAddr := '15672'.
	username := 'guest'.
	password := 'guest'
	

]

{ #category : #accessing }
RMQRESTGetter >> ipAddr [
	^ ipAddr
]

{ #category : #accessing }
RMQRESTGetter >> ipAddr: anObject [
	ipAddr := anObject
]

{ #category : #public }
RMQRESTGetter >> node: name [

	^self get: 'nodes/', name
]

{ #category : #public }
RMQRESTGetter >> nodes [

	^self get: 'nodes'
]

{ #category : #public }
RMQRESTGetter >> overview [

	^self get: 'overview'
]

{ #category : #public }
RMQRESTGetter >> parameter: name ofComponent: comp inVhost: vhost [

	^self get: 'parameters/',  comp, '/', vhost, '/', name
]

{ #category : #public }
RMQRESTGetter >> parameters [

	^self get: 'parameters'
]

{ #category : #public }
RMQRESTGetter >> parametersOfComponent: name [

	^self get: 'parameters/', name
]

{ #category : #accessing }
RMQRESTGetter >> password [
	^ password
]

{ #category : #accessing }
RMQRESTGetter >> password: anObject [
	password := anObject
]

{ #category : #public }
RMQRESTGetter >> permissionOfUser: name [

	^self get: 'users/', name, '/permissions'
]

{ #category : #public }
RMQRESTGetter >> permissionOfUser: name inVHost: vhost [

	^self get: 'permissions/', vhost, '/', name
]

{ #category : #public }
RMQRESTGetter >> permissionOfVhost: name [

	^self get: 'vhosts/', name, '/permissions'
]

{ #category : #public }
RMQRESTGetter >> permissions [

	^self get: 'permissions'
]

{ #category : #public }
RMQRESTGetter >> policies [

	^self get: 'policies'
]

{ #category : #public }
RMQRESTGetter >> policiesOfVhost: vhost [

	^self get: 'policies/', vhost
]

{ #category : #public }
RMQRESTGetter >> policy: name ofVhost: vhost [

	^self get: 'policies/', vhost, '/', name
]

{ #category : #accessing }
RMQRESTGetter >> portAddr [
	^ portAddr
]

{ #category : #accessing }
RMQRESTGetter >> portAddr: anObject [
	portAddr := anObject
]

{ #category : #public }
RMQRESTGetter >> queue: name inVHost: vhost [

	^self get: 'queues/', vhost, '/', name
]

{ #category : #public }
RMQRESTGetter >> queues [

	^self get: 'queues'
]

{ #category : #public }
RMQRESTGetter >> queuesInVHost: vhost [

	^self get: 'queues/', vhost
]

{ #category : #public }
RMQRESTGetter >> user: name [

	^self get: 'users/', name
]

{ #category : #accessing }
RMQRESTGetter >> username [
	^ username
]

{ #category : #accessing }
RMQRESTGetter >> username: anObject [
	username := anObject
]

{ #category : #public }
RMQRESTGetter >> users [

	^self get: 'users'
]

{ #category : #public }
RMQRESTGetter >> vhost: name [

	^self get: 'vhosts/', name
]

{ #category : #public }
RMQRESTGetter >> vhosts [

	^self get: 'vhosts'
]

{ #category : #public }
RMQRESTGetter >> whoami [

	^self get: 'whoami'
]
