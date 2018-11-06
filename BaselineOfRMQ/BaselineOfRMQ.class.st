Class {
	#name : #BaselineOfRMQ,
	#superclass : #BaselineOf,
	#category : #BaselineOfRMQ
}

{ #category : #baselines }
BaselineOfRMQ >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'RMQ-Core-Enum'.
		spec package: 'RMQ-Core-Model'.
		spec package: 'RMQ-Core-Parser'.
		spec package: 'RMQ-Core-Visualization'. 
		
		spec package: 'Amqp'
			"with: [ spec
						repository: 'http://www.squeaksource.com/AMQP' ]".
		
		spec
 			group: 'default' with: #( 'RMQ-Core-Enum' 'RMQ-Core-Model' 'RMQ-Core-Parser' 'RMQ-Core-Visualization' 'Amqp' ).
	].

]
