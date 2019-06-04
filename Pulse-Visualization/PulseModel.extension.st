Extension { #name : #PulseModel }

{ #category : #'*Pulse-Visualization' }
PulseModel >> generalView [
	<menuItem: 'Global view' category: 'PulseViz'>
	PulseViz generalViewOf: self
]

{ #category : #'*Pulse-Visualization' }
PulseModel >> histogram [
	<menuItem: 'Histogram' category: 'PulseViz'>
	PulseViz histogramFor: self
]

{ #category : #'*Pulse-Visualization' }
PulseModel >> histogram2 [
	<menuItem: 'Histogram2' category: 'PulseViz'>
	PulseViz histogram2For: self
]

{ #category : #'*Pulse-Visualization' }
PulseModel >> types [
	<menuItem: 'Types' category: 'PulseViz'>
	PulseViz typesFor: self
]
