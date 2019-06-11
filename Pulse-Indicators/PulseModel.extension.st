Extension { #name : #PulseModel }

{ #category : #'*Pulse-Indicators' }
PulseModel >> SetOfPublisherforUser: username [
	

	| temp|
	  "temp :=  ((self allWithType: RMQPublisherComponent )select: [:el | el owner name = username] )".
     temp :=  ((self allWithType: PulsePublisherComponent ) asOrderedCollection ) at:1 .
^temp name.
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> SetOfUsersWithTheSamePermission: vhostname configure: string1 write: string2 read: string3 [ 
	"comment stating purpose of message"

	
	| temp temp2  temp3 collection c|
	  collection := OrderedCollection new.
	  temp :=  ((self allWithType: PulseVHost )select: [:el | el name= vhostname] )at:1.
     temp2 := (temp users ) asOrderedCollection .
     
    1 to: (temp2 size) do:
    [ :i | 
	            c:= 1.
	             [c > (((temp2 at:i ) permissions asOrderedCollection)size) ]
	             whileFalse:  
	              [ 
		              temp3 := (((temp2 at:i ) permissions asOrderedCollection) at:c  ).
		              [  
			              ((temp3 configureValue = string1) and: [( temp3 writeValue = string2) and: [temp3 readValue = string3]])
			                 ifTrue: [  collection add:  (temp2 at:i )] .
			           ]
		
		           ]
	
	            
	
	 ].


^ collection .
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> dateOfLastMessageExchange: exchangeName [

 |temp ex  c2 maxDate|
   c2:=1.
 temp:= (self allWithType: PulseExchange ) select: [:el | el name= exchangeName].

 (temp size =1) ifTrue: [
	
     ex:=	((self allWithType: PulseExchange ) select: [:el | el name= exchangeName] )at:1.
	  1 to: (((ex messages ) asOrderedCollection ) size ) do:
	  [ :c |
		       maxDate:=(((ex messages ) asOrderedCollection ) at:c ) timestamp .
		       c2:=c+1.
		       c2 to:  (((ex messages ) asOrderedCollection ) size) do:
		       [
			    :i |
			    (maxDate < (((ex messages ) asOrderedCollection ) at:i ) timestamp)
			    ifTrue: [ maxDate:= (((ex messages ) asOrderedCollection ) at:i ) timestamp ].
			    ].
		
		]
	   
	  
	 ]
     

 ifFalse:[
	^ false.
	].

 ^  maxDate.

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> dateOfLastMessageQueue: queueName [
	"comment stating purpose of message"

	|temp qu  c2 maxDate|
  c2:=1. maxDate :=0.
 temp:= (self allWithType: PulseQueue ) select: [:el | el name= queueName].

 (temp size =1) ifTrue: [
     qu:=	(temp )at:1.
	  
	   1 to: (((qu messages ) asOrderedCollection ) size ) do:
	 [ :c |
		
		    ( ((((((qu messages ) asOrderedCollection ) at:c ) messageType )asOrderedCollection ) at:1) name= 'received')
		
		  ifTrue:[
		       maxDate:=(((qu messages ) asOrderedCollection ) at:c ) timestamp .
		       c2:=c+1.
		      
		        c2 to: (((qu messages ) asOrderedCollection ) size) do: 
		
		       [ :i |
			    (maxDate < (((qu messages ) asOrderedCollection ) at:i) timestamp) 
			    ifTrue: [ maxDate:= (((qu messages ) asOrderedCollection ) at:i ) timestamp ].
			
			  ].
	
		].
	  
	   ].
	 ]
     

 ifFalse:[
	^ False.
	].

 ^  maxDate.


]

{ #category : #'*Pulse-Indicators' }
PulseModel >> messagesBetween: timestamp1 and: timestamp2 [


	| temp|
	

 temp:= (self allWithType: PulseMessage ) select: [:el | ((el timestamp asDateAndTime) >= timestamp1 asDateAndTime ) and: [ (el timestamp asDateAndTime) <= timestamp2 asDateAndTime] ].
" temp:= (self allWithType: RMQMessage ) select: [:el | el timestamp = timestamp1].
(timestamp1 asDateAndTime >= timestamp2 asDateAndTime ) 
 ifTrue:[
	^ timestamp1.
	self messagesBetween: '2018-11-15 13:16:34:291' and: '2018-11-15 13:16:36:291'
	]
  ifFalse:[ ^timestamp2]"

^temp.

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> numberOfResourcesPerNode [

| tab tab2 numb c c2 chaine |

  tab :=  self allWithType: PulseNode.
  numb := 0.
  c:=1.
  c2:=1.
  chaine:= ''.


   [ c > tab size] whileFalse: [  
	         "pour chaque vhost : nombre de ressource"
	      chaine:= 'Node :' ,(tab at: c) name, String cr.
	      [ c2 > (((tab at: c) vhosts) asOrderedCollection) size] 
	          
				whileFalse:[
					  chaine:=chaine,'	Vhost: ',((((tab at: c) vhosts) asOrderedCollection) at:c2) name, String cr.
					numb:= numb+ ((((((tab at: c) vhosts) asOrderedCollection) at:c2) exchanges) asOrderedCollection ) 						size + ((((((tab at: c) vhosts) asOrderedCollection) at:c2) queues) asOrderedCollection ) 						size .
				   chaine := chaine, '		Nombre des exchanges: ', (((((((tab at: c) vhosts) asOrderedCollection) at:c2) exchanges) asOrderedCollection ) size ) asString , String cr.
				chaine := chaine ,'		Nombre des queues: ', (((((((tab at: c) vhosts) asOrderedCollection) at:c2) queues) asOrderedCollection ) size ) asString , String cr.
					c2:=c2+1.
					].
	
	 c:= c+1.
	].

^chaine.

  
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> prefetchCountValueChannel: channelname [
	"comment stating purpose of message"

	| temp |
	 temp:= ((self allWithType: PulseChannel  ) select: [:el | el name = channelname ]) at:1.
	( temp ~= nil )
	ifTrue:[
		   ^temp prefetchCount .
		]
	


]

{ #category : #'*Pulse-Indicators' }
PulseModel >> presenceOfuser: username [
	""

	|  temp chaine collection c|
	c:=1.
  chaine:= ''.

  temp := ((self allWithType: PulseUser ) select: [ :el | el name= username ]).

  ( temp size = 1) ifTrue:[
	 chaine:=  chaine:='user: ' , (((self allWithType: PulseUser ) select: [ :el | el name= username ]) at:1) name .
	
	 collection := ((temp at:1) authentifications ) asOrderedCollection .
	]

 ifFalse:[ ^ 'Inexesitant user'].

^collection.

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> queuesConsumer: consumerName [
	"Test avec User , Components"

	|temp temp2 c c2 chaine|

  temp := self allWithType: PulseConsumerComponent  .
   
  c:=1.
  c2:=1.
   temp2 := temp select: [ :el | el name = consumerName  ].
  (temp2 size =1) ifTrue:[
	
  chaine:='liste of Queues of', consumerName asString, ' :',String cr.
  "Pour chaque components : liste des channels Subscribed : pour chaque channel consumed queues "
  
      [c2 > (((temp2 at:1 ) subscribedChannels ) asOrderedCollection) size]
        whileFalse:[
	         chaine := chaine, '	Channel: ', ((((temp2 at:1 ) subscribedChannels ) asOrderedCollection) at: c2) 					name, String cr.
						
	     ]

	  ]
 ifFalse:[ chaine := ' Inexistent consumer'].

^chaine.

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> queuesOfConsumer: consumername [
	"comment stating purpose of message"

	| temp |
	
   temp:= ((self allWithType: PulseConsumerComponent   ) select: [:el | el name = consumername ]) at:1.

  (temp ~= nil)
	ifTrue: [ 
		   temp subscribedChannels .
		 ]



]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfAuthentificationFailure [

 |temp1 temp2 taux|
   
  temp1 :=  self allWithType: PulseAuthentification.
  temp2 := (self allWithType: PulseAuthentification ) select: [:el | el success= false].

  taux:= ( temp2 size )* 100/ temp1 size asFloat .

 ^taux.
   
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfConnectionsConsumer [
    "Par Consumer : Séparation entre les classes en code"
		|temp1 c acc taux temp2 chaine|

		temp1:= self allWithType: PulseUser .
		temp2:= self allWithType: PulseConnection .
		chaine:= ''.
		c := 1.
		acc:=0.

		[ c> temp1 size ] whileFalse: [ 
		           chaine:= chaine , 'User: ', (temp1 at:c)name, String cr. 
		           acc:= (((temp1 at:c ) usedConnections ) asOrderedCollection ) size.
		           taux:= (acc * 100) / (temp2 size) asFloat .
		           chaine:= chaine , 'Rate of Connections:', taux asString, '%', String cr. 
		c:= c +1 .
	].
	
	
	^chaine.
	
	
	
	
	
	
	
	
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfConnectionsNode [
	|temp1 c c2   chaine acc taux temp2|
	
  temp1 := self allWithType: PulseNode .
  temp2:= self allWithType: PulseConnection .
  c:= 1.
  c2:= 1.

  chaine:=''.
  [ c >  temp1 size] whileFalse:[
	           chaine:= chaine, 'Node: ' , (temp1 at:c) name , String cr.
	           [ c2 > (((temp1 at:c) vhosts) asOrderedCollection ) size ] whileFalse:[
		             chaine:= chaine, '	vhost: ',((((temp1 at:c) vhosts) asOrderedCollection ) at:c2) name, String cr.
		       
		     
                         acc:=	(((((temp1 at:c) vhosts) asOrderedCollection ) at:c2) connections) size.
	                      taux:= taux:= (acc * 100) / (temp2 size) asFloat .
	                      chaine := chaine ,'		Taux de connections :' , taux asString ,'%' , String cr.
	                  
	        ] ].
^ chaine 
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfDeconnectionsConsumer [
	|temp1 c acc taux temp2  temp3 chaine|

		temp1:= self allWithType: PulseUser .
		temp2:= self allWithType: PulseConnection .
      temp3 := temp2 select:[:el | el closingDate notNil ].
		chaine:= ''.
		c := 1.
		acc:=0.

		[ c> temp1 size ] whileFalse: [ 
		           chaine:= chaine , 'User: ', (temp1 at:c)name, String cr. 
		           acc:= ((((temp1 at:c ) usedConnections )) select: [ :el | el closingDate notNil]) size.
		           taux:= (acc * 100) / (temp3 size+1) asFloat .
		           chaine:= chaine , 'Rate of Disonnections:', taux asString , '%', String cr. 
		c:= c +1 .
	].
	
	
	^chaine.
	
	

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfDeconnectionsNode [

	|temp1 c c2   chaine acc taux temp2 temp3|
	
  temp1 := self allWithType: PulseNode .
  temp2:= self allWithType: PulseConnection .
  temp3:= temp2 select: [ :el | el closingDate notNil].
  c:= 1.
  c2:= 1.

  chaine:=''.
  [ c >  temp1 size] whileFalse:[
	           chaine:= chaine, 'Node: ' , (temp1 at:c) name , String cr.
	           [ c2 > (((temp1 at:c) vhosts) asOrderedCollection ) size ] whileFalse:[
		             chaine:= chaine, '	vhost: ',((((temp1 at:c) vhosts) asOrderedCollection ) at:c2) name, 						String cr.
		       
		     
                         acc:=	((((((temp1 at:c) vhosts) asOrderedCollection ) at:c2) connections)select: [ :el | 									el closingDate notNil]) size.
	                      taux:= taux:= (acc * 100) / (temp3 size +1) asFloat .
	                      chaine := chaine ,'		Taux de Deconnections :' , taux asString ,'%' , String cr.
	                  
	         
        c2:=c2+1.
		 ].
	
	
	c:= c+1.
	].

^chaine.

]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfDuplicatedMessages [

| tab tab2 c taux chaine compteur|

tab := self allWithType: PulsePayload .
tab2 := self allWithType: PulseMessage .
c:=1.
chaine:=''.
compteur:= 0.
" payload lié au message si je trouve un payload lié à plus qu'un message compteur++ / le nombre de message"
	[c> tab size] whileFalse: [ 
	( (( ((tab at:c) messages ) asOrderedCollection ) size) > 1) ifTrue: [ compteur:=compteur+1. ].
	
	c:=c+1.
	 ].
  taux:= ((compteur*100)/tab2 size) asFloat .

 ^ 'Taux de messages dupliqués: ', taux asString , '%'.
 
      
]

{ #category : #'*Pulse-Indicators' }
PulseModel >> rateOfRedeliveredMessages [

| tab tab2 taux chaine|
	
  
	
	tab := self allWithType: PulseMessage .
	"tab2 := tab select:[ :el   | k:= el users select: [ :el2   | el2 passwordChangingDate ~= 19 ] ]."
	tab2 := tab select: [ :el | el redelivered  =  'true'].
	
	
	taux :=  (tab2 size +1 *100) / (tab size) asFloat .
	"^tab2 size printString."
	"strTaux := taux , '%' ."
	
  ^ 'Taux de messages redelivrés :', taux asString ,'%' . 



]
