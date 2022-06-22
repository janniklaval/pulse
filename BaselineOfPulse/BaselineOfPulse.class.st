Class {
	#name : #BaselineOfPulse,
	#superclass : #BaselineOf,
	#category : #BaselineOfPulse
}

{ #category : #baselines }
BaselineOfPulse >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'Pulse' "with: [ spec requires: 'Voyage' ]".
		spec package: 'Pulse-Core-Model-Generator' with: [ spec requires: 'Pulse' "'Orion'" ].
		spec package: 'Pulse-Parser' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Process' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Visualization' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Parser-Tests' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Indicators' with: [ spec requires: 'Pulse' ].
		spec package: 'OrionPulseEntities-Trait' with: [ spec requires: #('Pulse' 'Orion') ].
		spec package: 'OrionPulseEntities-Class' with: [ spec requires: #('OrionPulseEntities-Trait' 'Pulse' 'Orion') ].
		spec package: 'OrionPulseEntities-Action' with: [ spec requires: #( 'OrionPulseEntities-Class' 'Pulse' 'Orion') ].
		spec package: 'OrionPulseTests' with: [ spec requires: #('Orion') ].
		
		spec package: 'Amqp'.
		
	spec baseline: 'Moose' 
                            with: [ spec
                                className: 'BaselineOfMoose';
                                repository: "'github://moosetechnology/Moose:development/src' "'github://moosetechnology/Moose:v7.0.2/src'.
                                ].
		spec baseline: 'Orion' 
                            with: [ spec
                                className: 'BaselineOfOrion';
                                repository: "'github://moosetechnology/Moose:development/src' "'github://janniklaval/Orion/repository'.
                                ].
		"spec configuration: 'Orion'
			with: [ spec
					className: 'ConfigurationOfOrion';
					versionString: #development;
					file: 'ConfigurationOfOrion';
					repository: 'github://janniklaval/Orion:master/src/repository/ConfigurationOfOrion' ]."
				"'http://smalltalkhub.com/mc/Moose/Orion/main'" 
		
		spec baseline: 'OrionGenerator' 
                            with: [ spec
                                className: 'BaselineOfOrionGenerator';
                                repository: "'github://moosetechnology/Moose:development/src' "'github://janniklaval/Orion/repository'.
 ].
		"spec configuration: 'OrionGenerator'
			with: [ spec
					className: 'ConfigurationOfOrionGenerator';
					versionString: #development;
					file: 'ConfigurationOfOrionGenerator';
					repository: 'github://janniklaval/Orion:master/src/repository/ConfigurationOfOrion' ]."
				"'http://smalltalkhub.com/mc/Moose/Orion/main'"

		spec baseline: 'Voyage'
                            with: [ spec
                                className: 'BaselineOfVoyage';
                                repository: 'github://pharo-nosql/voyage/mc';
                                loads: #('mongo tests') ]";
                        import: 'Voyage'".

	"spec baseline: 'Cruiser'
                            with: [ spec
                                className: 'BaselineOfCruiser';
                                repository: 'github://VincentBlondeau/Cruiser'.
                                ]."

		spec
 			group: 'default' with: #(  'Amqp' 'Moose' 'Orion' 'OrionGenerator' 'Voyage' "'Cruiser'" 'Pulse' 'Pulse-Core-Model-Generator' 'Pulse-Parser' 'Pulse-Process' 'Pulse-Visualization' 'Pulse-Parser-Tests' 'Pulse-Indicators' 'OrionPulseEntities-Trait' 'OrionPulseEntities-Class' 'OrionPulseEntities-Action' 'OrionPulseTests');
			group: 'minimal' with: #(  'Amqp' 'Pulse' 'Pulse-Core-Model-Generator' 'Pulse-Parser' 'Pulse-Process' 'Pulse-Visualization' 'Pulse-Parser-Tests' 'Pulse-Indicators').
	].
]
