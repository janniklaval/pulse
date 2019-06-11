Class {
	#name : #BaselineOfPulse,
	#superclass : #BaselineOf,
	#category : #BaselineOfPulse
}

{ #category : #baselines }
BaselineOfPulse >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		
		spec package: 'Pulse'.
		spec package: 'Pulse-Model-Generator'.
		spec package: 'Pulse-Parser'.
		spec package: 'Pulse-Process'.
		spec package: 'Pulse-Visualization'.
		spec package: 'Pulse-Parser-Tests'.
		
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
 			group: 'default' with: #(  'Amqp' 'Pulse' 'Pulse-Model-Generator' 'Pulse-Parser' 'Pulse-Process' 'Pulse-Visualization' 'Pulse-Parser-Tests').
	].

]
