Extension { #name : #MooseModel }

{ #category : #'*RMQ-Core-Visualization' }
MooseModel >> generalView [
	<menuItem: 'Global view' category: 'RMQViz'>
	RMQViz generalViewOf: self
]

{ #category : #'*RMQ-Core-Visualization' }
MooseModel >> histogram [
	<menuItem: 'Histogram' category: 'RMQViz'>
	RMQViz histogramFor: self
]

{ #category : #'*RMQ-Core-Visualization' }
MooseModel >> histogram2 [
	<menuItem: 'Histogram2' category: 'RMQViz'>
	RMQViz histogram2For: self
]

{ #category : #'*RMQ-Core-Visualization' }
MooseModel >> types [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQViz typesFor: self
]
