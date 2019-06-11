Extension { #name : #PulseModel }

{ #category : #'*RMQ-Core-Visualization' }
PulseModel >> exchanges [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQViz exchanges: self
]

{ #category : #'*RMQ-Core-Visualization' }
PulseModel >> generalView [
	<menuItem: 'Global view' category: 'RMQViz'>
	RMQViz generalViewOf: self
]

{ #category : #'*RMQ-Core-Visualization' }
PulseModel >> histogram [
	<menuItem: 'Histogram' category: 'RMQViz'>
	RMQViz histogramFor: self
]

{ #category : #'*RMQ-Core-Visualization' }
PulseModel >> histogram2 [
	<menuItem: 'Histogram2' category: 'RMQViz'>
	RMQViz histogram2For: self
]

{ #category : #'*RMQ-Core-Visualization' }
PulseModel >> types [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQViz typesFor: self
]
