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
		
		spec configuration: 'Orion'
			with: [ spec
					className: 'ConfigurationOfOrion';
					versionString: #development;
					file: 'ConfigurationOfOrion';
					repository: 'http://smalltalkhub.com/mc/Moose/Orion/main' ].
		
		spec configuration: 'VoyageMongo' 
		with: [ spec
					className: 'ConfigurationOfVoyageMongo';
					versionString: #stable;
					file: 'ConfigurationOfVoyageMongo';
				repository: 'http://smalltalkhub.com/mc/estebanlm/Voyage/main'].
		
		spec
 			group: 'default' with: #(  'Amqp' 'VoyageMongo' 'Orion' 'RMQ-Core-Enum' 'RMQ-Core-Model' 'RMQ-Core-Parser' 'RMQ-Core-Visualization').
	].

]
