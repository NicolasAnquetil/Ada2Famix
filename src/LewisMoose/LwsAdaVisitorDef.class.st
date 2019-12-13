"
A LwsAdaVisitorDef is a visitor on a Lewis AST to build Famix Ada entity
FAST Ada entities are created in a LwsAdaVisitorRef

Note that one can declare a fully qualified package:
PACKAGE CONTAINER.PACKAGE_NAME
In this case, this DefVisitor has to behave similarly to a RefVisitor in the sense that we are refering to CONTAINER. Unfortunatly, we cannot be sure the CONTAINER has alredy been declared ...
"
Class {
	#name : #LwsAdaVisitorDef,
	#superclass : #AdaImporter,
	#category : #LewisMoose
}

{ #category : #private }
LwsAdaVisitorDef >> ensureType: aDeclaration ofExactType: aClass [
	| aType |
	aType := self ensureType: aDeclaration name ofClass: aClass.
	[aType class == aClass] whileFalse: 
			[ "Not the exact requested type, wrong type becomes exact type"
			aType container: nil.
			targetModel remove: aType.
			aType := self ensureType: aType name ofClass: aClass ].
	^ aType
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitCharacterEnumerationId: anEnumerationId [
	"CharacterEnumerationId are 'special' enumeration constantes (not id)"
	|  name |
	name := (String with: anEnumerationId element) printString.
	^(self ensureStructuralEntity: name famixType: ADAStructuralEntity)
		container: self topContext;
		isStub: false; 
		isConstant: true;
		addSourceAnchorForPath: self programPath posFromToken: anEnumerationId;
		yourself
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitComponentAttribute: aComponentAttribute [
	"an element in a record definition
	 Could also be inside a LwsProtectedUnitPrivateElement, but we blocked that"

	"ENTITY LwsComponentAttribute SUBTYPE OF (LwsEntity);
		names : List OF String;
		domain : LwsComponentSubtype;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"
	(self ensureStructuralEntities: aComponentAttribute)  do: [ :a |
		a isStub: false.
		a addSourceAnchorForPath: self programPath posFromToken: aComponentAttribute
	].

	super visitComponentAttribute: aComponentAttribute
]

{ #category : #private }
LwsAdaVisitorDef >> visitDeclaration: aDeclaration do: aBlock [
	"Common code for full types and subtypes"

	| aClass aType |
	aClass := aDeclaration accept: LwsAdaTypeVisitor new.
	self assert: (aClass class == LwsAdaTypeVisitor) not.
	aType := (self ensureType: aDeclaration ofExactType: aClass)
		isStub: false;
		addSourceAnchorForPath: self programPath posFromToken: aDeclaration;
		yourself.
	self pushContext: aType.
	aBlock cull: aDeclaration.
	self popContext
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitElementRenamingDeclaration: anElementRenamingDeclaration [

	self flag: 'implement me'.
	^super visitElementRenamingDeclaration: anElementRenamingDeclaration


]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitEntryDeclaration: anEntryDeclaration [
	"very similar to SubprogramDeclaration but the name is a string"
	"ENTITY LwsEntryDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		range : OPTIONAL LwsRange;
		parameters : List OF LwsFormalParameter;
	END_ENTITY;"
	| sub |

	sub := (self ensureSubprogram: anEntryDeclaration name
					 withSignature: (LwsVisitorSubprogramSignature new visit: anEntryDeclaration))
					isStub: false ;
					yourself.
	sub addSourceAnchorForPath: self programPath posFromToken: anEntryDeclaration.

	self pushContext: sub.

	super visitSubprogramDeclaration: anEntryDeclaration.	"For parameters"

	^ self popContext
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitEnumerationType: anEnumerationType [
	"ENTITY LwsEnumerationType SUBTYPE OF (LwsDiscreteType);
		elements : List OF LwsEnumerationId;
	END_ENTITY;"
	
	"enumerationTypes are different from other type in that their members (enumerationIds) 
	are defined directly within the container of the enumeration type (and not within the type itself)
	so we leave the type sitting on the top of the context stack (visitFullTypeDeclaration), 
	because it will be popped in visitFullTypeDeclaration)"
	| aType  |
	aType := self popContext.
	anEnumerationType elements do: 
		[ :each | (each accept: self) parentEnum: aType ].
	self pushContext: aType

	
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitExceptionRenamingDeclaration: anExceptionRenamingDeclaration [

	self flag: 'implement me'.
	^super visitExceptionRenamingDeclaration: anExceptionRenamingDeclaration 
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitFormalParameter: aFormalParameter [
	"ENTITY LwsFormalParameter SUBTYPE OF (LwsEntity);
		names : list OF String;
		mode : OPTIONAL LwsParameterMode;
		domainName : LwsQualifiedIdentifier;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"

	(self ensureStructuralEntities: aFormalParameter famixType: ADAParameter) do: [ :p |
			(aFormalParameter mode) ifNotNil: [ p mode: aFormalParameter mode asString]
										"ifNil: default is inMode, treated in creation".
			p isStub: false.
			p addSourceAnchorForPath: self programPath posFromToken: aFormalParameter.
	].

	super visitFormalParameter: aFormalParameter
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitFullTypeDeclaration: aFullTypeDeclaration [
	"ENTITY LwsTypeDeclaration ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;
	ENTITY LwsFullTypeDeclaration
			SUBTYPE OF (LwsTypeDeclaration);
		typeDefinition : LwsTypeDefinition;
	END_ENTITY;"

	self visitDeclaration: aFullTypeDeclaration do: 
		[aFullTypeDeclaration typeDefinition accept: self ]
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitFunctionDeclaration: aFunctionDeclaration [
	| func |
	"ENTITY LwsFunctionDeclaration
			SUBTYPE OF (LwsSubprogramDeclaration);
		name : LwsFunctionName;
		returnType : OPTIONAL LwsQualifiedIdentifier;
	END_ENTITY;"
	func := self visitSubprogramDeclaration: aFunctionDeclaration.

	super visitFunctionDeclaration: aFunctionDeclaration.

	^ func
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericDeclaration: aGenericDeclaration [
	"ENTITY LwsGenericDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		formalPart : List OF LwsGenericFormalElement;
		declaration : LwsGenericDeclarationTarget;
	END_ENTITY;

	ENTITY LwsGenericPackageDeclaration
			SUBTYPE OF (LwsGenericDeclaration);
		SELF\LwsGenericDeclaration.declaration : LwsPackageDeclaration;
	END_ENTITY;"

	| generic |

	generic := aGenericDeclaration declaration accept: self.
	generic isGeneric: true.

	"pushes the generic on the stack so that its formal parts are created in its scope"
	self pushContext: generic.  

	aGenericDeclaration formalPart ifNotNil: [ :a | a do: [ :e | e accept: self ] ].

	^ self popContext 
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericFormalFunction: aGenericFormalFunction [
	"ENTITY LwsGenericFormalFunction
			SUBTYPE OF (LwsGenericFormalSubprogram);
		SELF\LwsGenericFormalSubprogram.base : LwsFunctionDeclaration;
	END_ENTITY;"

	aGenericFormalFunction base accept: self
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericFormalPackage: aGenericFormalPackage [
	"ENTITY LwsGenericFormalPackage
			SUBTYPE OF (LwsGenericFormalElement);
		name : String;
		isNewName : LwsQualifiedIdentifier;
		boxArgument : Boolean := false;
	END_ENTITY;"

]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericFormalParameter: aGenericFormalParameter [
	"GenericFormalParameter is treated as a localVariable"

	"ENTITY LwsGenericFormalParameter
			SUBTYPE OF (LwsGenericFormalElement);
		base : LwsFormalParameter;
	END_ENTITY;"

	(self ensureStructuralEntities: aGenericFormalParameter base) do: [ :var |
			var addSourceAnchorForPath: self programPath posFromToken: aGenericFormalParameter.
	].

]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericFormalProcedure: aGenericFormalProcedure [
	"ENTITY LwsGenericFormalProcedure
			SUBTYPE OF (LwsGenericFormalSubprogram);
		SELF\LwsGenericFormalSubprogram.base : LwsProcedureDeclaration;
	END_ENTITY;"

	aGenericFormalProcedure base accept: self
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericFormalType: aGenericFormalType [
	"ENTITY LwsGenericFormalType
			SUBTYPE OF (LwsGenericFormalElement);
		base : LwsFullTypeDeclaration;
	END_ENTITY;"

	aGenericFormalType base accept: self
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericPackageDeclaration: aGenericPackageDeclaration [
	"ENTITY LwsGenericDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		formalPart : List OF LwsGenericFormalElement;
		declaration : LwsGenericDeclarationTarget;
	END_ENTITY;

	ENTITY LwsGenericPackageDeclaration
			SUBTYPE OF (LwsGenericDeclaration);
		SELF\LwsGenericDeclaration.declaration : LwsPackageDeclaration;
	END_ENTITY;"

	"delegate to 'super-class' GenericDeclaration:"
	^ self visitGenericDeclaration: aGenericPackageDeclaration 
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericPackageInstanciation: aGenericPackageInstanciation [
	"ENTITY LwsGenericInstanciation
			SUBTYPE OF (LwsBasicDeclaration);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	ENTITY LwsGenericPackageInstanciation
			SUBTYPE OF (LwsGenericInstanciation);
		packageDeclaration : LwsCompoundName;
	END_ENTITY;"

	^(self ensurePackageInstanciation: aGenericPackageInstanciation packageDeclaration asString)
		isStub: false;
		addSourceAnchorForPath: self programPath posFromToken: aGenericPackageInstanciation;
		yourself
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericSubprogramDeclaration: aGenericSubprogramDeclaration [
	"ENTITY LwsGenericDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		formalPart : List OF LwsGenericFormalElement;
		declaration : LwsGenericDeclarationTarget;
	END_ENTITY;
	
	ENTITY LwsGenericSubprogramDeclaration
			SUBTYPE OF (LwsGenericDeclaration);
		SELF\LwsGenericDeclaration.declaration : LwsSubprogramDeclaration;
	END_ENTITY;"

	"delegate to 'super-class' GenericDeclaration:"
	^ self visitGenericDeclaration: aGenericSubprogramDeclaration
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitGenericSubprogramInstanciation: aGenericSubprogramInstanciation [
	"ENTITY LwsGenericInstanciation
			SUBTYPE OF (LwsBasicDeclaration);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	ENTITY LwsGenericSubprogramInstanciation
			SUBTYPE OF (LwsGenericInstanciation);
		subprogramDeclaration : LwsSubprogramDeclaration;
	END_ENTITY;"

	"Creates an 'empty' GenericSubprogramInstanciation with just the name (no parameters, no return type)
	 The real stuff can only be done in the RefVisitor when we can resolve the name of the Generic"
	| sub name |

	name := LwsVisitorSubprogramSignature new visit: aGenericSubprogramInstanciation subprogramDeclaration name.
	
	sub := self ensureSubprogramInstanciation: name	withSignature: nil.
	sub isStub: false.
	sub addSourceAnchorForPath: self programPath posFromToken: aGenericSubprogramInstanciation.

	^ sub
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitImportClause: anImportClause [

	| packageIdentifier |
	anImportClause names do: 
		[ :each | 
		packageIdentifier := LwsVisitorQualifiedIdentifierAsList new visit: each.
		self ensurePackage: packageIdentifier ].
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitNumberDeclaration: aNumberDeclaration [
	"ENTITY LwsNumberDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		initialization : LwsExpression;
	END_ENTITY;"

	(self ensureStructuralEntities: aNumberDeclaration) do: [ :var |
			var isStub: false.
			var isConstant: true.
			var addSourceAnchorForPath: self programPath posFromToken: aNumberDeclaration.
	].

	super visitNumberDeclaration: aNumberDeclaration

]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitObjectDeclaration: anObjectDeclaration [
	"ENTITY LwsObjectDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		names : List OF String;
		isAliased : boolean := false;
		isConstant : boolean := false;
		definition : LwsObjectSubtypeIndication;
		initialization : OPTIONAL LwsExpression;
	END_ENTITY;"

	(self ensureStructuralEntities: anObjectDeclaration) do: 
		[ :var |
		var 
			isStub: false;
			isConstant: anObjectDeclaration isConstant;
		 	addSourceAnchorForPath: self programPath posFromToken: anObjectDeclaration ].

	super visitObjectDeclaration: anObjectDeclaration

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitPackageBody: aPackageBody [
	| pack |
	"ENTITY LwsPackageBody SUBTYPE OF (LwsBodyWithLocals);
		name : LwsCompoundName;
		blockBody : OPTIONAL LwsBlockBody;
	END_ENTITY;"
	pack := self ensurePackage: (LwsVisitorQualifiedIdentifierAsList new visit: aPackageBody name).
	pack addSourceAnchorForPath: self programPath posFromToken: aPackageBody .
	pack isStub: false.

	self pushContext: pack.

	self visitBodyWithLocals: aPackageBody.

	^ self popContext
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitPackageDeclaration: aPackageDeclaration [
	| thePackage packageIdentifier |
	"ENTITY LwsPackageDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : LwsCompoundName;
		definition : LwsPackageDefinition;
	END_ENTITY;"
	
	packageIdentifier := LwsVisitorQualifiedIdentifierAsList new visit: aPackageDeclaration name.
	thePackage := (self ensurePackage: packageIdentifier)
		addSourceAnchorForPath: self programPath posFromToken: aPackageDeclaration;
		isStub: false;
		yourself.
	self pushContext: thePackage.
	aPackageDeclaration definition accept: self.
	^ self popContext
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitPackageRenamingDeclaration: aPackageRenamingDeclaration [

	| alias original renamedIdentifier newIdentifier |
	aPackageRenamingDeclaration newName ifNil: [ ^self ].
	renamedIdentifier := LwsVisitorQualifiedIdentifierAsList new 
			visit: aPackageRenamingDeclaration renamedEntityName.
	original := self ensurePackage: renamedIdentifier.
	newIdentifier := LwsVisitorQualifiedIdentifierAsList new 
			visit: aPackageRenamingDeclaration newName.
	alias := (self ensurePackageAlias: newIdentifier)	
		isStub: false;
		addSourceAnchorForPath: self programPath posFromToken: aPackageRenamingDeclaration context;
		originalEntity: original;
		yourself.

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitParsingResult: aParsingResult [
	"ENTITY LwsParsingResult SUBTYPE OF (LwsEntity);
		entities : List OF LwsEntity;
		tokenList : LwsTokenList ::= LwsTokenList new context: self;
	DERIVE
		tokens : List OF LwsToken ::= self tokenList tokens;
		asString : String ::= self tokenList asString;
	END_ENTITY;"

	aParsingResult entities ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	"aParsingResult tokenList ifNotNil: [ :a | a accept: self ]"
]

{ #category : #'visitor-entities-generic' }
LwsAdaVisitorDef >> visitPrivateTypeDeclaration: aPrivateTypeDeclaration [
	"ENTITY LwsPrivateTypeDefinition
			SUBTYPE OF (LwsTypeDefinition);
		isTagged : Boolean := false;
		isLimited : Boolean := false;
		'+ has a name'
	END_ENTITY;"
	| typ |

	typ := self ensureType: aPrivateTypeDeclaration name.
	typ isStub: false.  "not sure about this one"
	typ addSourceAnchorForPath: self programPath posFromToken: aPrivateTypeDeclaration.

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitProcedureDeclaration: aProcedureDeclaration [
	"Procedures are defined as FamixFunctions"
	"ENTITY LwsSubprogramDeclaration ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsBasicDeclaration);
		parameters : List OF LwsFormalParameter;
		isAbstract : Boolean := false;
	END_ENTITY;
	ENTITY LwsProcedureDeclaration
			SUBTYPE OF (LwsSubprogramDeclaration);
		name : LwsCompoundName;
	END_ENTITY;"
	| proc |
	proc := self visitSubprogramDeclaration: aProcedureDeclaration.

	super visitProcedureDeclaration: aProcedureDeclaration.

	^ proc
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitProtectedUnitPrivateElement: aProtectedUnitPrivateElement [
	"blocking visit here so that  it does not call visitComponentAttribute below this
	For us, LwsComponentAttribute are reserved for LwsRecordDefinition"
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitSeparateBody: aSeparateBody [
	"ENTITY LwsSeparateBody SUBTYPE OF (LwsBody);
		name : LwsCompoundName;
		subunitBody : LwsSubunitBody;
	END_ENTITY;"

	| aSymbol |
	aSymbol := LwsVisitorQualifiedIdentifierAsList new visit: aSeparateBody name.
	self pushContext: (self ensureSeparateDeclaration: aSymbol).
	aSeparateBody subunitBody accept: self.
	^ self popContext  "i.e. pack"
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitStringEnumerationId: aStringEnumerationId [
	"StringEnumerationId are 'normal' enumeration constantes (not character)"

	^(self ensureStructuralEntity: aStringEnumerationId element famixType: ADAStructuralEntity)
		container: self topContext;
	 	isStub: false;
		isConstant: true;
		addSourceAnchorForPath: self programPath posFromToken: aStringEnumerationId;
		yourself
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitSubprogramBody: aSubprogramBody [
	| proc |
	"ENTITY LwsSubprogramBody SUBTYPE OF (LwsBodyWithLocals);
		declaration : LwsSubprogramDeclaration;
		blockBody : LwsBlockBody;
	END_ENTITY;"
	proc := aSubprogramBody declaration accept: self.
	proc addSourceAnchorForPath: self programPath posFromToken: aSubprogramBody.
	self pushContext: proc.

	self visitBodyWithLocals: aSubprogramBody.

	^ self popContext

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitSubprogramDeclaration: aSubprogramDeclaration [
	"factors out commonalities between function/procedure/operatorOverload Declarations"
	"ENTITY LwsSubprogramDeclaration ABSTRACT SUPERTYPE
			SUBTYPE OF (LwsBasicDeclaration);
		parameters : List OF LwsFormalParameter;
		isAbstract : Boolean := false;
	END_ENTITY;"
	| sub subName signature  candidates sep |

	subName := LwsVisitorSubprogramSignature new visit: aSubprogramDeclaration name.
	signature := LwsVisitorSubprogramSignature new visit: aSubprogramDeclaration.
	sub := (self ensureSubprogram: subName withSignature: signature).
	sub isStub ifTrue: 
		[ "If a subprogram was freshly created,
		we need to deal with separates too
	 	If there is a separateContainer with same name in same context 
		we substitute the new subprogram to this container"
		candidates := self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: subName).
		sep := candidates detect: [ :c | (c class == ADASeparateDeclaration) ] ifNone: [ nil ]	.	
		sep ifNotNil: [ self subsituteInModel: sub to: sep ] ].
	sub	 isStub: false.
	sub addSourceAnchorForPath: self programPath posFromToken: aSubprogramDeclaration.
	self pushContext: sub.
	super visitSubprogramDeclaration: aSubprogramDeclaration.	"For parameters"
	^ self popContext
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitSubprogramRenamingDeclaration: aSubprogramRenamingDeclaration [

	self flag: 'implement me'.
	^super visitSubprogramRenamingDeclaration: aSubprogramRenamingDeclaration
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitSubtypeDeclaration: aSubtypeDeclaration [
	"ENTITY LwsSubtypeDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		subtypeIndication : LwsSubtypeIndication;
	END_ENTITY;"

	self visitDeclaration: aSubtypeDeclaration do: 
		[ :decl | decl  subtypeIndication accept: self ]

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitTaskBody: aTaskBody [
	| task |
	"ENTITY LwsTaskBody SUBTYPE OF (LwsBodyWithLocals);
		name : String;
		blockBody : LwsBlockBody;
	END_ENTITY;"

	task := self ensureTask: aTaskBody name.
	task isStub: false.
	task addSourceAnchorForPath: self programPath posFromToken: aTaskBody.

	self pushContext: task.

	self visitBodyWithLocals: aTaskBody.

	^ self popContext  "i.e. task"
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitTaskDeclaration: aTaskDeclaration [
	| task |
	"ENTITY LwsTaskDeclaration
			SUBTYPE OF (LwsBasicDeclaration);
		name : String;
		definition : OPTIONAL LwsTaskDefinition;
	END_ENTITY;"

	task := self ensureTask: aTaskDeclaration name.
	task isStub: false.
	task addSourceAnchorForPath: self programPath posFromToken: aTaskDeclaration.

	self pushContext: task.

	super visitTaskDeclaration: aTaskDeclaration.

	^ self popContext  "i.e. task"
]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitTaskTypeDeclaration: aTaskTypeDeclaration [
	"ENTITY LwsTaskTypeDeclaration
			SUBTYPE OF (LwsTaskDeclaration);
		discriminant : OPTIONAL LwsDiscriminantPart;
	END_ENTITY;
	
	same as #visitTaskDeclaration: (copied from there) but must treat the creation a bit differently"
	| task |

	task := self ensureTaskType: aTaskTypeDeclaration name.
	task isStub: false.
	task addSourceAnchorForPath: self programPath posFromToken: aTaskTypeDeclaration.

	self pushContext: task.

	super visitTaskDeclaration: aTaskTypeDeclaration.

	^ self popContext  "i.e. task"
]

{ #category : #'visitor-structural-entities' }
LwsAdaVisitorDef >> visitUnitRenamingDeclaration: anUnitRenamingDeclaration [

	self flag: 'implement me'.
	^super visitUnitRenamingDeclaration: anUnitRenamingDeclaration

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitUseClause: aUseClause [
	self visitImportClause: aUseClause

]

{ #category : #'visitor-entities' }
LwsAdaVisitorDef >> visitWithClause: aWithClause [
	self visitImportClause: aWithClause


]
