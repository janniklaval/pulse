Extension { #name : #MooseGroupRuntimeStorage }

{ #category : #'*Pulse' }
MooseGroupRuntimeStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	^elements detect:[:e | e pulseName = uniqueName ] ifNone: exceptionBlock
]
