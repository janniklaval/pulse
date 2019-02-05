Class {
	#name : #BaselineOfRMQ,
	#superclass : #BaselineOf,
	#category : #BaselineOfRMQ
}

{ #category : #baselines }
BaselineOfRMQ >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'RMQ-Core-Model'.
		spec package: 'RMQ-Core-Parser'.
		spec package: 'RMQ-Process'.
		spec package: 'RMQ-Core-Visualization'.
		spec package: 'RMQ-Core-Parser-Tests'.
		
		spec package: 'Amqp'.
		
		"spec configuration: 'Orion'
			with: [ spec
					className: 'ConfigurationOfOrion';
					versionString: #development;
					file: 'ConfigurationOfOrion';
					repository: 'http://smalltalkhub.com/mc/Moose/Orion/main' ]."
		
		"spec
                        baseline: 'Voyage'
                            with: [ spec
                                className: 'BaselineOfVoyage';
                                repository: 'github://pharo-nosql/voyage:1.5/mc';
                                loads: #('mongo tests') ];
                        import: 'Voyage'."
		spec
 			group: 'default' with: #(  'Amqp' 'RMQ-Core-Model' 'RMQ-Core-Parser' 'RMQ-Process' 'RMQ-Core-Visualization' 'RMQ-Core-Parser-Tests' ).
	].

]
