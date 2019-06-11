Class {
	#name : #RMQOrionViz,
	#superclass : #Object,
	#category : #'RMQ-Core-Visualization'
}

{ #category : #accessing }
RMQOrionViz class >> typesFor: aModel [
"
RMQViz typesFor: MooseModel root third
"

| v shape elements l |


v := RTView new.
	shape := RTBox new color: Color green trans; size: [ :s | s messages asOrderedCollection size log *20].
	elements := shape elementsOn: (aModel allWithPulseType: MessageType).
	v addAll: elements.
	elements @ (RTLabeled new text: [ :s | s rmqState asString ]).
	elements @ (RTPopup new text: [ :s | s messages size ]).
	
	l := RTHorizontalLineLayout new.
	l on: elements.
	
	v add: ((RTLabel new elementOn: (aModel allWithPulseType: RMQMessage) first timestamp asDate asString , ' : ' , (aModel allWithPulseType: RMQMessage) size asString, ' messages') translateTo: 160 @ 100).
	v inspect
]

{ #category : #accessing }
RMQOrionViz class >> typesForAllModels: aModel [
"
RMQViz typesFor: MooseModel root third
"

| v shape shape2 elements1 elements2 l childModel |


childModel := aModel childrenModel at: 1.
v := RTView new.
	shape := RTBox new color: Color green trans; size: [ :s | s messages asOrderedCollection size log *20].
	shape2 := RTBox new color: Color green trans; size: [ :s | s messages asOrderedCollection size log *20].
	elements1 := shape elementsOn: (aModel allWithPulseType: MessageType).
	
	elements2 := shape2 elementsOn: (childModel allWithPulseType: MessageType).
	
	v addAll: elements1.
	v addAll: elements2.
	
	
	
	elements1 @ (RTLabeled new text: [ :s | s rmqState asString ]).
	elements1 @ (RTPopup new text: [ :s | s messages asOrderedCollection size ]).
	
	elements2 @ (RTLabeled new text: [ :s | s rmqState asString ]).
	elements2 @ (RTPopup new text: [ :s | s messages asOrderedCollection size ]).
	
	"l := RTHorizontalLineLayout new.
	l on: elements1."
	
	(RTGridLayout withGap: 50) on: elements1 .
	(RTGridLayout withGap: 50) on: elements2.
	RTConstraint new movable: elements1; fix: elements2; verticalPadding: 50; above; move.
	
	v add: ((RTLabel new elementOn: (aModel allWithPulseType: RMQMessage) first timestamp asDate asString , ' : ' , (aModel allWithPulseType: RMQMessage) size asString, ' messages') translateTo: 160 @ 100).
	
	v inspect
]
