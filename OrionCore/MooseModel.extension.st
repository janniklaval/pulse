Extension { #name : #MooseModel }

{ #category : #'*OrionCore-modelBuilder' }
MooseModel >> convertToOrion [
	<menuItem: 'Convert to ORModel' category: 'Orion'> 
	^ORConverter buildFromMooseModel: self.
]

{ #category : #'*OrionCore' }
MooseModel >> isModel [
	^ true
]
