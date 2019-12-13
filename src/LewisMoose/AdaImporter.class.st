"
An AdaImporter takes care of creating FamixAda entities from LewisAda entities.
It is called by the LwsAdaVisitorImporter and could (should?) be integrated with it
"
Class {
	#name : #AdaImporter,
	#superclass : #LwsWalkingVisitor,
	#instVars : [
		'contextStack',
		'targetModel',
		'programName',
		'programPath'
	],
	#category : #LewisMoose
}

{ #category : #cleaning }
AdaImporter >> clearModel [
	targetModel := nil
]

{ #category : #'private-entity-creation' }
AdaImporter >> createEntity: aClass named: aString [

	^ aClass new
		name: aString;
		container: self topContext;
		stub: true;
		mooseModel: self model;
		yourself	"by default suppose it is a stub, can be corrected afterward"
]

{ #category : #'private-entity-creation' }
AdaImporter >> createStub: aQualifiedIdentifier inContext: context [
	"stub needs to be created in its container, so we fake the contextStack for this to happen
	 also context stack may contain FAST entities that are not suited to contain other entities (like stub variables or stub types) so from the context we search a suitable entity"
	| stub parent |
	"find adequate parent (with a scope)"
	parent := context.
	[ (parent hasScope) and: [parent scope notNil] ]
			whileFalse: [ parent := parent container ].

	"fake context stack"
	self pushContext: parent.
	stub := aQualifiedIdentifier stubCreateBlock value: self.
	parent scope add: stub.

	self popContext.  "put stack back to its previous state"
	^ stub
]

{ #category : #'entity-creation' }
AdaImporter >> createSubprogram: aSubprogramName withSignature: aSubprogramSignature [
	^ (self createEntity: ADASubprogram named: aSubprogramName)
			signature: aSubprogramSignature ;
			yourself
]

{ #category : #'entity-creation' }
AdaImporter >> createSubprogramInstanciation: aSubprogramName withSignature: aSubprogramSignature [

	^ (self createEntity: ADAGenericSubprogramInstanciation named: aSubprogramName)
			signature: aSubprogramSignature ;
			yourself
]

{ #category : #'entity-creation' }
AdaImporter >> ensurePackage: aPackagedentifier [
	"Similar to ensureQualifiedIdentifier: but we need to deal with separates too
	 If there is a separateContainer with same name in same context we substitute the
	 new package to this container"
	| pack sep |

	aPackagedentifier clearMatchingTypes ; asPackageIdentifier.
	pack := self ensureQualifiedIdentifier: aPackagedentifier.

	"searching again to take care of possible separate"
	aPackagedentifier clearMatchingTypes ; asSeparateIdentifier.
	sep := (self findQualifiedIdentifier: aPackagedentifier).

	sep ifNotNil: [ self subsituteInModel: pack to: sep ].

	^ pack
]

{ #category : #'entity-creation' }
AdaImporter >> ensurePackageAlias: aPackagedentifier [

	| mainSymbol  |
	aPackagedentifier clearMatchingTypes ; asPackageIdentifier.
	
	mainSymbol := aPackagedentifier withoutContainers.
	^ (self topContext fastScope lookupInLocals: mainSymbol)
				detect: [ :candidate | mainSymbol matches: candidate ]
				ifNone: [ (self createEntity: ADAPackageAlias named: mainSymbol mainIdentifier) ].

]

{ #category : #'entity-creation' }
AdaImporter >> ensurePackageInstanciation: aString [
	| aSymbol |
	Halt if:[aString asUppercase  = 'WORD_IO' and:[(programPath asUppercase replaceAll: '/' with: '\') includesSubstring: 'ENG\SRC\ENG\SRC\PATH_RECORDING' ] ].
	aSymbol := (FASTAdaQualifiedIdentifier with: aString) asGenPackageInstanceIdentifier.
	^ (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate | aSymbol matches: candidate ]
			ifNone: [
				
				self createEntity: ADAGenericPackageInstanciation named: aString]

]

{ #category : #'private-entity-creation' }
AdaImporter >> ensureQualifiedIdentifier: aSymbol [
	"Answer the entity for a qualifiedIdentifier, 
	if not found, creates a stub for it using the symbol's stubCreationBlock
	similar to findQualifiedIdentifier in the searching phase"
	
	^self useQualifiedIdentifier: aSymbol during: [
		| mainSymbol theEntity scope |
		mainSymbol := aSymbol withoutContainers.
		scope := self topContext.
		theEntity := nil.
		[ theEntity isNil and: [ scope notNil and: [ scope fastScope notNil ] ] ] whileTrue:	
			[ theEntity := (scope fastScope lookupInLocals: mainSymbol)
					detect: [ :candidate | mainSymbol matches: candidate ]
					ifNone: [ nil ].
			theEntity ifNil: [ scope := scope container ] ].
		theEntity ifNil: [ aSymbol createStubFor: self	 ] ].		
 
]

{ #category : #'entity-creation' }
AdaImporter >> ensureSeparateDeclaration: aSymbol [
	"search if we can find this separateBody name (in the current context) as a package, a task or a subprogram
	 if not, we create a separateDeclaration (i.e. something we don't know what it is)
	 if so, we return the entity found"
	| cont |

	aSymbol asPackageIdentifier ; asSubprogramIdentifier ; asTaskIdentifier.
	cont := self findQualifiedIdentifier: aSymbol.

	"could not find it, so create a SeparateDeclaration"
	cont ifNil: 
		[ aSymbol clearMatchingTypes ; asSeparateIdentifier.
		cont := self ensureQualifiedIdentifier: aSymbol ].
	^ cont
]

{ #category : #'entity-creation' }
AdaImporter >> ensureStructuralEntities: structuralEntitiesDeclaration [
	^ self ensureStructuralEntities: structuralEntitiesDeclaration famixType: ADAStructuralEntity

]

{ #category : #'entity-creation' }
AdaImporter >> ensureStructuralEntities: structuralEntitiesDeclaration famixType: aClass [

	^ structuralEntitiesDeclaration names collect: [ :n |
			self ensureStructuralEntity: n famixType: aClass 	]
]

{ #category : #'entity-creation' }
AdaImporter >> ensureStructuralEntity: aString famixType: anAdaStructuralEntityClass [
	| aSymbol |
	aSymbol := (FASTAdaQualifiedIdentifier with: aString) asStructuralIdentifier.
	^ (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate | aSymbol matches: candidate ]
			ifNone: [ self createEntity: anAdaStructuralEntityClass named: aString ]
]

{ #category : #'entity-creation' }
AdaImporter >> ensureSubprogram: aSubprogramName withSignature: aSubprogramSignature [

	^ (self findInLocalsSubProg: aSubprogramName withSignature: aSubprogramSignature)
		ifNil: [ self createSubprogram: aSubprogramName withSignature: aSubprogramSignature ]
]

{ #category : #'entity-creation' }
AdaImporter >> ensureSubprogramInstanciation: aSubprogramName withSignature: aSubprogramSignature [
	"if aSubprogramSignature is nil, this means we are declaring a SubprogramInstanciation without having resolved the generic subprogram
	 Possible cases are:
	 1) aSubprogramSignature is nil and there is no existing matching SubprogramInstanciation
	    -> create an ADAGenericSubprogramInstanciation with signature <name>(??)
	 2) aSubprogramSignature is nil and there is an existing matching SubprogramInstanciation
	    -> return the existing ADAGenericSubprogramInstanciation
	 3) aSubprogramSignature is not nil and there is no existing matching SubprogramInstanciation
	    -> create an ADAGenericSubprogramInstanciation with signature aSubprogramSignature
	 4) aSubprogramSignature is not nil and there is an existing matching SubprogramInstanciation
	    -> return the existing ADAGenericSubprogramInstanciation"
	| ent |
	ent := self findMatchingInstanciationNamed: aSubprogramName  withSignature: aSubprogramSignature.

	aSubprogramSignature ifNil: [
		ent ifNil: [
			ent := self createSubprogramInstanciation: aSubprogramName withSignature: (aSubprogramName , '(??)')
		].
		^ ent
	].

	ent ifNil: [
		ent := self createSubprogramInstanciation: aSubprogramName withSignature: aSubprogramSignature.
		^ ent
	].

	(ent signature endsWith: '(??)') ifTrue: [
		ent signature: aSubprogramSignature.
		^ ent
	].

	^ ent
]

{ #category : #'entity-creation' }
AdaImporter >> ensureTask: aString [
	"shouldn't we test for separate here?"
	| task sep aSymbol |

		aSymbol := (FASTAdaQualifiedIdentifier with: aString) asTaskIdentifier.
	"^ (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate | aSymbol matches: candidate ]
			ifNone: [ self createEntity: ADATask named: aString ]"

	task := self ensureQualifiedIdentifier: aSymbol.

	"searching again to take care of possible separate"
	aSymbol clearMatchingTypes ; asSeparateIdentifier.
	sep := (self findQualifiedIdentifier: aSymbol).

	sep ifNotNil: [ self subsituteInModel: task to: sep ].

	^ task
]

{ #category : #'entity-creation' }
AdaImporter >> ensureTaskType: aString [
	"Ada task type may have been declared simply as a Type before
	So have to check if we find a type and convert it to a task"
	| aSymbol found task |
	aSymbol := (FASTAdaQualifiedIdentifier with: aString) asTaskIdentifier ; asTypeIdentifier.
	found := (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate | aSymbol  matches: candidate ]
			ifNone: [ self createEntity: ADATask named: aString ].

	found isAdaTask
		ifTrue: [  ^ found ].

	"here we are, it was defined as a type ..."	
	task := self createEntity: ADATask named: aString.
	task container: found container.
	found container types remove: found.
	targetModel remove: found.
	^ task
]

{ #category : #'entity-creation' }
AdaImporter >> ensureType: aString [

	^self ensureType: aString ofClass: ADAType
]

{ #category : #'entity-creation' }
AdaImporter >> ensureType: aString ofClass: aClass [
	| aSymbol |
	aSymbol := (FASTAdaQualifiedIdentifier with: aString) asTypeIdentifier.
	^ (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate | aSymbol matches: candidate ]
			ifNone: [ self createEntity: aClass named: aString ]
]

{ #category : #'private-entity-creation' }
AdaImporter >> findInLocalsSubProg: aName withSignature: aSignature [
	"finding the right entity is a bit more difficult with subprograms because
	 requires to test the signature"

	| candidates |
	candidates := self topContext fastScope lookupInLocals: (FASTAdaQualifiedIdentifier with: aName).
	^ candidates detect: [ :c | (c isAdaSubprogram) and: [c signature asUppercase = aSignature asUppercase] ] ifNone: [ nil ]
]

{ #category : #'private-entity-creation' }
AdaImporter >> findMatchingInstanciationNamed: aName withSignature: aSignature [
	"look comment in ensureSubprogramInstanciation:withSignature:"
	| aSymbol |

	aSymbol := (FASTAdaQualifiedIdentifier with: aName) asGenSubpgmInstanceIdentifier.
	^ (self topContext fastScope lookupInLocals: aSymbol)
			detect: [ :candidate |aSymbol matches: candidate	]
			ifNone: [ nil ]		

]

{ #category : #resolving }
AdaImporter >> findQualifiedIdentifier: aQualifiedIdentifier [

	| cont |
	(aQualifiedIdentifier containers isEmpty)
		ifTrue: [ cont := self topContext ]
		ifFalse: 
			[ cont := self findQualifiedIdentifier: aQualifiedIdentifier containers asContainerIdentifier.
			
			self flag: 'This ACCESS creation should not be in a FIND method :-('.
			cont isAdaStructural
				ifTrue: [ self createAssociationTo: cont ] ].

	^cont ifNotNil: [ 
		#advancedLookup.
		cont 
			lookup: aQualifiedIdentifier 
			where: [ :candidate | aQualifiedIdentifier matches: candidate ] ]

]

{ #category : #'initialize-release' }
AdaImporter >> initialize [ 
	super initialize. 
	contextStack := Stack new.

]

{ #category : #accessing }
AdaImporter >> isAccess [
	^ false
]

{ #category : #resolving }
AdaImporter >> lookup: aSymbol where: aBlock [
	"search for aSymbol in the receicer scope and its parent scopes"

	#advancedLookup.
	^FASTVariableLookup lookup: aSymbol where: aBlock within: self


]

{ #category : #accessing }
AdaImporter >> model [
	^ targetModel
]

{ #category : #accessing }
AdaImporter >> model: aModel [

	targetModel := aModel.

	(contextStack isEmpty)
		"avoid pushing ADATopLevelContainer on the stack if it's already there"	
		ifTrue: [self pushContext: (targetModel allWithType: ADATopLevelContainer) first]
]

{ #category : #accessing }
AdaImporter >> popContext [
	
	^ contextStack pop
]

{ #category : #constants }
AdaImporter >> primitiveTypes [

	^ #('integer' 'natural' 'positive' 'float' 'string' 
	'character' 'wide_character' 'wide_wide_character' 'boolean')

]

{ #category : #accessing }
AdaImporter >> programName [
	
	^ programName
]

{ #category : #accessing }
AdaImporter >> programName: anObject [
	
	programName := anObject
]

{ #category : #accessing }
AdaImporter >> programPath [
	
	^ programPath
]

{ #category : #accessing }
AdaImporter >> programPath: anObject [
	
	programPath := anObject
]

{ #category : #accessing }
AdaImporter >> pushContext: anObject [

	^ contextStack push: anObject
]

{ #category : #'private-entity-creation' }
AdaImporter >> subsituteInModel: entity to: aSeparate [
	"take all children of aSeparate and put them under entity. Delete aSeparate"

	aSeparate packages copy do: [ :p | p container: entity ].
	aSeparate separates copy do: [ :p | p container: entity ].
	aSeparate subprograms copy do: [ :s | s container: entity ].
	aSeparate tasks copy do: [ :t | t container: entity ].
	aSeparate types copy do: [ :t | t container: entity ].
	aSeparate localVariables copy do: [ :v | v container: entity ].

	aSeparate sourceAnchor ifNotNil: [
		aSeparate sourceAnchor allFiles do: [ :anchor |  targetModel remove: anchor ].
		targetModel remove: aSeparate sourceAnchor.
	].

	aSeparate container: nil.
	targetModel remove: aSeparate
]

{ #category : #accessing }
AdaImporter >> topContainerContext [
	"Sometimes we push FAST entites on the context stack. They are not suited for definition of new entities. This method will return the topmost context that is a container (not FAST) in which one can define an entity"
	| ctxt |
	ctxt := contextStack top.
	((ctxt notNil) and: [ctxt isAdaContainer not])
		ifTrue: [ | top |
			top := ctxt.
			self popContext.
			ctxt := self topContainerContext.
			self pushContext: top
		].
	^ ctxt
]

{ #category : #accessing }
AdaImporter >> topContext [
	
	^ contextStack top
]

{ #category : #accessing }
AdaImporter >> topLevelContainer [
	
	^ contextStack last
]

{ #category : #'private-entity-creation' }
AdaImporter >> useQualifiedIdentifier: aSymbol during: aBlock [

	| theContext |
	aSymbol containers isEmpty ifTrue: [^aBlock value].
	"Push needed to evaluate the block in the right context
	Avoid using an alias"
	theContext := self ensureQualifiedIdentifier: aSymbol containers asContainerIdentifier	.
	theContext isAdaAlias ifTrue: [ theContext := theContext originalEntity ].
	self pushContext: theContext.
	^aBlock ensure: [ self popContext ].

]

{ #category : #visitor }
AdaImporter >> visit: anAST [
	^ anAST accept: self

	
]

{ #category : #visitor }
AdaImporter >> visit: anAST with: aVisitor [
	^ anAST accept: aVisitor
]

{ #category : #visitor }
AdaImporter >> visitAcceptStatement: anAcceptStatement [
	"ENTITY LwsAcceptStatement SUBTYPE OF (LwsCompoundStatement);
		entryName : LwsQualifiedIdentifier;
		parameters : List OF LwsFormalParameter;
		statements : List OF LwsStatement;
		handlers : List OF LwsExceptionHandler;
	END_ENTITY;"

	"Redefined because we do not yet manage entry, see also ENTRY"
]

{ #category : #visitor }
AdaImporter >> visitAccessToSubprogram: anAccessToSubprogram [
	"Redefined to avoid creating parameters/returnType of accessed subprogram"
	
	"anAccessToSubprogram parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anAccessToSubprogram returnType ifNotNil: [ :a | a accept: self ]"

]

{ #category : #visitor }
AdaImporter >> visitEntity: anEntity [
	"Redefined to avoid infinite loop"
]

{ #category : #visitor }
AdaImporter >> visitEntryBody: anEntryBody [
	"Redefined because we do not yet manage entry, see also ACCEPT"
]

{ #category : #visitor }
AdaImporter >> visitEntryDeclaration: anEntryDeclaration [
	"Redefined to avoid creating parameters of entry
	Could put it back but should create the entry as a subprogram"
	
	"anEntryDeclaration range ifNotNil: [ :a | a accept: self ].
	anEntryDeclaration parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ]"

]

{ #category : #visitor }
AdaImporter >> visitOperatorOverloadDeclaration: anOperatorOverloadDeclaration [
	| func |
	"ENTITY LwsOperatorOverloadDeclaration
			SUBTYPE OF (LwsFunctionDeclaration);
		SELF\LwsFunctionDeclaration.name : LwsStringDesignator;
	END_ENTITY;"
	
	"anOperatorOverloadDeclaration name = LwsStringDesignator
	 LwsStringDesignator name = aString"
	func := self visitSubprogramDeclaration: anOperatorOverloadDeclaration.

	super visitOperatorOverloadDeclaration: anOperatorOverloadDeclaration.

	^ func
]

{ #category : #visitor }
AdaImporter >> visitOtherChoice: anOtherChoice [
	"does not interest us"
]

{ #category : #visitor }
AdaImporter >> visitPragma: aPragma [
	"not treated currently"
]
