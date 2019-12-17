"
An ADASubprogram represent an Ada function or procedure.

declaredType
	- return type of a function, nil for procedures

parameters
	- declared parameters of the  subprogram

signature
	- name of the subprograms and list of its parameters if any

"
Class {
	#name : #ADASubprogram,
	#superclass : #ADABehaviouralEntityWithParameters,
	#instVars : [
		'incomingInvocations'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADASubprogram class >> annotation [
	<MSEClass: #Subprogram super: #ADABehaviouralEntityWithParameters>
	<package: #ADA>
]

{ #category : #queries }
ADASubprogram class >> commonBooleanFilters [
	^ super commonBooleanFilters
		,
			{(#isFunction -> 'Is function').
			(#isProcedure -> 'Is Procedure')}
]

{ #category : #accessing }
ADASubprogram >> addIncomingInvocation: anInvocation [
	incomingInvocations add: anInvocation
]

{ #category : #resolving }
ADASubprogram >> classOfMyScope [
	^ FASTAdaSubprogramScope 
]

{ #category : #accessing }
ADASubprogram >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #subprograms>
	<MSEComment: 'The container defining this subprogram.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADASubprogram >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #functions
		from: self container
		to: aContainer
]

{ #category : #accessing }
ADASubprogram >> dataAccessorsForQuickTagging [
	^ self functions
]

{ #category : #display }
ADASubprogram >> dataEntitiesForQuickTagging [
	^ (self accesses collectAsSet: #variable) select: [ :var | var belongsTo = self belongsTo ]
]

{ #category : #display }
ADASubprogram >> dataReceivedFrom: anotherEntity [
	|datas|
	datas := super dataReceivedFrom: anotherEntity.
	self incomingInvocations
			select: [ :i |	(i sender = anotherEntity) or: [i sender isBelongingTo: anotherEntity] ]
			thenDo: [:i | i dataSent do: [:d | datas add: d] ].

	self outgoingInvocations
			select: [ :i | (i candidates first = anotherEntity) or: [i candidates first isBelongingTo: anotherEntity] ]
			thenDo: [:i | i dataReturned do: [:d | datas add: d] ].

	^ datas
]

{ #category : #accessing }
ADASubprogram >> incomingInvocations [
	<MSEProperty: #incomingInvocations type: #FAMIXInvocation opposite: #adaCandidates>
	<multivalued>
	<derived>
	<MSEComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	^ incomingInvocations
]

{ #category : #accessing }
ADASubprogram >> incomingInvocations: anInvocation [
	incomingInvocations value: anInvocation
]

{ #category : #accessing }
ADASubprogram >> incomingThalesMessageReferences [
	^ self mooseModel allThalesMessageRecvdReferences select: [ :each | each referencer = self ]
]

{ #category : #initialization }
ADASubprogram >> initialize [
	super initialize.
	incomingInvocations := FMMultiMultivalueLink on: self opposite: #candidates.

]

{ #category : #testing }
ADASubprogram >> isAdaSubprogram [
	^ true
]

{ #category : #testing }
ADASubprogram >> isAttribute [
	
	^false
]

{ #category : #testing }
ADASubprogram >> isFunction [
	^ declaredType notNil
]

{ #category : #testing }
ADASubprogram >> isMethod [
	
	^false
]

{ #category : #testing }
ADASubprogram >> isProcedure [
	^ declaredType isNil
]

{ #category : #display }
ADASubprogram >> mooseNameOn: aStream [
	(self container isNotNil and: [ self container name isNotNil ])
		ifTrue: [ 
			self container mooseNameOn: aStream.
			aStream << self mooseNameSeparator ].
	self signature ifNil: [ self name ifNotNil: [ :n | aStream << n ] ] ifNotNil: [ :sign | aStream << sign ]
]

{ #category : #accessing }
ADASubprogram >> numberOfParameters [
	<MSEProperty: #numberOfParameters type: #Number>
	<MSEComment: 'The number of parameters in a method'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfParameters
		computedAs: [self parameters size]
]

{ #category : #accessing }
ADASubprogram >> outgoingThalesMessageReferences [
	^ self mooseModel allThalesMessageSentReferences select: [ :each | each referencer = self ]
]

{ #category : #'moosequery-queries-outgoing' }
ADASubprogram >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseChefTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #testing }
ADASubprogram >> shouldShowInQuickTagging [
	^ true
]

{ #category : #accessing }
ADASubprogram >> statements [
	self flag: #check.	"THIS IS A HACK. This is weird because some subprograms can be an opposite of a FASTStatement. I don't know if it is right. But in any case, the FASTStatement try to maintain opposites. Thus I add dumb methods to avoid crashes and we should review this later with someone knowing ada..."
	^ FMMultivalueLink on: nil opposite: #nothing:
]

{ #category : #accessing }
ADASubprogram >> statements: aColl [
	self flag: #check	"THIS IS A HACK. This is weird because some subprograms can be an opposite of a FASTStatement. I don't know if it is right. But in any case, the FASTStatement try to maintain opposites. Thus I add dumb methods to avoid crashes and we should review this later with someone knowing ada..."
]
