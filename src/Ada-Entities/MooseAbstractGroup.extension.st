Extension { #name : #MooseAbstractGroup }

{ #category : #'*Ada-Entities' }
MooseAbstractGroup >> findEntityNamed: aString [ 
	 
	^self 
		findEntityNamed: aString 
		ifAbsent: [ nil ]
]

{ #category : #'*Ada-Entities' }
MooseAbstractGroup >> findEntityNamed: aString ifAbsent: aBlock [ 

	^self 
		findEntityNamed: aString 
		where: [ :obj | true ]
		ifAbsent: aBlock 
]

{ #category : #'*Ada-Entities' }
MooseAbstractGroup >> findEntityNamed: aString where: aBlock [
	 
	^self 
		findEntityNamed: aString 
		where: aBlock		
		ifAbsent: [ nil ]
]

{ #category : #'*Ada-Entities' }
MooseAbstractGroup >> findEntityNamed: aString where: aBlock ifAbsent: failBlock [ 

	| candidates  |
	candidates := self entities select: [ :each | each name = aString ].
	candidates size = 0 ifTrue: [ ^failBlock value ].
	candidates size = 1 ifTrue: [ ^candidates anyOne ].
	"When the name is not discriminant"
	candidates := candidates select: aBlock.
	candidates size = 0 ifTrue: [ ^failBlock value ].
	candidates size = 1 ifTrue: [ ^candidates anyOne ].
		Transcript 
		cr; 
		show: 'THALESModel >> findEntityNamed:where:ifAbsent:'; 
		cr; 
		show: 'Has found nultiple entities with name: ' , aString; 
		flush.
	candidates do: [ :each |
		Transcript
			cr; tab;
			print: each;
			flush ].
	^candidates anyOne.

	

	
]
