Extension { #name : #OldPulseModel }

{ #category : #'*RMQ-Core-Visualization' }
OldPulseModel >> generalView [
	<menuItem: 'Global view' category: 'RMQViz'>
	RMQViz generalViewOf: self
]

{ #category : #'*RMQ-Core-Visualization' }
OldPulseModel >> histogram [
	<menuItem: 'Histogram' category: 'RMQViz'>
	RMQViz histogramFor: self
]

{ #category : #'*RMQ-Core-Visualization' }
OldPulseModel >> histogram2 [
	<menuItem: 'Histogram2' category: 'RMQViz'>
	RMQViz histogram2For: self
]

{ #category : #'*RMQ-Core-Visualization' }
OldPulseModel >> types [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQViz typesFor: self
]
