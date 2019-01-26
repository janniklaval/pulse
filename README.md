# pulse

On a Pharo Moose image : http://moosetechnology.org, install executing scripts:
```Smalltalk
Metacello new 
	repository: 'github://pharo-nosql/voyage:1.5/mc';
	baseline: 'Voyage';
	load: 'mongo tests'.
	

Metacello new 
	repository: 'http://smalltalkhub.com/mc/Moose/Orion/main';
	configuration: 'Orion';
	version: #development;
	load.
	
Metacello new
    baseline: 'Cruiser';
    repository: 'github://VincentBlondeau/Cruiser/src';
    load.

Metacello new
    baseline: 'RMQ';
    repository: 'github://janniklaval/pulse:develop';
    load.
```    
