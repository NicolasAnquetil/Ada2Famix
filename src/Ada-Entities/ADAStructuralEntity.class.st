"
An ADAStructuralEntity is the abstract superclass for variables (variables, parameters, record elements) .

StrucutralEntities can resolve symbol to deal with cases like:
<aVariable> . <anAttribute>
"
Class {
	#name : #ADAStructuralEntity,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'isConstant',
		'parentEnum'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAStructuralEntity class >> annotation [
	<MSEClass: #StructuralEntity super: #FAMIXStructuralEntity>
	<package: #ADA>
]

{ #category : #queries }
ADAStructuralEntity class >> commonBooleanFilters [
	^ super commonBooleanFilters, { #isConstant -> 'Is constant' }
]

{ #category : #'*SYNAda-Entities-Lewis' }
ADAStructuralEntity >> accept: aVisitor andAssociateWithPackageInstance: packageInstance [
	"Double dispatch
	The association is an Access"
	^ aVisitor associatePackageInstance: packageInstance withStructural: self
]

{ #category : #'*SYNAda-Entities-Lewis' }
ADAStructuralEntity >> accept: aVisitor andCreateAssociationWith: aQualifiedIdentifier [
	"Double dispatch
	The created association is an Access"
	 ^ aVisitor createStructuralAccessResolvedAs: self
]

{ #category : #accessing }
ADAStructuralEntity >> adaDeclaredType [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaDeclaredType to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #declaredType property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaDeclaredType type: #ADAType opposite: #structuresWithDeclaredType>
	<MSEComment: 'Type of the structure, if any'>
	^ self declaredType
]

{ #category : #accessing }
ADAStructuralEntity >> adaDeclaredType: aType [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaDeclaredType to be good with the pragmas. 
	"

	self declaredType: aType
]

{ #category : #accessing }
ADAStructuralEntity >> belongsTo [
	^ self container
]

{ #category : #accessing }
ADAStructuralEntity >> container [
	"container can be a Type (receiver is likely an element of a record defintion), a subprogram (receiver is a formal parameter) or any Behaviouralentity (receiver is a local variable)"

	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #localVariables>
	<MSEComment: 'The container defining this variable'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADAStructuralEntity >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #localVariables
		from: self container
		to: aContainer
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> correspondingThalesMessage [
	^ self mooseModel variablesAndMessagesMap at: self ifAbsent: [ nil ]
]

{ #category : #display }
ADAStructuralEntity >> dataReceivedFrom: aContainerEntity [
	"computes the set of variable within the scope of aContainerEntity that are used (i.e. read) in receiver"
	^ self explicitRequirement
]

{ #category : #display }
ADAStructuralEntity >> dataSentTo: anOtherEntity [
	^ self explicitRequirement
]

{ #category : #'as yet unclassified' }
ADAStructuralEntity >> getArgVariable [
	^ self
]

{ #category : #testing }
ADAStructuralEntity >> isAdaStructural [
	^ true
]

{ #category : #accessing }
ADAStructuralEntity >> isConstant [
	<MSEProperty: #isConstant type: #Boolean>
	<MSEComment: 'Whether this is a constant or a true variable'>

	^ isConstant ifNil: [ false ]
]

{ #category : #accessing }
ADAStructuralEntity >> isConstant: anObject [
	
	isConstant := anObject
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> isThalesCommunicationChannel [
	<MSEProperty: #isThalesCommunicationChannel type: #Boolean>
	<MSEComment: 'Whether this is a constant marking a Thales communication channel'>

	^ self privateState attributeAt: #isThalesCommunicationChannel ifAbsent: [ false ]
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> isThalesCommunicationChannel: aBoolean [

	^ self privateState attributeAt: #isThalesCommunicationChannel put: aBoolean
]

{ #category : #resolving }
ADAStructuralEntity >> lookup: aSymbol [
	^ declaredType
			ifNil: [ OrderedCollection new ]
			ifNotNil: [ declaredType lookup: aSymbol ]
]

{ #category : #resolving }
ADAStructuralEntity >> lookup: aSymbol where: aBlock [

	#advancedLookup.
	^ declaredType
			ifNotNil: [ declaredType lookup: aSymbol where: aBlock ]
]

{ #category : #'as yet unclassified' }
ADAStructuralEntity >> mooseNameOn: aStream [
	self belongsTo
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream << '::' ].
	super mooseNameOn: aStream
]

{ #category : #accessing }
ADAStructuralEntity >> parentEnum [	
	<MSEProperty: #parentEnum type: #ADATypeEnum opposite: #enumValues>
	<MSEComment: 'The enum defining this enumerated value'>
	^ parentEnum
]

{ #category : #accessing }
ADAStructuralEntity >> parentEnum: aType [
	parentEnum := FMMultivalueLink on: self
					update: #enumValues
					from: self parentEnum
					to: aType
]

{ #category : #accessing }
ADAStructuralEntity >> parentNode: whatever [
	self flag: 'this entity can have a FASTAdaDeclareEntity as parentNode'
]

{ #category : #resolving }
ADAStructuralEntity >> resolve: aSymbol forNode: caller [
 	self flag: 'refactor opportunity, could raise an exception instead of returning nil'.

	^ self declaredType
		ifNil: [ nil ]
		ifNotNil: [ :typ | typ resolve: aSymbol forNode: caller]
]

{ #category : #accessing }
ADAStructuralEntity >> sourceLanguage [
	^  ADASourceLanguage singleton
]

{ #category : #accessing }
ADAStructuralEntity >> thalesMessageScope [
	^nil
]
