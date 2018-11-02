Class {
	#name : #BaselineOfRMQ,
	#superclass : #BaselineOf,
	#category : #BaselineOfRMQ
}

{ #category : #baselines }
BaselineOfRMQ >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec repository: 'http://www.squeaksource.com/AMQP'.
		spec package: 'Amqp'.
		
		spec repository: 'github://janniklaval/pulse'.
		spec package: 'RMQ-Core-Enum'.
		spec package: 'RMQ-Core-Model'.
		spec package: 'RMQ-Core-Parser'.
		spec package: 'RMQ-Core-Visualization'. 
	].

]
