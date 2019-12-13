"
A LwsAdaVisitorRef is a visitor on a Lewis AST to create FAST Ada entities and links (associations) between FAMIX Ada entities already created.
It relies on the fact that LwsAdaVisitorDef was already applied (to create the FAMIXAdaEntities).
[ CAVEAT: DECLARE statements are  not processed by DefVisitor, so this visitor creates and use a special DefVisitor to process them]
It uses FASTAda to resolve symbols

- lastAccess and lastInvok
  are used to create next/previous links between FAMIXACcesses and Invocations

- scopeStack
  is needed to know in what scope we are and things (i.e. variables) need to be define and searched for.
scopeStack is different from contextStack (which contains a stack of FAMIX or FAST entities) because some FAST entites do not have scope (e.g. StatementBlocks) and some scopes may not have corresponding entities (e.g. USE clause is recorded as a scope with no associated entity)
"
Class {
	#name : #LwsAdaVisitorRef,
	#superclass : #AdaImporter,
	#instVars : [
		'lastAccess',
		'scopeStack'
	],
	#category : #LewisMoose
}

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> associatePackageInstance: packageInstance withArgument: arg [

	arg mainIdentifier ifNil: [ ^nil ].
	^ (self findQualifiedIdentifier: arg asStructuralIdentifier asTypeIdentifier)
		ifNotNil:
			[ :entity | 
			(entity accept: self andAssociateWithPackageInstance: packageInstance) 
				ifNotNil: 
					[ :association |  
					self model add: association ] ].
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> associatePackageInstance: packageInstance withStructural: entity [
	^ FAMIXAccess new
		accessor: packageInstance;
		variable: entity;
		yourself
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> associatePackageInstance: packageInstance withType: entity [
	^ FAMIXReference adaSource: packageInstance target: entity
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createAdaNamedBehavioural: aSubprogramEntity [ 

	| fct |
	fct := FASTAdaNamedBehaviouralEntity new.
	fct fastScope: (FASTScope newWithOwner: fct andParents: (OrderedCollection with: aSubprogramEntity fastScope)).
	fct mooseModel: targetModel.
	fct name: aSubprogramEntity name.

	"points to owner (if it is a FAMIX entity) and reciprocally"
	aSubprogramEntity isFastEntity ifFalse: [
		fct parentNode: aSubprogramEntity.
		aSubprogramEntity fastBehaviouralEntity: fct
	].

	^ fct
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createArguments: args intoInvocation: anInvocation [
	"Some arguments may not be resolved (e.g. if it's an expression or a literal)
	in this case, we put nil in the list"
	anInvocation setArgsFrom:
		 (args collect: [:a |
				((a isFAMIXEntity) or: [(a isKindOf: Association)])
					ifTrue: [a]
					ifFalse: nil
			]).

	^ anInvocation
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createAssociationTo: anEntity [

	^ (anEntity isAdaSubprogram)
			ifTrue: [ self createSubprogramInvocationTo: anEntity "not used anymore?" ]
			ifFalse: [
				((anEntity isAdaType) or: [anEntity isAdaTask])
				ifTrue: [ self createReferenceResolvedAs: anEntity ]
				ifFalse: [
					(anEntity isAdaStructural)
					ifTrue: [ self createStructuralAccessResolvedAs: anEntity ]
					ifFalse: [ nil	] "for packages or unresolved entites (i.e. nil)"
				]
			]
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createBlockBody [
	| block |
	block := FASTAdaStatementBlock new.
	block fastScope: self topContext fastScope. "in Ada statementBlock have no scope (they don't declare variables), so we just point to the parent node's scope"

	block parentNode: self topContext.  "points to parent (a FASTEntity) ..."
	self topContext statementBlock: block. "...  and reciprocally"

	block mooseModel: targetModel.

	^ block
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createCaseAlternative: aCaseAlternativeChoices [
	| stmt |
	stmt := FASTAdaCaseAlternative new
					choices: aCaseAlternativeChoices ;
					yourself.

	"points to parent and reciprocal"
	stmt parentNode: self topContext.
	self topContext alternatives add: stmt.

	targetModel add: stmt.

	^ stmt
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createCaseStatement: aCaseSelector [
	| stmt |
	stmt := FASTAdaCaseStatement new
					expression: aCaseSelector ;
					yourself.

	"points to parent and reciprocal"
	stmt parentNode: self topContext.
	self topContext statements add: stmt.

	targetModel add: stmt.

	^ stmt
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createReferenceResolvedAs: anEntity [
	^ anEntity ifNotNil: [ self model add: (FAMIXReference adaSource: self topContext parentFamixEntity target: anEntity) ]
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createStructuralAccessResolvedAs: anEntity [
	| acc |
	^ anEntity ifNotNil: 
		[ acc := FAMIXAccess new
					accessor: self topContext parentFamixEntity ;
					variable: anEntity ;
					previous: lastAccess ;
					yourself.
		lastAccess := acc.
		self model add: acc ].

]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createSubprogramInvocationFor: lwsQualifiedIdentifier resolvedAs: anEntity [
	| invok |
	invok := (FAMIXInvocation new
					sender: self topContext parentFamixBehaviouralEntity ;
					candidates: { anEntity } ;
					signature: anEntity signature ;
					yourself).
	self model add: invok.

	lwsQualifiedIdentifier qualifiers
		detect: [:q | q isKindOf: LwsArgumentsSelector ]
		ifOne: [ :argSel | self createArguments: (argSel accept: self) intoInvocation: invok ].
	
	^ invok

]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> createSubprogramInvocationTo: anEntity [
	| invok |
Halt now.  "this method might not be need anymore, after introduction of createSubprogramInvocationTo:resolvedAs:"
	invok := (FAMIXInvocation new
					sender: self topContext parentFamixEntity ;
					candidates: { anEntity } ;
					signature: anEntity signature ;
					yourself).
	self model add: invok.

]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> declareTasks: aCollection fromTaskType: type [
	"aCollection is a list of wrongly declared StructuralEntities (variables)
	 they are actually task 'instanciating' a task type
	 so create the tasks and remove the StructuralEntities"
	| containers return |

	containers := Set new.
	return := aCollection collect: [ :v || t |
					t := self ensureTask: v name.
					t fastScope: type fastScope.
					t isStub: false.
					containers add: v container.
					v container: nil.
					v sourceAnchor ifNotNil: [ t sourceAnchor: v sourceAnchor ].
					self model remove: v.
					t
				].

	^ return
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> indexedFileAnchorForPath: filename posFromToken: token [
	^ FAMIXIndexedFileAnchor new
			fileName: filename ;
			startPos: token startPosition ;
			endPos: token endPosition ;
			mooseModel: self model ;
			yourself
]

{ #category : #'initialize-release' }
LwsAdaVisitorRef >> initialize [
	super initialize.
	scopeStack := Stack new
]

{ #category : #accessing }
LwsAdaVisitorRef >> model: aModel [
	super model: aModel.
	self pushScope: self topContext fastScope
]

{ #category : #accessing }
LwsAdaVisitorRef >> popScope [
	^ scopeStack pop
]

{ #category : #accessing }
LwsAdaVisitorRef >> pushScope: aScope [
	^ scopeStack push: aScope
]

{ #category : #accessing }
LwsAdaVisitorRef >> resetLastAccess [
	lastAccess := nil
]

{ #category : #'private-entity-creation' }
LwsAdaVisitorRef >> setDeclaredType: typ forAll: litsOfEntities [
	"sets typ as the declaredType of a list of entities (structuralEntities or functions)"

	litsOfEntities do: [:v | v declaredType: typ ]
]

{ #category : #accessing }
LwsAdaVisitorRef >> topScope [
	^ scopeStack top
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitAccessToObject: anAccessToObject [
	"ENTITY LwsAccessType ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsElementaryType);
		accessMode : OPTIONAL LwsAccessMode;
	END_ENTITY;
	ENTITY LwsAccessToObject SUBTYPE OF (LwsAccessType);
		subtypeIndication : LwsSubtypeIndication;
	END_ENTITY;"

	| accessed |
	accessed := self ensureQualifiedIdentifier: (anAccessToObject subtypeIndication accept: self)
												asTypeIdentifier asTaskIdentifier.

	accessed ifNotNil: [
		self topContext adaAccessed: accessed.
		self topContext fastScope: accessed fastScope
	].

	^ accessed

]

{ #category : #'visitor-addingReturn' }
LwsAdaVisitorRef >> visitAggregate: anAggregate [
	^ anAggregate elements collect: [ :e | e accept: self ]
]

{ #category : #'visitor-addingReturn' }
LwsAdaVisitorRef >> visitArgumentsSelector: anArgumentsSelector [
	"visits and resolves all the arguments of a subprogram call
	 here we have no a priori idea what the argument is"

	^ 	anArgumentsSelector arguments elements collect: [ :a |
			a accept: self
		]
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitArrayType: anArrayType [
	"ENTITY LwsArrayType SUBTYPE OF (LwsCompositeType);
		indexes : List OF LwsArrayTypeIndexSpec;
		componentType : LwsComponentSubtype;
	END_ENTITY;"
	| typ |

	anArrayType indexes do: [ :e | e accept: self ].
	"componentType should be a QualifiedIdentifier"
	typ := self findQualifiedIdentifier: (anArrayType componentType accept: self) asTypeIdentifier.
	self createReferenceResolvedAs: typ.

	^ targetModel singletonAnonymousArray.
	
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitAssignment: anAssignment [
	| var access |
	self resetLastAccess.
	var := self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: (anAssignment variableName))
										asStructuralIdentifier.

	var ifNotNil: [
		access := self createStructuralAccessResolvedAs: var.
		access isWrite: true.
		access sourceAnchor: (self indexedFileAnchorForPath: self programPath
										   posFromToken: anAssignment variableName)
	].

	anAssignment expression accept: self.

	^ var
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitBasedLiteral: aBasedLiteral [
	^ 	nil
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitBlockBody: aBlockBody [
	"A block BEGIN/END containing statements, but not the local declarations"
	"ENTITY LwsBlockBody SUBTYPE OF (LwsBody);
		statements : List OF LwsStatement;
		handlers : List OF LwsExceptionHandler;
	END_ENTITY;"
	self createBlockBody.

	super visitBlockBody: aBlockBody.

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitBlockStatement: aBlockStatement [
	"corresponds to a DECLARE statement
	ENTITY LwsBlockStatement
			SUBTYPE OF (LwsCompoundStatement);
		stamp : OPTIONAL String;
		locals : list OF LwsEntity;
		body : LwsBlockBody;
	END_ENTITY;"
	| stmt declareDefVisitor |

	stmt := FASTAdaDeclareStatement new.
	stmt mooseModel: targetModel.
	stmt parentNode: self topContext.
	self topContext statements add: stmt.

	self pushContext: stmt.
	
	"now we call a special DefVisitor to create all locals in the current scope"
	declareDefVisitor := LwsAdaVisitorDefForDeclare new fromRefVisitor: self.
	aBlockStatement locals ifNotNil: [ :a | a do: [ :e | e accept: declareDefVisitor ] ].
	"end of special DefVisitor"

	"this being done, we can resume normal visit with this parser that will look for already
	 defined entities in the current scope"
	self pushScope: stmt fastScope.
	
	aBlockStatement locals ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aBlockStatement body accept: self.

	self popScope.
	^ self popContext
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitBodyWithLocals: aBodyWithLocals [
	"ENTITY LwsBodyWithLocals ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsBody);
		locals : List OF LwsDeclarationOrBody ::= OrderedCollection new;
	END_ENTITY;"
	| behav |
	aBodyWithLocals locals ifNotNil: [ :a | a do: [ :e | e accept: self ] ].

	aBodyWithLocals blockBody ifNotNil: [ :e |
		behav := self createAdaNamedBehavioural: self topContext.
		self pushContext: behav.
		self pushScope: behav fastScope.

		e accept: self.

		self popScope.
		self popContext
	]
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitCaseAlternative: aCaseAlternative [
	"ENTITY LwsCaseAlternative SUBTYPE OF (LwsEntity);
		choices : list OF LwsChoice;
		statements : List OF LwsStatement;
	END_ENTITY;"
	self pushContext:
		(self createCaseAlternative:
			((
			aCaseAlternative choices
				collect: [ :c | c accept: self ])
				reject: #isNil)).

	aCaseAlternative statements do: [ :e | e accept: self ].
	
	^ self popContext
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitCaseStatement: aCaseStatement [
	| stmt caseExpr |
	"self visitStatement: aCaseStatement."
	caseExpr := aCaseStatement selector accept: self.
	(caseExpr = self) ifTrue: [caseExpr := nil].  "some inherited visit method don't return anything explicitly"
	stmt := self createCaseStatement: caseExpr.
	self pushContext: stmt.	"CaseStatement does not have scope, so don't push"
	aCaseStatement alternatives do: [ :e | e accept: self ].
	^ self popContext
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitCharacterLiteral: aCharacterLiteral [
	^ 	nil
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitComponentAssociation: aComponentAssociation [
	"ENTITY LwsComponentAssociation SUBTYPE OF (LwsEntity);
		expression : LwsExpression;
		choices : list OF LwsChoice;
	END_ENTITY;"
	"used in subprogram calls (parameter => argument) or in structured variable initialization (attribute => value)
	 Note: not used in case-alternative

	 Choices are names of variables, not variables"
	| expr |
	expr := aComponentAssociation expression accept: self.
	(expr = self) ifTrue: [ expr := nil ].  "some superclass visit methods are not returning anything explicitly"

	^ (aComponentAssociation choices collect: [:c | (LwsVisitorQualifiedIdentifierAsList new visit: c) mainIdentifier])
		->
		expr.

]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorRef >> visitComponentAttribute: aComponentAttribute [
	"ENTITY LwsComponentAttribute SUBTYPE OF (LwsEntity);
		names : List OF String;
		domain : LwsComponentSubtype;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"
	| atts typ |
	atts := self ensureStructuralEntities: aComponentAttribute.
	atts  do: [ :a | a isStub: false ].

	typ := self findQualifiedIdentifier: (aComponentAttribute domain accept: self) asTypeIdentifier.

	self setDeclaredType: typ forAll: atts.

	aComponentAttribute initialization ifNotNil: [ :a | a accept: self ].
	
	^ atts
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorRef >> visitComponentSubtype: aComponentSubtype [
	"ENTITY LwsComponentSubtype SUBTYPE OF (LwsEntity);
		isAliased : Boolean := false;
		definition : LwsSubtypeIndication;
	END_ENTITY;"

	^ aComponentSubtype definition accept: self
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitConstantLiteral: aConstantLiteral [
	^ nil
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitDecimalLiteral: aDecimalLiteral [
	^ nil
]

{ #category : #'visitor-addingReturn' }
LwsAdaVisitorRef >> visitDerivedType: aDerivedType [
	aDerivedType withRecord ifNotNil: [ :a | a accept: self ].
	^ aDerivedType subtypeIndication accept: self.

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitDiscreteRange: aDiscreteRange [
	"ENTITY LwsDiscreteRange SUBTYPE OF (LwsRange);
		identifier : OPTIONAL LwsQualifiedIdentifier;
		rangeConstraint : OPTIONAL LwsRangeConstraint;
	END_ENTITY;"
	aDiscreteRange identifier ifNotNil: [ :a |
		self createReferenceResolvedAs:
			(self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: a) asTypeIdentifier).
	].
	^ aDiscreteRange rangeConstraint ifNotNil: [ :a | a accept: self ]
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitEntryDeclaration: anEntryDeclaration [
	"very similar to SubprogramDeclaration but the name is a string"
	"ENTITY LwsEntryDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		range : OPTIONAL LwsRange;
		parameters : List OF LwsFormalParameter;
	END_ENTITY;"

	| ent |
	ent := self findInLocalsSubProg: anEntryDeclaration name
					withSignature: (LwsVisitorSubprogramSignature new
											visit: anEntryDeclaration).

	self pushContext: ent.

	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	super visitSubprogramDeclaration: anEntryDeclaration.

	self popScope.
	^ self popContext

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitExplicitRange: anExplicitRange [

	anExplicitRange start accept: self.
	anExplicitRange stop  accept: self.

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitExpressionChoice: anExpressionChoice [
	"ENTITY LwsExpressionChoice SUBTYPE OF (LwsChoice);
		expression : LwsExpression;
	END_ENTITY"

	^ anExpressionChoice expression accept: self
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorRef >> visitFormalParameter: aFormalParameter [
	| params typ |
	"ENTITY LwsFormalParameter SUBTYPE OF (LwsEntity);
		names : list OF String;
		mode : OPTIONAL LwsParameterMode;
		domainName : LwsQualifiedIdentifier;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"

	params := self ensureStructuralEntities: aFormalParameter famixType: ADAParameter.
	params  do: [ :p | p isStub: false ].

	typ := self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: aFormalParameter domainName) asTypeIdentifier.
	self setDeclaredType: typ forAll: params.

self flag: 'review this last part'.
	aFormalParameter initialization ifNotNil: [ :a | a accept: self ].
	
	^ params
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitFullTypeDeclaration: aFullTypeDeclaration [

	| typeDefinition |

	"a FullTypeDeclaration name is a string, so we create a QualifiedIDentifier by hand"
	self pushContext: (self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: aFullTypeDeclaration name)) first.
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	typeDefinition := aFullTypeDeclaration typeDefinition accept: self.
	(typeDefinition class = FASTAdaQualifiedIdentifier)
		ifTrue: [
			self createReferenceResolvedAs: (self findQualifiedIdentifier: typeDefinition asTypeIdentifier)
		]
		ifFalse: [
			(typeDefinition == self)
				"ifTrue: for cases not yet treated by the this visitor where visitXYZ
				does not have an explicit return statement and will return the visitor"
				ifFalse: [
					"typeDefinition can be a dynamic anonymous array type, or an access type"
					
					self createReferenceResolvedAs: typeDefinition
				]
		].

	self popScope.
	^ self popContext

]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitFunctionDeclaration: aFunctionDeclaration [
	| func |
	"ENTITY LwsFunctionDeclaration
			SUBTYPE OF (LwsSubprogramDeclaration);
		name : LwsFunctionName;
		returnType : OPTIONAL LwsQualifiedIdentifier;
	END_ENTITY;"

	func := self visitSubprogramDeclaration: aFunctionDeclaration.

	"if the function is a generic, it might define its own return type,
	 so we need to analyze it in its own scope (just like we do for parameters)"
	self pushContext: func.
	self pushScope: self topContext fastScope.

	aFunctionDeclaration returnType ifNotNil: [ :t |
		func declaredType: (self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: t)
															asTypeIdentifier)
	].

	self popScope.
	^ self popContext

]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorRef >> visitGenericFormalFunction: aGenericFormalFunction [
	"ENTITY LwsGenericFormalFunction
			SUBTYPE OF (LwsGenericFormalSubprogram);
		SELF\LwsGenericFormalSubprogram.base : LwsFunctionDeclaration;
	END_ENTITY;"

	aGenericFormalFunction base accept: self
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorRef >> visitGenericPackageInstanciation: aGenericPackageInstanciation [
	"ENTITY LwsGenericInstanciation
			SUBTYPE OF (LwsBasicDeclaration);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	ENTITY LwsGenericPackageInstanciation
			SUBTYPE OF (LwsGenericInstanciation);
		packageDeclaration : LwsCompoundName;
	END_ENTITY;"

	| thePackageInstance genericPackageName |
	thePackageInstance := self ensurePackageInstanciation: aGenericPackageInstanciation packageDeclaration asString.
	genericPackageName := LwsVisitorQualifiedIdentifierAsList new visit: aGenericPackageInstanciation name.
	thePackageInstance generic: (self findQualifiedIdentifier: genericPackageName asContainerIdentifier).
	genericPackageName arguments do: [ :each | 
		self associatePackageInstance: thePackageInstance withArgument: each ].

	^ thePackageInstance
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorRef >> visitGenericSubprogramInstanciation: aGenericSubprogramInstanciation [
	"ENTITY LwsGenericInstanciation
			SUBTYPE OF (LwsBasicDeclaration);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	ENTITY LwsGenericSubprogramInstanciation
			SUBTYPE OF (LwsGenericInstanciation);
		subprogramDeclaration : LwsSubprogramDeclaration;
	END_ENTITY;"
	| sub resolved |

	resolved := self findQualifiedIdentifier:
							(LwsVisitorQualifiedIdentifierAsList new
								visit: aGenericSubprogramInstanciation name) asGenericSubpgmIdentifier.

	resolved ifNotNil: [ | name |
		"(resolved isStub) ifTrue: [ resolved isGeneric: true ]."

		name := LwsVisitorSubprogramSignature new
			visit: aGenericSubprogramInstanciation subprogramDeclaration name.

		sub := self ensureSubprogramInstanciation: name	withSignature: name , '(' , (resolved signature copyAfter: $( ).
		sub parameters: resolved parameters copy.
		sub declaredType: resolved declaredType.
		sub generic: resolved.
		sub isStub: false.
		sub addSourceAnchorForPath: self programPath posFromToken: aGenericSubprogramInstanciation.
	].

	^ sub
]

{ #category : #'visitor-procedurals' }
LwsAdaVisitorRef >> visitIfClause: ifClause [
	ifClause condition ifNotNil: [ :a | a accept: self ].
	ifClause statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitIndex: anIndex [
	"an index range specification in an array definition"
	^ self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: anIndex typeMark) asTypeIdentifier 
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitLiteral: aLiteral [
	^ nil
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitLogicalLiteral: aLogicalLiteral [
	^ nil
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitNullLiteral: aNullLiteral [
	^ nil
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorRef >> visitNumberDeclaration: aNumberDeclaration [
	"ENTITY LwsNumberDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		initialization : LwsExpression;
	END_ENTITY;"

	^ aNumberDeclaration initialization accept: self

]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitNumericLiteral: aNumericLiteral [
	^ nil
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorRef >> visitObjectDeclaration: anObjectDeclaration [
	"ENTITY LwsObjectDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		isAliased : boolean := false;
		isConstant : boolean := false;
		definition : LwsObjectSubtypeIndication;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"
	| vars typ typeDefinition  |
	vars := self ensureStructuralEntities: anObjectDeclaration.
	vars  do: [ :v | v isStub: false ].

	typeDefinition := (anObjectDeclaration definition accept: self).  "get the corresponding FASTAdaQualifiedIdentifier"
	
	typ := (typeDefinition = targetModel singletonAnonymousArray)
		ifTrue: 
			[ typeDefinition ]  "a special case that I don't know how to deal with exactly"
		ifFalse: 
			[ self findQualifiedIdentifier: typeDefinition asTypeIdentifier asTaskIdentifier ].

	(typ isAdaType)
 		ifTrue: 
			[self setDeclaredType: typ forAll: vars]
		ifFalse: 
			[ "may be the 'variables' are actually tasks and their type is a TaskType
					can also be nil"
			(typ isAdaTask) ifTrue: 
				[ ^ self declareTasks: vars fromTaskType: typ ] ].

	anObjectDeclaration initialization ifNotNil: [ :a | a accept: self ].
	^ vars
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitOtherChoice: anOtherChoice [
	^ nil
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitPackageBody: aPackageBody [

	self pushContext:
		(self findQualifiedIdentifier:
			(LwsVisitorQualifiedIdentifierAsList new visit: aPackageBody name)
				asPackageIdentifier).
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	self visitBodyWithLocals: aPackageBody.

	self popScope.
	^ self popContext
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitPackageDeclaration: aPackageDeclaration [

	self pushContext:
		(self findQualifiedIdentifier:
			(LwsVisitorQualifiedIdentifierAsList new visit: aPackageDeclaration name)
				asPackageIdentifier).
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	aPackageDeclaration definition accept: self.

	self popScope.
	^ self popContext
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitParsingResult: aParsingResult [
	super visitParsingResult: aParsingResult.
	
	[ self topScope parents isEmpty ] whileFalse: [ self popScope ] "removing all possible USE-clause scopes after parsing a file"

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitProcedureCall: aProcedureCall [
	"ENTITY LwsProcedureCall SUBTYPE OF (LwsSimpleStatement);
		name : LwsQualifiedIdentifier;
	END_ENTITY;"
	| invok stmt proc |

	proc := self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: aProcedureCall name) asSubprogramIdentifier.

	proc ifNotNil: [
		invok := self createSubprogramInvocationFor: aProcedureCall name resolvedAs: proc.
		invok sourceAnchor: (self indexedFileAnchorForPath: self programPath
										  posFromToken: aProcedureCall).

		stmt := FASTAdaProcedureCall new
						name: (LwsPrinter format: aProcedureCall name) ;
						invocation: invok ;
						yourself.
		"points to parent and reciprocally"
		stmt parentNode: self topContext.
		self topContext statements add: stmt.
		targetModel add: stmt
	].

	^ stmt
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitProcedureDeclaration: aProcedureDeclaration [
	"Procedures are defined as FamixFunctions"
	| proc |

	proc := self visitSubprogramDeclaration: aProcedureDeclaration.

	super visitProcedureDeclaration: aProcedureDeclaration.

	^ proc
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitQualifiedIdentifier: aQualifiedIdentifier [
	| identifier |
	self resetLastAccess.
	identifier := LwsVisitorQualifiedIdentifierAsList new visit: aQualifiedIdentifier.
	^(self findQualifiedIdentifier: identifier asValueIdentifier)
		ifNotNil: [ :entity | 
			"Double dispatch"
			(entity accept: self andCreateAssociationWith: aQualifiedIdentifier)
				sourceAnchor: (self indexedFileAnchorForPath: self programPath posFromToken: aQualifiedIdentifier);
				yourself ].

]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitRangeChoice: aRangeChoice [
	^  nil
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitReturnStatement: aParsingResult [
	"self visitStatement: aParsingResult."

	^ aParsingResult result ifNotNil: [ :a | a accept: self ]
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitSeparateBody: aSeparateBody [
	"See implementations of LwsAdaVisitorDef>>visitSeparateBody:
	and LwsAdaVisitorDef>>ensureSeparateDeclaration:"
	| aSymbol cont |
	aSymbol := (LwsVisitorQualifiedIdentifierAsList new visit: aSeparateBody name)
							asPackageIdentifier asSubprogramIdentifier asTaskIdentifier.
	cont := self findQualifiedIdentifier: aSymbol. 	
	cont ifNil: 
		[ "This situation is isolated because it may need special attention"
		aSymbol clearMatchingTypes ; asSeparateIdentifier.
		cont := self findQualifiedIdentifier: aSymbol ].
	self pushContext: cont.
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.
	aSeparateBody subunitBody accept: self.
	self popScope.
	^ self popContext
]

{ #category : #'visitor-FASTEntities' }
LwsAdaVisitorRef >> visitStatementBlock: aStatementBlock [
	"declare statement, concretly the same thing as a BodyWithLocals"

	"ENTITY LwsBlockStatement
			SUBTYPE OF (LwsCompoundStatement);
		stamp : OPTIONAL String;
		locals : list OF LwsEntity;
		body : LwsBlockBody;
	END_ENTITY;"
	^ self visitBodyWithLocals: aStatementBlock
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitStringLiteral: aStringLiteral [
	^ nil
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitSubprogramBody: aSubprogramBody [

	self pushContext: (aSubprogramBody declaration accept: self).
	self pushScope: self topContext fastScope.

	self visitBodyWithLocals: aSubprogramBody.

	self popScope.
	^ self popContext

]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitSubprogramDeclaration: aSubprogramDeclaration [
	"ENTITY LwsSubprogramDeclaration ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsBasicDeclaration);
		parameters : List OF LwsFormalParameter;
		isAbstract : Boolean := false;
	END_ENTITY;"
	
	| sub |
	
	sub := self findInLocalsSubProg: (LwsVisitorSubprogramSignature new
													visit: aSubprogramDeclaration name)
					withSignature: (LwsVisitorSubprogramSignature new
											visit: aSubprogramDeclaration).

	sub fastScope addParentScopeIfNotPresent: self topScope.
	self pushContext: sub.
	self pushScope: sub fastScope.

	super visitSubprogramDeclaration: aSubprogramDeclaration.

	self popScope.
	^ self popContext

]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitSubtypeDeclaration: aSubtypeDeclaration [
	"ENTITY LwsSubtypeDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		subtypeIndication : LwsSubtypeIndication;
	END_ENTITY;"
	| typ typeDefinition |
	"SubtypeDeclaration name is a string, not a QualifiedIdentifier"
	typ := (self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: aSubtypeDeclaration name)) first.

	typeDefinition :=(aSubtypeDeclaration subtypeIndication accept: self).
	self createReferenceResolvedAs: (self findQualifiedIdentifier: typeDefinition asTypeIdentifier).
	
	^ typ
]

{ #category : #'visitor-addingReturn' }
LwsAdaVisitorRef >> visitSubtypeIndication: aSubtypeIndication [
	"ENTITY LwsSubtypeIndication SUBTYPE OF (LwsEntity);
		name : LwsQualifiedIdentifier;
		constraint : OPTIONAL LwsConstraint;
	END_ENTITY;"
	
	"returns a FASTAdaQualifiedIdentifier for the name"

	aSubtypeIndication constraint ifNotNil: [ :a | a accept: self ].
	aSubtypeIndication name qualifiers
		detect: [:q | q isKindOf: LwsArgumentsSelector ]
		ifOne: [ :argSel | argSel accept: self ].

	^ 	LwsVisitorQualifiedIdentifierAsList new visit: aSubtypeIndication name

]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitTaskBody: aTaskBody [
	"TaskBody name is a string, not a QualifiedIdentifier"

	self pushContext: (self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: aTaskBody name)) first.
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	self visitBodyWithLocals: aTaskBody.

	self popScope.
	^ self popContext
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitTaskDeclaration: aTaskDeclaration [
	"TaskDeclaration name is a string, so we create a QualifiedIdentifier manually"

	self pushContext: (self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: aTaskDeclaration name)) first.
	self topContext fastScope addParentScopeIfNotPresent: self topScope.
	self pushScope: self topContext fastScope.

	super visitTaskDeclaration: aTaskDeclaration.

	self popScope.
	^ self popContext
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitTaskTypeDeclaration: aTaskTypeDeclaration [
	"ENTITY LwsTaskTypeDeclaration
			SUBTYPE OF (LwsTaskDeclaration);
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;"
	^ self visitTaskDeclaration: aTaskTypeDeclaration
]

{ #category : #'visitor-entities' }
LwsAdaVisitorRef >> visitUseClause: aWithClause [
	"ENTITY LwsImportClause ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsEntity);
		names : list OF LwsImportClauseName;
	END_ENTITY;
	ENTITY LwsUseClause SUBTYPE OF (LwsImportClause);
..."

	| usedPckgs useFASTScope |

	usedPckgs :=
		(aWithClause names collect: [ :name |
			self findQualifiedIdentifier: (LwsVisitorQualifiedIdentifierAsList new visit: name) asPackageIdentifier
		])
		reject: #isNil.

	usedPckgs ifNotEmpty: [
		"USE Clause are handled through a fake scope that has no owner entity (thus no local symbols)
		 but has parent scopes"
		useFASTScope := FASTScope new.
		useFASTScope addParentScope: self topScope.
		usedPckgs do: [ :pckg | 
			"Any entity defined in a USEd package is directly accessible
			 so we put the USEd package scope as parent of useFASTScope"
			pckg ifNotNil: [ useFASTScope addParentScope: pckg fastScope ]
		].
		self pushScope: useFASTScope
	]
]

{ #category : #'visitor-literals' }
LwsAdaVisitorRef >> visitValueLiteral: aValueLiteral [
	^ nil
]

{ #category : #'visitor-procedurals' }
LwsAdaVisitorRef >> visitWhileIteration: aWhileIteration [
	aWhileIteration condition ifNotNil: [ :a | a accept: self ]
]
