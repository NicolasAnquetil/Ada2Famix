Class {
	#name : #LwsAstBuilder,
	#superclass : #Ada95TreeBuilder,
	#instVars : [
		'parser'
	],
	#category : #'Lewis-AdaParser'
}

{ #category : #private }
LwsAstBuilder class >> parser: aParser [ 
	^ self new parser: aParser
]

{ #category : #'parser interface' }
LwsAstBuilder >> abort: names [
	| e |
	e := LwsAbortStatement new.
	e taskNames: names.
	names do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> abs: expr [
	| e |
	e := LwsAbsExpression new right: expr.
	expr context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> abstractSubprogram: sub [
	sub isAbstract: true.
	^sub
]

{ #category : #'parser interface' }
LwsAstBuilder >> accept: ident formalPart: formalPart statements: statements  handlers: handlers [
	| e |
	e := LwsAcceptStatement new.
	e entryName: ident.
	ident context: e.
	formalPart = self noFormalPart 
		ifFalse: [ e parameters: formalPart.
			formalPart do: [ :f | f context: e ] ].
	e statements: statements.
	statements do: [ :d | d context: e ].
	handlers = self noHandler
		ifFalse: [ 
			e handlers: handlers.
			handlers do: [ :d | d context: e ] ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> acceptAlternative: acceptStmt statements: stmts [
	| e |
	e := LwsAcceptAlternative new.
	stmts = self noStatement
		ifTrue: [ e statements: OrderedCollection new ]
		ifFalse: [ e statements: stmts].
	e statements addFirst: acceptStmt.
	e statements do: [ :s | s context: e ].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> access [
	^ LwsAccessAttribute new
]

{ #category : #'parser interface' }
LwsAstBuilder >> accessMode [
	^ #accessMode
]

{ #category : #'parser interface' }
LwsAstBuilder >> accessToObject: subtypeInd accessMode: accessMode [
	| e |
	e := LwsAccessToObject new.
	e subtypeIndication: subtypeInd.
	subtypeInd context: e.
	accessMode = self noAccessMode
		ifFalse: [ e accessMode: accessMode first].
	^e 
]

{ #category : #'parser interface' }
LwsAstBuilder >> accessToSubprogram: formalPart accessMode:  accessMode return: returnOpt [
	| e |
	e := LwsAccessToSubprogram new.
	returnOpt = self noReturn
		ifFalse: [ 
			e returnType: returnOpt.
			returnOpt context: e ].
	formalPart = self noFormalPart
		ifFalse: [  
			e parameters: formalPart.
			formalPart do: [ :f | f context: e ] ].
	accessMode = self noAccessMode
		ifFalse: [ e accessMode: accessMode first].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> addressSpecFor: name useAt: expr [
	| e |
	e := LwsAddressRepresentation new.
	e name: name.
	name context: e.
	e useAt: expr.
	expr context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> aggregate: aList [
	| e |
	e := LwsAggregate new elements: aList.
	aList do: [ :c | c context: e ].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> aliasedConstantQualifier [
	^ #aliasedConstantQualifier
]

{ #category : #'parser interface' }
LwsAstBuilder >> aliasedOpt: aliasOp subtypeInd: subTypeInd [
	| e |
	e := LwsComponentSubtype new.
	e isAliased: aliasOp ~= self noAlias.
	e definition: subTypeInd.
	subTypeInd context: e.
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> aliasedQualifier [
	^ #aliasedQualifier
]

{ #category : #'parser interface' }
LwsAstBuilder >> alignAtMod: expr [
	^ expr
]

{ #category : #'parser interface' }
LwsAstBuilder >> allSelector [
	| s |
	s := LwsAllSelector new.
	^ s
]

{ #category : #'parser interface' }
LwsAstBuilder >> anyExpression [
	^ LwsAnyExpression new
]

{ #category : #'parser interface' }
LwsAstBuilder >> anyRangeType [
	^ LwsAnyRangeType new
]

{ #category : #'parser interface' }
LwsAstBuilder >> anyType [
	^ LwsAnyType new
]

{ #category : #'parser interface' }
LwsAstBuilder >> arrayTypeIndexes: indexes of: componentSubtype [
	| e |
	e := LwsArrayType new.
	e indexes: indexes.
	indexes do: [ :i | i context: e ].
	e componentType: componentSubtype.
	componentSubtype context: e.
	^ e 
]

{ #category : #'parser interface' }
LwsAstBuilder >> assign: aValue to: leftPart [ 
	| e |
	e := LwsAssignment new.
	aValue context: e.
	leftPart context: e.
	e variableName: leftPart.
	e expression: aValue.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> asyncSelect: delayOrEntryCall statements: statements thenAbortStatements: abortStatements [
	| e |
	e := LwsAsynchronousSelect new.
	statements = self noStatement 
		ifTrue: [ e statements: OrderedCollection new ]
		ifFalse: [e statements: statements].
	e statements addFirst: delayOrEntryCall.
	e statements do: [ :s | s context: e ].
	abortStatements = self noStatement 
		ifTrue: [ e abortStatements: OrderedCollection new ]
		ifFalse: [e abortStatements: abortStatements].
	e abortStatements do: [ :s | s context: e ].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> attributeDefFor: name use: use [
	| e |
	e := LwsAttributeRepresentation new.
	e name: name.
	name context: e.
	e useExpression: use.
	use context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> basedLiteral: aBased [
	^ LwsBasedLiteral new parsedString: aBased value
]

{ #category : #'parser interface' }
LwsAstBuilder >> blockBodyStatements: statements  exceptionHandlers: handlers [
	| e |
	e := LwsBlockBody new.
	e statements: statements.
	statements do: [ :s | s context: e ].
	handlers = self noHandler
		ifFalse: [ e handlers: handlers.
			handlers do: [ :h | h context: e ] ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> case: expr alternatives: alternatives [
	| e |
	e := LwsCaseStatement new.
	e selector: expr.
	e alternatives: alternatives.
	expr context: e.
	alternatives do: [ :c | c context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> charSelector: aSelector [
	| s |
	s := LwsCharacterSelector new.
	s parsedString: aSelector asString.
	^ s
]

{ #category : #'parser interface' }
LwsAstBuilder >> characterEnumerationId: aChar [
	^ LwsCharacterEnumerationId  new element: aChar
]

{ #category : #'parser interface' }
LwsAstBuilder >> characterLiteral: char [ 
	^ LwsCharacterLiteral new parsedString: char
]

{ #category : #'parser interface' }
LwsAstBuilder >> code: aQualified [
	| e |
	e := LwsCodeStatement new.
	e code: aQualified.
	aQualified context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> componentAssociationChoices: choices expression: expression [ 
	| e |
	e := LwsComponentAssociation new choices: choices.
	choices do: [ :c | c context: e ].
	e expression: expression.
	expression context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> componentDecls: compDecls variantPartOpt: variantPartOpt [
	| e |
	e := LwsRecordDefinition new.
	compDecls = self noComponent
		ifFalse: [ 
			e elements: compDecls.
			compDecls do: [ :c | c context: e ] ].
	variantPartOpt  = self noVariantPart
		ifFalse: [  
			e variantPart: variantPartOpt.
			variantPartOpt context: e].
	^ e.

]

{ #category : #'parser interface' }
LwsAstBuilder >> componentIdentifiers: names compSubtypeDef: subtypeDef initOpt: initOpt [
	| e |
	e := LwsComponentAttribute new.
	e names: names.
	e domain: subtypeDef.
	subtypeDef context: e.
	initOpt = self noInit
		ifFalse: [ 
			e initialization: initOpt.
			initOpt context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> componentLocationName: name at: expr range: range [
	| e |
	e := LwsComponentLocation new.
	e name: name.
	name context: e.
	e at: expr.
	expr context: e.
	e range: range.
	range context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> compoundName: aName [ 
	| e |
	e := LwsCompoundName new.
	e elements add: aName.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> compoundName: aCompoundName suffix: aName [
	aCompoundName elements add: aName.
	^ aCompoundName
]

{ #category : #'parser interface' }
LwsAstBuilder >> compoundStatement: aStmt [
	^ aStmt
]

{ #category : #'parser interface' }
LwsAstBuilder >> conditionalEntryCall: entryCall statements: statements else: elseStatements [
	| e |
	e := LwsConditionalEntryCall new.
	statements = self noStatement 
		ifTrue: [ e statements: OrderedCollection new ]
		ifFalse: [e statements: statements].
	e statements addFirst: entryCall.
	e statements do: [ :s | s context: e ].
	e elseStatements: elseStatements.
	elseStatements do: [ :s | s context: e ].
	^e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> constantQualifier [
	^ #constantQualifier

]

{ #category : #'parser interface' }
LwsAstBuilder >> decimalDigitConstraintExpression: expression rangeConstraintOpt: rangeConstraintOpt [
	| e |
	e := LwsDigitsConstraint new.
	e expression: expression.
	expression context: e.
	rangeConstraintOpt = self noRangeConstraint
		ifFalse: [ 
			e rangeConstraint: rangeConstraintOpt.
			rangeConstraintOpt context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> decimalLiteral: aDecimal [
	^ LwsDecimalLiteral new parsedString: aDecimal value
]

{ #category : #'parser interface' }
LwsAstBuilder >> declPart: decls [
	^ self withoutPragma: decls
]

{ #category : #'parser interface' }
LwsAstBuilder >> delay: expr [
	| e |
	e := LwsDelayStatement new.
	e delay: expr.
	expr context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> delayAlternative: delayStmt statements: stmts [
	| e |
	e := LwsDelayAlternative new.
	stmts = self noStatement
		ifTrue: [ e statements: OrderedCollection new ]
		ifFalse: [ e statements: stmts].
	e statements addFirst: delayStmt.
	e statements do: [ :s | s context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> delayUntil: expr [
	| e |
	e := LwsDelayUntilStatement new.
	e delay: expr.
	expr context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> delta [
	^ LwsDeltaAttribute new
]

{ #category : #'parser interface' }
LwsAstBuilder >> deltaExpression: deltaExpression digits: digitsExpression rangeSpecOpt: aRangeSpec [
	| e |
	e := LwsDecimalFixedType new.
	e delta: deltaExpression.
	deltaExpression context: e.
	e digits: digitsExpression.
	digitsExpression context: e.
	aRangeSpec = self noRangeSpec
		ifFalse: [ 
			e range: aRangeSpec.
			aRangeSpec context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> deltaExpression: anExpression rangeSpecOpt: aRangeSpec [
	| e |
	e := LwsOrdinaryFixedType new.
	e delta: anExpression.
	anExpression context: e.
	aRangeSpec = self noRangeSpec
		ifFalse: [ 
			e range: aRangeSpec.
			aRangeSpec context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> digits [
	^ LwsDigitsAttribute new
]

{ #category : #'parser interface' }
LwsAstBuilder >> digitsExpression: anExpression rangeSpecOpt: aRangeSpec [
	| e |
	e := LwsFloatingType new.
	e digits: anExpression.
	anExpression context: e.
	aRangeSpec = self noRangeSpec
		ifFalse: [ 
			e range: aRangeSpec.
			aRangeSpec context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> discreteRangeName: aName constraintOpt: rangeConstraint [
	| e |
	e := LwsDiscreteRange new.
	e identifier: aName.
	aName context: e.
	rangeConstraint = self noRangeConstraint
		ifFalse: [ 
			e rangeConstraint: rangeConstraint.
			rangeConstraint context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> discrimPart: discrimPart [
	| e |
	e := LwsDiscriminantSpecification new.
	e elements: discrimPart.
	discrimPart do: [ :d | d context: e ].
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> discrimSpecIdentifiers: names accessOpt: accessOpt mark: mark initOpt: initOpt [
	| e |
	e := LwsDiscriminantAttribute new.
	e names: names.
	e isAccess: accessOpt ~= self noAccess.
	e domainName: mark.
	mark context: e.
	initOpt = self noInit 
		ifFalse: [ e initialization: initOpt].
	^ e
	
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> discrimSpecs: discrimSpecs [
	^ discrimSpecs
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryBodyDeclPart: declarations blockBody: body [
	| e |
	e := LwsEntryBodyPart new.
	declarations = self noDeclPart
		ifFalse: [ 
			e locals: declarations.
			declarations do: [ :d | d context: e ] ].
	e blockBody: body.
	body context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryBodyName: name iteration: iterOpt formalPart: formalPartOpt when: when body: bodyOpt [
	| e |
	e := LwsEntryBody new.
	e name: name.
	iterOpt = self noIteration
		ifFalse: [ 
			e iteration: iterOpt.
			iterOpt context: e ].
	formalPartOpt = self noFormalPart
		ifFalse: [ 
			e parameters: formalPartOpt.
			formalPartOpt do: [ :f | f context: e ] ].
	e whenCondition: when.
	when context: e.
	bodyOpt = self noEntryBody
		ifFalse: [ 
			e body: bodyOpt.
			bodyOpt context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryCall: aName [
	| e |
	e := LwsEntryCall new.
	aName context: e.
	e name: aName.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryDecl: name discreteRange: range formalPart: formalParts [
	| e |
	e := LwsEntryDeclaration new.
	e name: name.
	range = self noDiscreteRange
		ifFalse: [ e range: range.
			range context: e ].
	formalParts = self noFormalPart 
		ifFalse: [ e parameters: formalParts.
			formalParts do: [ :r | r context: e ] ].
	^ e
		
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryIterationPartName: aName range: aRange [
	| e |
	e := LwsEntryIteration new.
	e name: aName.
	e range: aRange.
	aRange context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryName: aToken [
	^ LwsQualifiedIdentifier new
			name: aToken value ;
			startPosition: aToken startPosition ;
			yourself
]

{ #category : #'parser interface' }
LwsAstBuilder >> entryName: aName argument: arg [
	| n |
	n := LwsEntryNameArgument new argument: arg; yourself.
	aName qualifiers add: n.
	n context: aName.
	arg context: n.
	^aName

]

{ #category : #'parser interface' }
LwsAstBuilder >> enumerationTypeElements: elements [
	| e |
	e := LwsEnumerationType new elements: elements.
	elements do: [ :el | el context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> exceptionHandler: handlers [
	^ handlers
]

{ #category : #'parser interface' }
LwsAstBuilder >> exceptionHandler: identifier choices: choices statements: stmts [
	| e |
	e := LwsExceptionHandler new.
	identifier = self noIdentifier
		ifFalse: [ e name: identifier ].
	e choices: choices.
	e statements: stmts.
	choices do: [ :c | c context: e ].
	stmts do: [ :c | c context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> exceptionNames: names [
	| e |
	e := LwsExceptionDeclaration  new.
	e names: names.
	^e 
]

{ #category : #'parser interface' }
LwsAstBuilder >> exceptionNames: names renames: oldName [
	| e decl |
	e := LwsExceptionRenamingDeclaration new.
	decl := self exceptionNames: names.
	e newDeclaration: decl.
	decl context: e.
	e renamedEntityName: oldName.
	oldName context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> exit: aName whenOpt: condition [
	| e |
	e := LwsExitStatement new.
	aName = self noName
		ifFalse: [ 
			e name: aName.
			aName context: e ].
	condition = self noCondition
		ifFalse: [ 
			e when: condition.
			condition context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: expression adding: addingOp term: arg [
	| e |
	e := addingOp = self plus
		ifTrue: [ LwsPlusExpression new ]
		ifFalse: [ addingOp = self substract  
			ifTrue: [ LwsMinusExpression new ]
			ifFalse: [ LwsCatenationExpression new ] ].
	e left: expression.
	e right: arg.
	expression context: e.
	arg context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: expression logical: logical relation: relation [
	| e |
	e := logical = self and
		ifTrue: [ LwsAndExpression new ]
		ifFalse: [ logical = self or 
			ifTrue: [ LwsOrExpression new ]
			ifFalse: [  LwsXorExpression new ] ].
	e left: expression.
	e right: relation.
	expression context: e.
	relation context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: expression memberShip: op expression: arg [
	| e |
	e := op = self in
		ifTrue: [ LwsMembershipExpression new included: true ]
		ifFalse: [ LwsMembershipExpression new included: false ].
	e left: expression.
	e right: arg.
	expression context: e.
	arg context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: expression relational: op expression: arg [
	| e |
	e := op = self equal
		ifTrue: [ LwsEqualExpression new ]
		ifFalse: [ op = self nonEqual
			ifTrue: [ LwsNotEqualExpression new ]
			ifFalse: [ op = self lessThan
				ifTrue: [ LwsLessThanExpression new ]
				ifFalse: [ op = self lessThanOrEqual
					ifTrue: [ LwsLessEqualExpression new ]
					ifFalse: [ op = self greaterThan
						ifTrue: [ LwsGreaterThanExpression new ]
						ifFalse: [ LwsGreaterEqualExpression new ]]]]].
	e left: expression.
	e right: arg.
	expression context: e.
	arg context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: expression shortCircuit: op relation: relation [
	| e |
	e := op = self andThen
		ifTrue: [ LwsAndThenExpression new ]
		ifFalse: [ LwsOrElseExpression new ].
	e left: expression.
	e right: relation.
	expression context: e.
	relation context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expression: arg withIndexList: indexList [
	| e |
	e := LwsIndexedAggregate new.
	arg = self noExpression
		ifFalse: [ 
			arg context: e.
			e base: arg ].
	(indexList isKindOf: LwsNullRecordType)
		ifFalse: [ 
			indexList
				do: [ :i | 
					i context: e.
					e indexes: indexList ] ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> expressionChoice: aChoice [
	| e |
	e := LwsExpressionChoice new expression: aChoice.
	aChoice context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> fixedType: aFixedType [
	^  aFixedType
]

{ #category : #'parser interface' }
LwsAstBuilder >> for: ident reverseOpt: reverse in: discreteRange [
	| e |
	e := LwsMembershipIteration new.
	e identifier: ident.
	reverse = self noReverse 
		ifFalse: [ e reverse: true ].
	e range: discreteRange.
	discreteRange context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> functionSpecName: name [ 
	| e |
	e := (name isKindOf: LwsStringDesignator)
		ifTrue: [ LwsOperatorOverloadDeclaration new ]
		ifFalse: [ LwsFunctionDeclaration new ].
	e name: name.
	name context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> functionSpecName: name formalPartOpt: formalPart return: ret [
	| e |
	e := (name isKindOf: LwsStringDesignator)
		ifTrue: [ LwsOperatorOverloadDeclaration new ]
		ifFalse: [ LwsFunctionDeclaration new ].
	e name: name.
	name context: e.
	formalPart = self noFormalPart
		ifFalse: [ 
			e parameters: formalPart.
			formalPart do: [ :f | f context: e ] ].
	e returnType: ret.
	ret context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericDiscriminant [
	^ LwsGenericDiscriminant new
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericFormalParameter: aFormalParameter [
	| e |
	e := LwsGenericFormalParameter new base: aFormalParameter.
	aFormalParameter context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericFormalPart: formalPart packageSpec: pkgSpec [
	| e |
	e := LwsGenericPackageDeclaration new.
	e formalPart: formalPart.
	formalPart do: [ :f | f context: e ].
	e declaration: pkgSpec.
	pkgSpec context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericFormalPart: formalPart subProcSpec: subProg [
	| e |
	e := LwsGenericSubprogramDeclaration new.
	e formalPart: formalPart.
	formalPart do: [ :f | f context: e ].
	e declaration: subProg.
	subProg context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericFunction: aFuncSpec default: subpDefault [
	| e |
	e := LwsGenericFormalFunction new.
	e base: aFuncSpec.
	aFuncSpec context: e.
	subpDefault = self noGenericSubprogramDefault
		ifFalse: [ 
			e subpDefault: subpDefault.
			subpDefault context: e].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericPackage: name isNew: isName arg: boxOrNoBox [
	| e |
	e := LwsGenericFormalPackage new.
	e name: name.
	e isNewName: isName.
	isName context: e.
	e boxArgument: boxOrNoBox = self box.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericPackageInstanciation: pkgSpec isNew: aName [
	| e |
	e := LwsGenericPackageInstanciation new.
	e name: aName.
	aName context: e.
	e packageDeclaration: pkgSpec.
	pkgSpec context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericProcedure: aProcSpec default: subpDefault [
	| e |
	e := LwsGenericFormalProcedure new.
	e base: aProcSpec.
	aProcSpec context: e.
	subpDefault = self noGenericSubprogramDefault
		ifFalse: [ 
			e subpDefault: subpDefault.
			subpDefault context: e].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericSubprogramDefault: aNameOrBox [
	| e |
	e := LwsGenericSubprogramDefault new.
	e default: aNameOrBox.
	aNameOrBox context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericType: aTypeSpec [
	| e |
	e := LwsGenericFormalType new base: aTypeSpec.
	aTypeSpec context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> genericUseClause: aUseClause [
	| e |
	e := LwsGenericFormalUseClause new.
	e  base: aUseClause.
	aUseClause context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> goto: label [
	| e |
	e := LwsGotoStatement new.
	e targetLabel: label.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> identifier: aToken [ 
	^ LwsQualifiedIdentifier new
			name: aToken value ;
			startPosition: aToken startPosition ;
			yourself
]

{ #category : #'parser interface' }
LwsAstBuilder >> identifierAttribute: aName [
	| e |
	e := LwsNamedAttribute new.
	e parsedString: aName.
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> if: conditions else: elseOpt [
	| e |
	e := LwsIfStatement new.
	e ifClauses: conditions.
	conditions do: [ :c | c context: e ].
	elseOpt = self noElse
		ifFalse: [ 
			elseOpt do: [ :c | c context: e ].
			e elseClause: elseOpt ].
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> ifCondition: condition statements: statements [
	| e |
	e := LwsIfClause new.
	e condition: condition.
	e statements: statements.
	condition context: e.
	statements do: [ :s | s context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> inMode [
	^ #inputMode
]

{ #category : #'parser interface' }
LwsAstBuilder >> inOutMode [
	^ #inputOutputMode
]

{ #category : #'parser interface' }
LwsAstBuilder >> index: aName [ 
	| e |
	e := LwsIndex new.
	e typeMark: aName.
	aName context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> integerTypeModSpec: anExpression [
	| e |
	e := LwsModIntegerType new.
	e modu: anExpression.
	anExpression context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> integerTypeRangeSpec: aRange [
	| e |
	e := LwsRangeIntegerType new.
	e range: aRange.
	aRange context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> label:  label [ 
	^ label
]

{ #category : #'parser interface' }
LwsAstBuilder >> labelOpt: lbl declare: decl body: aBlockBody [
	| e |
	e := LwsBlockStatement new.
	lbl = self noLabel
		ifFalse: [ e stamp: lbl ].
	decl = self noBlockDecl
		ifFalse: [ 
			decl = self noDeclPart
				ifFalse: [ 
					e locals: decl.
					decl do: [ :d | d context: e ] ] ].
	e body: aBlockBody.
	aBlockBody context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> labelOpt: labOpt iteration: policy basicLoop: statements [
	| e |
	e := LwsLoopStatement new.
	labOpt = self noLabel
		ifFalse: [ e stamp: labOpt ].
	policy = self noIteration
		ifFalse: [ 
			e policy: policy.
			policy context: e ].
	e statements: statements.
	statements do: [ :s | s context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> labels:  labels statement: statement [
	statement labels: labels.
	^ statement
]

{ #category : #'parser interface' }
LwsAstBuilder >> name: aName attribute: anAttribute [
	aName qualifiers add: anAttribute.
	anAttribute context: aName.
	^ aName
]

{ #category : #'parser interface' }
LwsAstBuilder >> name: aName constraint: aConstraint [
	| e |
	e := LwsSubtypeIndication new.
	e name: aName.
	aName context: e.
	aConstraint = self noConstraint
		ifFalse: [ 
			e constraint: aConstraint.
			aConstraint context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> name: aName indexes: args [
	| n qualified |
	n := LwsArgumentsSelector new.
	n arguments: (self aggregate: args).
	n arguments context: n.
	self flag: 'function names may be strings, so we need to test aName. May be there is a better way to do it?'.
	qualified := (aName isKindOf: LwsStringLiteral)
						ifTrue: [ LwsQualifiedIdentifier new
										name: aName parsedString ;
										startPosition: aName startPosition ;
										yourself ]
						ifFalse: [ aName ].
	qualified qualifiers add: n.
	n context: qualified.
	^ qualified

]

{ #category : #'parser interface' }
LwsAstBuilder >> name: aName primary: anExpression [
	| s |
	s := LwsPrimaryQualifier new primary: anExpression.
	aName qualifiers add: s.
	s context: aName.
	anExpression context: s.
	^ aName
]

{ #category : #'parser interface' }
LwsAstBuilder >> namedExceptionChoice: aName [
	| e |
	e := LwsNamedExceptionChoice new.
	e identifier: aName.
	aName context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> newName: arg [
	| e |
	e := LwsAllocator new.
	e right: arg.
	arg context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> newSubtypeInd: aSubtypeInd with: privateOrRecordDef abstract: isAbstract [
	| e |
	e := LwsDerivedType new.
	e subtypeIndication: aSubtypeInd.
	aSubtypeInd context: e.
	(privateOrRecordDef ~= self noWithPrivate and: [ privateOrRecordDef ~= self withPrivate ])
		ifTrue: [ 
			e withRecord: privateOrRecordDef.
			privateOrRecordDef context: e ]
		ifFalse: [ 
			privateOrRecordDef = self withPrivate
				ifTrue: [ 
					e withRecord: LwsPrivateRecordType new.
					e withRecord context: e ] ].
	e isAbstract: isAbstract ~= self noAbstract.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> noVariantPartButPragmas: pragmas [
	^ pragmas
]

{ #category : #'parser interface' }
LwsAstBuilder >> not: expr [
	| e |
	e := LwsNotExpression new right: expr.
	expr context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> nullLiteral: parsedString [
	^ LwsNullLiteral new parsedString: parsedString
]

{ #category : #'parser interface' }
LwsAstBuilder >> nullRecord [
	| e |
	e := LwsNullRecordType new.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> nullStatement [
	^ LwsNullStatement  new
]

{ #category : #'parser interface' }
LwsAstBuilder >> numberDeclarationIdentifiers: names init: anExpression [ 
	| e |
	e := LwsNumberDeclaration new.
	e names: names.
	e initialization: anExpression.
	anExpression context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> objectNames: identifiers optQualifier: optQualifier subTypeDef: subTypeDef optInit: anExpression [
	| e |
	e := LwsObjectDeclaration new.
	e names: identifiers.
	optQualifier = self aliasedQualifier
		ifTrue: [ e isAliased: true ].
	optQualifier = self constantQualifier
		ifTrue: [ e isConstant: true ].
	optQualifier = self aliasedConstantQualifier
		ifTrue: [ 
			e isConstant: true.
			e isAliased: true ].
	e definition: subTypeDef.
	subTypeDef context: e.
	anExpression = self noInit
		ifFalse: [ 
			e initialization: anExpression.
			anExpression context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> objectNames: identifiers optQualifier: optQualifier subTypeDef: subTypeDef renames: oldName [
	| e decl |
	e := LwsObjectRenamingDeclaration new.
	decl := self objectNames: identifiers optQualifier: optQualifier subTypeDef: subTypeDef optInit: self noInit.
	e newDeclaration: decl.
	decl context: e.
	e renamedEntityName:  oldName.
	oldName context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> otherChoice [
	| e |
	e := LwsOtherChoice new.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> othersExceptionChoice [
	^ LwsOthersExceptionChoice new
]

{ #category : #'parser interface' }
LwsAstBuilder >> outMode [
	^ #outputMode
]

{ #category : #'parser interface' }
LwsAstBuilder >> package: name is: def [
	| e |
	e := LwsPackageDeclaration new.
	e name: name.
	name context: e.
	e definition: def.
	def context: e.
	^ e

]

{ #category : #'parser interface' }
LwsAstBuilder >> packageBody: name declPart: decl bodyOpt: bodyOpt [
	| e |
	e := LwsPackageBody new.
	e name: name.
	name context: e.
	decl = self noDeclPart 
		ifFalse: [ e locals: decl.
			decl do: [ :d | d context: e ] ].
	bodyOpt = self noBodyPart
		ifFalse: [ 
			e blockBody: bodyOpt.
			bodyOpt context: e].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> packageBodyStubName: name [
	| e |
	e := LwsPackageBodyStubDeclaration new.
	e name: name.
	e name context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> packageName: name renames: oldName genericFormalPart: genericFormalPart [
	| e  |
	e := LwsPackageRenamingDeclaration new.
	e newName: name.
	name context: e.
	e renamedEntityName: oldName.
	oldName context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> packagePart: entries [
	| e |
	e := LwsPackagePart new.
	e elements: (self withoutPragma: entries).
	entries do: [ :d | d context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> packagePublicPart: publicPart privatePart: privatePartOpt [
	| e |
	e := LwsPackageDefinition new.
	e publicPart: publicPart.
	publicPart context: e.
	privatePartOpt = self noPrivatePart
		ifFalse: [ 
			e privatePart: privatePartOpt.
			privatePartOpt context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> paramIdentifiers: idents mode: mode domainName: domainName init: init [
	| e |
	e := LwsFormalParameter new.
	e names: idents.
	mode = self noMode
		ifFalse: [ e mode: mode ].
	e domainName: domainName.
	domainName context: e.
	init = self noInit
		ifFalse: [ 
			e initialization: init.
			init context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> parenthesized: expression [
	expression parenthesis: true.
	^ expression

]

{ #category : #accessing }
LwsAstBuilder >> parser [
	^  parser 
]

{ #category : #accessing }
LwsAstBuilder >> parser: aParser [ 
	parser := aParser 
]

{ #category : #'parser interface' }
LwsAstBuilder >> parserResult: result [
	| e |
	e := LwsParsingResult new.
	e entities: (result isCollection ifTrue: [result] ifFalse: [OrderedCollection with: result]).
	e entities do: [ :n | n context: e].
	e tokens addAll: self scanner tokenList.
	^ e 
]

{ #category : #'parser interface' }
LwsAstBuilder >> pragma: name arguments: args [
	| e |
	e := LwsPragma new.
	e name: name.
	args = self noArgument
		ifTrue: [ e arguments: OrderedCollection new ]
		ifFalse: [ e arguments: args.
			args do: [ :a | a context: e ] ].
	self storePragma: e.
	^e
	
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> pragmaArgument: anExpression named: aName [
	| e |
	e := LwsPragmaArgument new.
	e argumentValue: anExpression.
	anExpression context: e.
	aName = self noName
		ifFalse: [ e name: aName ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> primary: lexpr expon: rexpr [
	| e |
	e := LwsExpoExpression new left: lexpr; right: rexpr.
	lexpr context: e.
	rexpr context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> privateProtectedPart: entries [
	| e |
	e := LwsProtectedUnitPrivatePart new.
	e entries: entries.
	entries do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> privateTypeTaggedOpt: taggedOpt limitedOpt: limitedOpt [
	| e |
	e := LwsPrivateTypeDefinition new.
	taggedOpt = self tagged
		ifTrue: [ e isTagged: true ].
	limitedOpt = self limited
		ifTrue: [ e isLimited: true ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> procedureCall: aName [
	| e |
	e := LwsProcedureCall new.
	aName context: e.
	e name: aName.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> procedureSpecName: name formalPartOpt: formalPart [
	| e |
	e := LwsProcedureDeclaration new.
	e name: name.
	name context: e.
	formalPart = self noFormalPart 
		ifFalse: [ e parameters: formalPart.
			formalPart do: [ :f | f context: e ]].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> protected: name is: def [
	| e |
	e := LwsProtectedUnitDeclaration new.
	e name: name.
	e definition: def.
	def context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> protectedBody: name elements: elements [
	| e |
	e := LwsProtectedUnitBody new.
	e name: name.
	e elements: elements.
	elements do: [ :l | l context: e ].
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> protectedElements: elements [
	^ self withoutPragma: elements 
]

{ #category : #'parser interface' }
LwsAstBuilder >> protectedPublicPart: publicPart privatePart: privatePartOpt [
	| e |
	e := LwsProtectedUnitDefinition new.
	e publicPart: publicPart.
	publicPart context: e.
	privatePartOpt = self noPrivatePart
		ifFalse: [ 
			e privatePart: privatePartOpt.
			privatePartOpt context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> protectedType: name discrimPart: discrim is: def [
	| e |
	e := LwsProtectedUnitTypeDeclaration new.
	e name: name.
	e definition: def.
	def context: e.
	discrim = self noDiscrimPart
		ifFalse: [ 
			e discriminant: discrim.
			discrim context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> protectedUnitBodyStubName: name [
	| e |
	e := LwsProtectedUnitBodyStubDeclaration new.
	e name: name.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> publicProtectedPart: entries [
	| e |
	e := LwsProtectedUnitPublicPart new.
	e entries: entries.
	entries do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> qualifiedName: aToken [ 
	^ LwsQualifiedIdentifier new
			name: aToken value ;
			startPosition: aToken startPosition ;
			yourself
]

{ #category : #'parser interface' }
LwsAstBuilder >> raise: aName [
	| e |
	e := LwsRaiseStatement new.
	aName = self noName
		ifFalse: [ 
			e name: aName.
			aName context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> rangeChoice: aChoice [
	| e |
	e := LwsRangeChoice new range: aChoice.
	aChoice context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> rangeConstraintRange: aRange [
	| e |
	e := LwsRangeConstraint new.
	e range: aRange.
	aRange context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> rangeFrom: expr1 to: expr2 [
	| e |
	e := LwsExplicitRange new start: expr1; stop: expr2; yourself. 
	expr1 context: e.
	expr2 context: e.
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> rangeNamed: aName argument: anExpression [
	| e |
	e := LwsNamedRange new name: aName.
	aName context: e.
	anExpression ifNotNil: [ 
		e argument: anExpression.
		anExpression context: e ].
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> rangeSpec: aRange [
	^ aRange
]

{ #category : #'parser interface' }
LwsAstBuilder >> recordComponents: compList [
	| e |
	e := LwsDefinedRecordType new.
	e definition: compList.
	compList context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> recordTypeSpecFor: name useRecordAlign: align compLocs: compLocs [
	| e |
	e := LwsRecordTypeRepresentation new.
	e name: name.
	name context: e.
	align = self noAlign
		ifFalse: [ 
			e align: align.
			align context: e ].
	e locations: compLocs.
	compLocs do: [ :c | c context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> recordTypeTaggedOpt: taggedOpt limitedOpt: limitedOpt recordDef: recordDef [
	| e |
	e := recordDef.
	taggedOpt = self tagged 
		ifTrue: [ e isTagged: true ].
	taggedOpt = self taggedAbstract
		ifTrue: [ e isTagged: true.
			e isAbstract: true ].
	limitedOpt = self limited
		ifTrue: [ e isLimited: true ].
	^e.
]

{ #category : #'parser interface' }
LwsAstBuilder >> requeue: aTaskName withAbort: abort [
	| e |
	e := LwsRequeueStatement new.
	e taskName: aTaskName.
	e withAbort: abort.
	aTaskName context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> return [
	^  LwsReturnStatement new
]

{ #category : #'parser interface' }
LwsAstBuilder >> return: expr [
	| e |
	e := LwsReturnStatement new.
	e result: expr.
	expr context: e.
	^ e
]

{ #category : #accessing }
LwsAstBuilder >> scanner [
	^ self parser scanner
]

{ #category : #'parser interface' }
LwsAstBuilder >> select: guardedSelect or: or else: else [
	| e |
	e := LwsSelectiveWaitStatement new.
	or addFirst: guardedSelect.
	e alternatives: or.
	or do: [ :s | s context: e ].
	else = self noElse
		ifTrue: [ e elseAlternative: OrderedCollection new ]
		ifFalse: [ e elseAlternative: else.
			else do: [ :s | s context: e ] ].
	^e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> selected: aName selector: aSelector [
	aName qualifiers add: aSelector.
	aSelector context: aName.
	^ aName
]

{ #category : #'parser interface' }
LwsAstBuilder >> separate: name body: body [
	| e |
	e := LwsSeparateBody new.
	e name: name.
	name context: e.
	e subunitBody: body.
	body context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> simpleExpression: expr [
	^ expr
]

{ #category : #'parser interface' }
LwsAstBuilder >> simpleIdentifier: aString [
	^ LwsSimpleIdentifier new name: aString
]

{ #category : #'parser interface' }
LwsAstBuilder >> simpleNameSelector: aSelector [
	| s |
	s := LwsNamedSelector new.
	s parsedString: aSelector.
	^ s
]

{ #category : #'parser interface' }
LwsAstBuilder >> simpleStatement: aStmt [
	^ aStmt
]

{ #category : #'parser interface' }
LwsAstBuilder >> statements: stmts [
	^ self withoutPragma: stmts
]

{ #category : #'parser interface' }
LwsAstBuilder >> statements: statements handlerPartOpt: handlers [
	^ {statements. handlers}
]

{ #category : #'scanner interface' }
LwsAstBuilder >> storePragma: aPragma [
	self scanner storePragma: aPragma
]

{ #category : #'parser interface' }
LwsAstBuilder >> stringAsName: aString [
	^ aString
]

{ #category : #'parser interface' }
LwsAstBuilder >> stringDesignator: name [
	^ LwsStringDesignator new name: name
]

{ #category : #'parser interface' }
LwsAstBuilder >> stringEnumerationId: aString [
	^ LwsStringEnumerationId new element: aString
]

{ #category : #'parser interface' }
LwsAstBuilder >> stringLiteral: string [
	^ LwsStringLiteral new parsedString: string
]

{ #category : #'parser interface' }
LwsAstBuilder >> stringSelector: aSelector [
	| s |
	s := LwsStringSelector new.
	s parsedString: aSelector.
	^ s
]

{ #category : #'parser interface' }
LwsAstBuilder >> subProgBodySpec: spec declPart: decl body: body [
	| e |
	e := LwsSubprogramBody new.
	e declaration: spec.
	spec context: e.
	decl = self noDeclPart
		ifFalse: [ 
	e locals: decl.
	decl do: [ :d | d context: e ]].
	e blockBody: body.
	body context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> subProgSpec: spec isNew: aName [
	| e |
	e := LwsGenericSubprogramInstanciation new.
	e name: aName.
	aName context: e.
	e subprogramDeclaration: spec.
	spec context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> subProgSpec: spec renames: oldName genericFormalPart: genericFormalPart [
	| e  |
	e := LwsSubprogramRenamingDeclaration new.
	e newDeclaration: spec.
	spec context: e.
	e renamedEntityName:  oldName.
	oldName context: e.
	^e
]

{ #category : #'parser interface' }
LwsAstBuilder >> subTypeInd: aSubtypeInd [ 
	^ aSubtypeInd
]

{ #category : #'parser interface' }
LwsAstBuilder >> subprogramBodyStubSpec: spec [
	| e |
	e := LwsSubprogramBodyStubDeclaration new.
	e declaration: spec.
	spec context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> subtypeIdentifier: aName subTypeInd: aSubTypeInd [
	| e |
	e := LwsSubtypeDeclaration new.
	e name: aName.
	e subtypeIndication: aSubTypeInd.
	aSubTypeInd context: e.
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> task: name is: taskDef [
	| e |
	e := LwsTaskDeclaration new.
	e name: name.
	taskDef = self noTaskDef 
		ifFalse: [ 
			e definition: taskDef.
			taskDef context: e].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> taskBody: name declPart: decl body: body [
	| e |
	e := LwsTaskBody new.
	e name: name.
	decl = self noDeclPart
		ifFalse: [ 
			e locals: decl.
			decl do: [ :d | d context: e ] ].
	e blockBody: body.
	body context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> taskBodyStubName: name [
	| e |
	e := LwsTaskBodyStubDeclaration new.
	e name:  name.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> taskEntries:  entries representations: representations [
	| e |
	e := LwsTaskPart new.
	e entries: entries.
	entries do: [ :n | n context: e ].	
	e representations: representations.
	representations do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> taskPublicPart: public privatePart: private [
	| e |
	e := LwsTaskDefinition new.
	e publicPart: public.
	public context: e.
	private = self noTaskPrivate
		ifFalse: [ 
			e privatePart: private.
			private context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> taskType: name discrimPart: discrim is: taskDef [
	| e |
	e := LwsTaskTypeDeclaration new.
	e name: name.
	e definition: taskDef.
	taskDef context: e.
	discrim = self noDiscrimPart
		ifFalse: [ 
			e discriminant: discrim.
			discrim context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> term: expr [
	^ expr
]

{ #category : #'parser interface' }
LwsAstBuilder >> term: term multiply: multiply factor: factor [
	| e |
	e := multiply = self mult
		ifTrue: [ LwsMultExpression new ]
		ifFalse: [ 
			multiply = self div
				ifTrue: [ LwsDivExpression new ]
				ifFalse: [ 
					multiply = self mod
						ifTrue: [ LwsModExpression new ]
						ifFalse: [ LwsRemExpression new ] ] ].
	e left: term.
	e right: factor.
	term context: e.
	factor context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> terminateAlternative [
	^ LwsTerminateAlternative new
]

{ #category : #'parser interface' }
LwsAstBuilder >> timedEntryCall: entryCall statements: statements orDelay: orDelay statements: orStatements [
	| e |
	e := LwsTimedEntryCall new.
	statements = self noStatement 
		ifTrue: [ e statements: OrderedCollection new ]
		ifFalse: [e statements: statements].
	e statements addFirst: entryCall.
	e statements do: [ :s | s context: e ].
	orStatements = self noStatement 
		ifTrue: [ e orStatements: OrderedCollection new ]
		ifFalse: [e orStatements: orStatements].
	e orStatements addFirst: orDelay.
	e orStatements do: [ :s | s context: e ].
	^e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> typeIdentifier: aName discrimPartOpt: discrimPartOpt completion: completion [
	| e |
	completion = self noTypeCompletion
		ifTrue: [ e := LwsIncompleteTypeDeclaration new ]
		ifFalse: [ 
			(completion isKindOf: LwsPrivateTypeDefinition)
				ifTrue: [ e := LwsPrivateTypeDeclaration new ]
				ifFalse: [ e := LwsFullTypeDeclaration new ].
			e typeDefinition: completion.
			completion context: e ].
	discrimPartOpt = self noDiscrimPart
		ifFalse: [ 
			e discriminant: discrimPartOpt.
			discrimPartOpt context: e ].
	e name: aName.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> unary: op term: arg [ 
	| e |
	e := self unaryPlus = op
		ifTrue: [ LwsPositiveExpression new ]
		ifFalse: [ LwsNegativeExpression new ].
	e right: arg.
	arg context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> unit: unit private: private interfaces: interfaces [
	| e |
	e := LwsUnit new.
	e isPrivate: private ~= self noPrivate.
	e element: unit.
	unit context: e.
	interfaces = self noInterface
		ifFalse: [ e interfaces: interfaces.
			interfaces do: [ :c | c context: e ] ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> useClauseNames: names [ 
	| e |
	e := LwsUseClause new.
	e names: names.
	names do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> useTypesClauseNames: names [ 
	| e |
	e := LwsUseTypeClause new.
	e names: names.
	names do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> variantPartCase: name elements: variants [
	| e |
	e := LwsVariantRecordPart new.
	e caseIdentifier: name.
	name context: e.
	e elements: variants.
	variants do: [ :v | v context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> variantPartElementWhen: choices componentList: compList [
	| e |
	e := LwsVariantComponentAttribute new.
	e choices: choices.
	choices do: [ :c | c context: e ].
	e record: compList.
	compList context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> when: cond do: stmts [
	| e |
	e := LwsCaseAlternative new.
	e choices: cond.
	e statements: stmts.
	cond do: [ :c | c context: e ].
	stmts do: [ :c | c context: e ].
	^ e
	
]

{ #category : #'parser interface' }
LwsAstBuilder >> when: cond select: selectAlt [
	selectAlt when: cond.
	cond context: selectAlt.
	^selectAlt
]

{ #category : #'parser interface' }
LwsAstBuilder >> while: expr [
	| e |
	e := LwsWhileIteration new.
	e condition: expr.
	expr context: e.
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> withClause: with useClauses: uses [
	| e |
	e := LwsUnitInterface new.
	e withClause: with.
	with context: e.
	e useClauses: uses.
	uses do: [ :u | u context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> withClauseNames: names [ 
	| e |
	e := LwsWithClause new.
	e names: names.
	names do: [ :n | n context: e ].
	^ e
]

{ #category : #'parser interface' }
LwsAstBuilder >> withoutPragma: collection [
	^ collection reject: [ :e | e isKindOf: LwsPragma ]
]
