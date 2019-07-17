Class {
	#name : #BaselineOfPulse,
	#superclass : #BaselineOf,
	#category : #BaselineOfPulse
}

{ #category : #baselines }
BaselineOfPulse >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'Pulse' with: [ spec requires: 'Voyage' ].
		spec package: 'Pulse-Core-Model-Generator' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Parser' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Process' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Visualization' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Parser-Tests' with: [ spec requires: 'Pulse' ].
		spec package: 'Pulse-Indicators' with: [ spec requires: 'Pulse' ].
		spec package: 'OrionPulseCore' with: [ spec requires: #('Pulse' 'Orion') ].
		
		spec package: 'Amqp'.
		
	spec baseline: 'Moose' 
                            with: [ spec
                                className: 'BaselineOfMoose';
                                repository: 'github://moosetechnology/Moose:v7.0.0/src'.
                                ].
		

		spec baseline: 'PetitParser'
                            with: [ spec
                                className: 'BaselineOfPetitParser';
                                repository: 'github://moosetechnology/PetitParser/src';
                                loads: #('PetitJson') ].

		
		spec configuration: 'Orion'
			with: [ spec
					className: 'ConfigurationOfOrion';
					versionString: #development;
					file: 'ConfigurationOfOrion';
					repository: 'http://smalltalkhub.com/mc/Moose/Orion/main' ].
		
		spec baseline: 'Voyage'
                            with: [ spec
                                className: 'BaselineOfVoyage';
                                repository: 'github://pharo-nosql/voyage/mc';
                                loads: #('mongo tests') ]";
                        import: 'Voyage'".

	spec baseline: 'Cruiser'
                            with: [ spec
                                className: 'BaselineOfCruiser';
                                repository: 'github://VincentBlondeau/Cruiser'.
                                ].

		spec
 			group: 'default' with: #(  'Amqp' 'Moose' 'PetitParser' 'Orion' 'Voyage' 'Cruiser' 'Pulse' 'Pulse-Core-Model-Generator' 'Pulse-Parser' 'Pulse-Process' 'Pulse-Visualization' 'Pulse-Parser-Tests' 'Pulse-Indicators' 'OrionPulseCore').
	].

]
