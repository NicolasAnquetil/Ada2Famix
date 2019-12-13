Extension { #name : #FAMIXInvocation }

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> adaCandidates [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaCandidates to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #candidates property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaCandidates type: #ADASubprogram opposite: #incomingInvocations>
	<multivalued>
	<derived>
	<MSEComment: 'List of candidate behavioural entities for receiving the invocation'>
	<target>
	^ self candidates
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> adaCandidates: aCollection [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaCandidates to be good with the pragmas. 
	"

	^ self candidates: aCollection
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> adaSender [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSender to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #sender property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaSender type: #ADABehaviouralEntity opposite: #outgoingInvocations>
	<MSEComment: 'Behavioural entity making the call. from-side of the association'>
	<derived>
	<source>
	^ self sender
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> adaSender: anADABehaviouralEntity [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSender to be good with the pragmas. 
	"

	self sender: anADABehaviouralEntity
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> addArgument: anArgument [
	^ self arguments add: anArgument
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> addArgument: argExpr forParameter: aParameter [
	| arg |
	arg := argExpr getArgVariable.
	
	^ self addArgument:
				((arg isCollection ifTrue: [ADAAggregateArgument new] ifFalse: [ADAArgument new])
						parameter: aParameter ;
						argument: arg ;
						mooseModel: self mooseModel;
						yourself)

]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> addArgument: arg forParameterNamed: aString within: allParameters [
	allParameters detect: [ :e | e name asUppercase = aString asUppercase]
						ifOne: [:param | self addArgument: arg forParameter: param]
						ifNone: nil

]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> arguments [
	<MSEProperty: #arguments type: #FAMIXAccess opposite: #invocation>
	<multivalued>
	<derived>
	<MSEComment: 'List of actual arguments used in the invocation'>
	^ self privateState attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #invocation: ]
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> arguments: anObject [
	self arguments value: anObject
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> dataReturned [
	^ (self arguments
			collect: [ :adaArg |
				adaArg parameter outMode ifTrue: [ adaArg argument ] ifFalse: [ #() ]
			])
				flattened  "this is not equivalent to a flatCollect"
					reject: #isNil
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> dataSent [
	^ (self arguments
			collect: [ :adaArg |
				adaArg parameter inMode ifTrue: [ adaArg argument ] ifFalse: [ #() ]
			])
				flattened  "this is not equivalent to a flatCollect"
					reject: #isNil
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> messageSent [
	^ (self mooseModel allThalesMessages)
		detect: [ :msg | (self arguments detect: [ :each | each parameter nameContains: 'Msg_Name' ]) argument nameContains: msg name ] ifNone: [ nil ]
]

{ #category : #'*Ada-Entities' }
FAMIXInvocation >> setArgsFrom: aCollection [
	"creates ADAArguments associations between the formal parameters of the declaration and the actual arguments of this invocation"
	| parameters i |
	"first check some conditions to try to ensure we are in good shape to do the work"
	self candidates ifEmpty: [ ^ self arguments: #() ].
	self candidates first isStub ifTrue: [ ^ self arguments: #() ].

	parameters := self candidates first parameters.
	(aCollection size = parameters size) ifFalse: [ ^ self arguments: #() ].
	"(aCollection anySatisfy: [ :a | a isNil ]) ifTrue: [ ^ self arguments: #() ]."

	i := 0.
	aCollection do: [ :arg |
		i := i+1.
		arg ifNotNil: [
			(arg class = Association)
			ifFalse: [ self addArgument: arg  forParameter: (parameters at: i) ]
			ifTrue:  [ self addArgument: arg value forParameterNamed: (arg key first) within: parameters ]
		]
	]
]
