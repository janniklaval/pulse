Class {
	#name : #RMQViz,
	#superclass : #Object,
	#category : #'RMQ-Core-Visualization'
}

{ #category : #modules }
RMQViz class >> exchange: model [
	| exchanges |
	
	exchanges := (RTShapeBuilder new circle width: 500; height: 50; color: Color blue trans;
	withText: [:e | (e name substrings:'.') at: 3 ] height: 20 color: Color black)
	elementsOn: (model allRMQExchanges).
	
	exchanges @ RTDraggable.
	(RTHorizontalLineLayout withGap: 50) on: exchanges.
	
	^ exchanges
]

{ #category : #accessing }
RMQViz class >> exchanges: model [

	| v exchanges queues qShape |
	
	v := RTView new.
	
	exchanges := (RTShapeBuilder new circle width: [:e | ((e name substrings:'.') at: 3) byteSize * 20]; height: 50; color: Color blue trans;
	withText: [:e | (e name substrings:'.') at: 3 ] height: 20 color: Color black)
	elementsOn: (model allRMQExchanges).
	
	exchanges @ RTDraggable.
	exchanges := exchanges sort: [ :e :f | e model name < f model name ].
	RTVerticalLineLayout on: exchanges.
	exchanges collect: [ :e| e when: TRMouseClick do: [
			RMQViz typesFor: model
			]
		].
	
	v addAll: exchanges.
	
	v inspect
]

{ #category : #accessing }
RMQViz class >> generalViewOf: model [
| var v es lineShape producers exchanges queues consumers edges1 edges2 edges3|
v := RTView new.

es := (RTShapeBuilder new box; withText: #asString height: 40)
		elementsOn: { 'Producers' . 'Exchanges' . 'Queues' . 'Consumers' }.
	v addAll: es.
	es @ RTDraggable.
	

RTNest new for: es add: [ :group :localModel |
			
		(localModel = 'Producers') ifTrue: [
			producers := (RTShapeBuilder new box width: 300; height: 110; color: Color orange trans; borderColor: [ :e | ((model allRMQQueues reject:[:i | i name = 'none'] )contains:[:q | (( q name substrings:'.') at: 4) asString = e pulseName ]) ifTrue:[ Color black ] ] ;borderWidth: [ :e | ((model allRMQQueues reject:[:i | i name = 'none'] )contains:[:q | (( var := ( q name substrings:'.') at: 4)) = e pulseName ]) ifTrue:[ 4 ] ifFalse:[1] ]; withText: [:e | ((e name substrings:'.') at: 4) asString , String cr, 'last at: ', String cr, (e senderMessages sort:[:l :m | l timestamp < m timestamp ]) last timestamp] height: 20 color: Color black) elementsOn: (model allRMQComponents).
			producers := producers sort: [ :e :f | e model name < f model name ].
			
			group addAll: producers.
			RTVerticalLineLayout on: producers.	
			producers @ RTDraggable.
		].
	
	
		(localModel = 'Exchanges') ifTrue: [
			exchanges := (RTShapeBuilder new circle width: 500; height: 50;  color: Color green trans; withText: [:e | (e name substrings:'.') at: 3 ] height: 20 color: Color black) elementsOn: (model allRMQExchanges).
			exchanges @ RTDraggable.
			exchanges := exchanges sort: [ :e :f | e model name < f model name ].
			group addAll: exchanges.
			RTVerticalLineLayout on: exchanges.	
		].
	
		(localModel = 'Queues') ifTrue: [
			queues := (RTShapeBuilder new  circle width: 600; height: 50;   color: Color lightBlue; withText: [:e | ((e name substrings:'.') at: 3), '.', ((e name substrings:'.') at: 4 ) ] height: 20 color: Color black) elementsOn: (model allRMQQueues reject:[:e | e name = 'none']).
			queues := queues sort: [ :e :f | e model name < f model name ].
			queues @ RTDraggable.
			group addAll: queues.
			RTVerticalLineLayout on: queues.	
		].
	
		(localModel = 'Consumers') ifTrue: [
			|list temp|
			consumers := (RTShapeBuilder new box width: 300; height: 110; color: Color red trans; borderColor: [ :e | ((model allRMQComponents) contains:[:q | ((e name substrings:'.') at: 4) asString = q pulseName ]) ifTrue:[ Color black ] ] ;borderWidth: [ :e | ((model allRMQComponents) contains:[:q | ((e name substrings:'.') at: 4) asString = q pulseName ]) ifTrue:[ 4 ] ifFalse:[1] ]; withText: [:e | (((var := e) name substrings:'.') at: 4) asString , String cr, 'last at: ', String cr, (e messages ifEmpty:['--'] ifNotEmpty:[:r | (r asOrderedCollection) last timestamp asString]) ] height: 20 color: Color black) elementsOn: (model allRMQQueues reject:[:e | e name = 'none']) asSet.
			list := Set new.
			temp := consumers class new.
			consumers do: [ :c |
				(list contains: [:l | l = ((c model name substrings:'.') at: 4)]) 
					ifFalse: [ 
						list add: ((c model name substrings:'.') at: 4).
						temp add: c.
					]
			] .
			consumers := temp.
			consumers := consumers sort: [ :e :f | ((e model name substrings:'.') at: 4) < ((f model name substrings:'.') at: 4) ].
			consumers @ RTDraggable.
			group addAll: consumers.
			RTVerticalLineLayout on: consumers.	
		].

	].

	lineShape := (RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray;
				width: [:e | (model allRMQMessages collect: [:mes | (mes exchange = e key) and: [mes queue = e value ]]) size log] )
			+
					(RTSimpleArrowHead new
						attachPoint: RTShorterDistanceAttachPoint new;
						color: Color veryDarkGray).			
	edges2 := RTEdgeBuilder new
					view: v;
					fromElements: exchanges;
					toElements: queues;
					shape: lineShape;
					connectFrom: #yourself toAll: [:obj | (model allRMQBindings select:[:e | e source = obj]) collect:[:e | e destination ]  ].
	edges1 := RTEdgeBuilder new
					view: v;
					fromElements: producers;
					toElements: exchanges;
					shape: lineShape;
					connectFrom: #yourself toAll: [:obj | ((model allRMQComponents select:[:e | (e pulseName = obj pulseName)]) flatCollect:[:e | e exchanges])asSet].

	edges3 := RTEdgeBuilder new
					view: v;
					fromElements: queues;
					toElements: consumers;
					shape: lineShape;
					connectFrom: #yourself toAll: [:obj | (consumers select:[:e | (obj name findString: ((e model name substrings:'.') at: 4)) ~= 0]thenCollect:[:e | e model])asSet].
		
RTHorizontalLineLayout on: es.
	
v inspect
]

{ #category : #'as yet unclassified' }
RMQViz class >> histogram2For: aModel [
"
RMQViz histogramFor: MooseModel root third
"

| min max metricCol v shape elements l |
min := aModel allRMQMessages first timestamp asDateAndTime asSeconds.
max:= aModel allRMQMessages last timestamp asDateAndTime asSeconds.

metricCol := Array new: (max - min +1).

min to: max do: [:e |	
	metricCol at:(e-min+1) put: (e -> OrderedCollection new).
].
metricCol.
aModel allRMQMessages do:[:e |
	|time|
	time := e timestamp asDateAndTime asSeconds.
	(metricCol at:(time-min+1)) value add: e
].

v := RTView new.
	shape := RTBox new color: Color blue trans; height: [ :s | s value size // 100].
	elements := shape elementsOn: metricCol.
	v addAll: elements.
	elements @ (RTLabeled new below text: [ :s | (DateAndTime fromSeconds: s key) asTime asString ]; fontSize: 2).
	elements @ (RTPopup new text: [ :s | s value size asString ]).

	l := RTHorizontalLineLayout new.
	l alignBottom.
	l on: elements.
	
	v add: ((RTLabel new elementOn: 'consoleSaasUserAccess.bl-socle') translateTo: 160 @ -20).
	v inspect
	
]

{ #category : #'as yet unclassified' }
RMQViz class >> histogramFor: aModel [
"
RMQViz histogramFor: MooseModel root third
"

| min max metricCol v shape elements l |
min := aModel allRMQMessages first timestamp asDateAndTime asSeconds.
max:= aModel allRMQMessages last timestamp asDateAndTime asSeconds.

metricCol := Array new: (max - min +1).

min to: max do: [:e |	
	metricCol at:(e-min+1) put: (e -> OrderedCollection new).
].
metricCol.
aModel allRMQMessages do:[:e |
	|time|
	time := e timestamp asDateAndTime asSeconds.
	(metricCol at:(time-min+1)) value add: e
].

v := RTView new.
	shape := RTBox new color: Color blue trans; height: [ :s | s value size // 100].
	elements := shape elementsOn: metricCol.
	v addAll: elements.
	elements @ (RTLabeled new below text: [ :s | (DateAndTime fromSeconds: s key) asTime asString ]; fontSize: 2).
	elements @ (RTPopup new text: [ :s | s value size asString ]).

	l := RTHorizontalLineLayout new.
	l alignBottom.
	l on: elements.
	
	v add: ((RTLabel new elementOn: aModel allRMQMessages first timestamp asDate asString , ' : ' , aModel allRMQMessages size asString, ' messages') translateTo: 160 @ 100).
	v inspect
	
]

{ #category : #visualization }
RMQViz class >> messages: aQueue [
	| v shape msgs |
	
	v := RTView new.
	
	msgs := aQueue messages asOrderedCollection.
	
		shape := (RTShapeBuilder new box width: 500; height: 300;
		withText: [ :e| 'Timestamp:  ', e timestamp, String cr, String cr, 'Type: ', 
		e messageType pulseName, String cr, String cr, 'DeliveryMode: ', e deliveryMode pulseName,
		String cr, String cr, 'ExchangeFormat: ', e exchangeFormat exchangeFormatType ] 
		height: 20 color: Color black)
	 	elementsOn: msgs.
		
	shape @ RTDraggable.
	(RTGridLayout withGap: 50) on: shape.
	
	v addAll: shape.
	v canvas camera scale: 0.3.
	v inspect
	
]

{ #category : #visualization }
RMQViz class >> overView: aModel [
	| exchanges queues v edge lineShape es qs |
	
	v := RTView new.
	
	es := (RTShapeBuilder new box; color: Color white trans; withTextOnTheLeft: #asString height: 40)
		elementsOn: { 'Exchanges' }.
		
	qs := (RTShapeBuilder new box; color: Color white trans; withText: #asString height: 40)
		elementsOn: { 'Queues' }.
	
	v addAll: es.
	v addAll: qs.
	es @ RTDraggable.
	qs @ RTDraggable.
	
	exchanges := RMQViz exchange: aModel.
	queues := RMQViz queues: aModel.
	
	queues collect: [ :each| each when: TRMouseClick do: [ RMQViz messages: (each model) ] ].
	
	RTNest new for: es add: [:group :localModel| group addAll: exchanges].
	RTNest new for: qs add: [:group :localModel| group addAll: queues].	
	
	RTConstraint new movable: es; fix: qs; verticalPadding: 50; above; move.
	
	lineShape := (RTLine new
				attachPoint: RTBorderAttachPoint new;
				color: Color veryDarkGray;
				width: [:e | (aModel allRMQMessages collect: [:mes | (mes exchange = e key) 
				and: [mes queue = e value ]]) size log] )
				+
				(RTSimpleArrowHead new
					attachPoint: RTBorderAttachPoint new; color: Color veryDarkGray).
					
	edge := RTEdgeBuilder new
					view: v;
					fromElements: exchanges;
					toElements: queues;
					shape: lineShape;
					connectFrom: #yourself toAll: [:obj | (aModel allRMQBindings 
					select:[:e | e source = obj]) collect:[:e | e destination ]  ].
	
	v inspect
]

{ #category : #modules }
RMQViz class >> queues: model [
	| queues |
	
	queues := (RTShapeBuilder new box width: 600; height: 70; color: Color orange trans;
	withText: [:e | ((e name substrings:'.') at: 3), '.', ((e name substrings:'.') at: 4) ]
	height: 20 color: Color black) elementsOn: (model allRMQQueues reject:[:e | e name = 'none']).
	
	queues @ RTDraggable.
	(RTHorizontalLineLayout withGap: 50) on: queues.
	
	^ queues
]

{ #category : #accessing }
RMQViz class >> types2For: aModel [
"
RMQViz typesFor: MooseModel root third
"

| v elements l |


v := RTView new.
	
	elements := (RTShapeBuilder new box color: Color green trans; size: [ :s | s logEntities size log *20]; withText: #printString height: 20)"(RTBox new color: Color white; borderColor: Color lightGray) + (RTLabel new text: #printString)"
		elementsOn: aModel allMessageTypes.
		
	v addAll: elements.
	elements @ (RTLabeled new text: [ :s | s pulseState asString ]).
	elements @ (RTPopup new text: [ :s | s logEntities size ]).
	
	l := RTHorizontalLineLayout new.
	l on: elements.
	
	v add: ((RTLabel new elementOn: aModel allRMQMessages first timestamp asDate asString , ' : ' , aModel allRMQMessages size asString, ' messages') translateTo: 160 @ 100).
	v inspect
	
]

{ #category : #accessing }
RMQViz class >> typesFor: aModel [
"
RMQViz typesFor: MooseModel root third
"

| v shape elements l |


v := RTView new.
	shape := RTBox new color: Color green trans; size: [ :s | s messages size log *20].
	elements := shape elementsOn: (aModel allWithType: MessageType).
	v addAll: elements.
	elements @ (RTLabeled new text: [ :s | s pulseState asString ]).
	elements @ (RTPopup new text: [ :s | s messages size ]).
	
	l := RTHorizontalLineLayout new.
	l on: elements.
	
	v add: ((RTLabel new elementOn: (aModel allWithType: RMQMessage) first timestamp asDate asString , ' : ' , (aModel allWithType: RMQMessage) size asString, ' messages') translateTo: 160 @ 100).
	v inspect
	
]
