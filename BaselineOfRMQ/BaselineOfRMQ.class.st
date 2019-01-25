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
		
		spec
                        baseline: 'Voyage'
                            with: [ spec
                                className: 'BaselineOfVoyage';
                                repository: 'github://pharo-nosql/voyage/mc';
                                loads: #('mongo tests') ];
                        import: 'Voyage'.
		spec
 			group: 'default' with: #(  'Amqp' 'Voyage' 'Orion' 'RMQ-Core-Enum' 'RMQ-Core-Model' 'RMQ-Core-Parser' 'RMQ-Core-Visualization').
	].

]
