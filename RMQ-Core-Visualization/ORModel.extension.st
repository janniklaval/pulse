Extension { #name : #ORModel }

{ #category : #'*RMQ-Core-Visualization' }
ORModel >> types [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQOrionViz typesFor: self
]

{ #category : #'*RMQ-Core-Visualization' }
ORModel >> typesForAllModels [
	<menuItem: 'Types' category: 'RMQViz'>
	RMQOrionViz typesForAllModels: self
]
