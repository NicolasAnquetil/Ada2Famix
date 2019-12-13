Class {
	#name : #LewisAbstractVisitor,
	#superclass : #Object,
	#category : #'Lewis-Visitors'
}

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitAbortStatement: anAbortStatement [
	<generatedByPlatypus>
	anAbortStatement taskNames ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAbsExpression: anAbsExpression [
	<generatedByPlatypus>
	self visitSimpleUnaryExpression: anAbsExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAbstractAggregate: anAbstractAggregate [
	<generatedByPlatypus>
	self visitUnaryExpression: anAbstractAggregate
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitAcceptAlternative: anAcceptAlternative [
	<generatedByPlatypus>
	anAcceptAlternative statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitAcceptStatement: anAcceptStatement [
	<generatedByPlatypus>
	anAcceptStatement entryName ifNotNil: [ :a | a accept: self ].
	anAcceptStatement parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anAcceptStatement statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anAcceptStatement handlers ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAccessAttribute: anAccessAttribute [
	<generatedByPlatypus>
	self visitQualifier: anAccessAttribute
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAccessToObject: anAccessToObject [
	<generatedByPlatypus>
	anAccessToObject subtypeIndication ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAccessToSubprogram: anAccessToSubprogram [
	<generatedByPlatypus>
	anAccessToSubprogram parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anAccessToSubprogram returnType ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAccessType: anAccessType [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAddressRepresentation: anAddressRepresentation [
	<generatedByPlatypus>
	anAddressRepresentation name ifNotNil: [ :a | a accept: self ].
	anAddressRepresentation useAt ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAggregate: anAggregate [
	<generatedByPlatypus>
	anAggregate elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAllSelector: anAllSelector [
	<generatedByPlatypus>
	self visitQualifier: anAllSelector
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAllocator: anAllocator [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAndExpression: anAndExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: anAndExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAndThenExpression: anAndThenExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: anAndThenExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitAnyExpression: anAnyExpression [
	<generatedByPlatypus>
	self visitExpression: anAnyExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAnyFixed: anAnyFixed [
	<generatedByPlatypus>
	self visitScalarType: anAnyFixed
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAnyInteger: anAnyInteger [
	<generatedByPlatypus>
	self visitScalarType: anAnyInteger
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAnyRangeType: anAnyRangeType [
	<generatedByPlatypus>
	self visitAnyType: anAnyRangeType
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAnyType: anAnyType [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitArgumentsSelector: anArgumentsSelector [
	<generatedByPlatypus>
	anArgumentsSelector arguments ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitArithmeticExpression: anArithmeticExpression [
	<generatedByPlatypus>
	self visitBinaryExpression: anArithmeticExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitArrayType: anArrayType [
	<generatedByPlatypus>
	anArrayType indexes ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anArrayType componentType ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitAssignToken: anAssignToken [
	<generatedByPlatypus>
	self visitOperatorToken: anAssignToken
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitAssignment: anAssignment [
	<generatedByPlatypus>
	anAssignment variableName ifNotNil: [ :a | a accept: self ].
	anAssignment expression ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitAsynchronousSelect: anAsynchronousSelect [
	<generatedByPlatypus>
	anAsynchronousSelect statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anAsynchronousSelect abortStatements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitAttributeRepresentation: anAttributeRepresentation [
	<generatedByPlatypus>
	anAttributeRepresentation name ifNotNil: [ :a | a accept: self ].
	anAttributeRepresentation useExpression ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitBasedLiteral: aBasedLiteral [
	<generatedByPlatypus>
	self visitNumericLiteral: aBasedLiteral
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitBasicDeclaration: aBasicDeclaration [
	<generatedByPlatypus>
	self visitEntity: aBasicDeclaration
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitBinaryExpression: aBinaryExpression [
	<generatedByPlatypus>
	aBinaryExpression left ifNotNil: [ :a | a accept: self ].
	aBinaryExpression right ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitBlankToken: aBlankToken [
	<generatedByPlatypus>
	self visitDelimToken: aBlankToken
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitBlockBody: aBlockBody [
	<generatedByPlatypus>
	aBlockBody statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aBlockBody handlers ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitBlockStatement: aBlockStatement [
	<generatedByPlatypus>
	aBlockStatement locals ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aBlockStatement body ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitBody: aBody [
	<generatedByPlatypus>
	self visitEntity: aBody
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitBodyStubDeclaration: aBodyStubDeclaration [
	<generatedByPlatypus>
	self visitBasicDeclaration: aBodyStubDeclaration
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitBodyWithLocals: aBodyWithLocals [
	<generatedByPlatypus>
	aBodyWithLocals locals ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitBooleanValueToken: aBooleanValueToken [
	<generatedByPlatypus>
	self visitValueToken: aBooleanValueToken
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitBuiltinTypeToken: aBuiltinTypeToken [
	<generatedByPlatypus>
	self visitKeywordToken: aBuiltinTypeToken
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitCaseAlternative: aCaseAlternative [
	<generatedByPlatypus>
	aCaseAlternative choices ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aCaseAlternative statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitCaseStatement: aCaseStatement [
	<generatedByPlatypus>
	aCaseStatement selector ifNotNil: [ :a | a accept: self ].
	aCaseStatement alternatives ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitCatenationExpression: aCatenationExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aCatenationExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitCharacterEnumerationId: aCharacterEnumerationId [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitCharacterLiteral: aCharacterLiteral [
	<generatedByPlatypus>
	self visitValueLiteral: aCharacterLiteral
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitCharacterSelector: aCharacterSelector [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitCharacterValueToken: aCharacterValueToken [
	<generatedByPlatypus>
	self visitValueToken: aCharacterValueToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitChoice: aChoice [
	<generatedByPlatypus>
	self visitEntity: aChoice
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitCodeStatement: aCodeStatement [
	<generatedByPlatypus>
	aCodeStatement code ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitCommentToken: aCommentToken [
	<generatedByPlatypus>
	self visitToken: aCommentToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitComponentAssociation: aComponentAssociation [
	<generatedByPlatypus>
	aComponentAssociation expression ifNotNil: [ :a | a accept: self ].
	aComponentAssociation choices ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitComponentAttribute: aComponentAttribute [
	<generatedByPlatypus>
	aComponentAttribute domain ifNotNil: [ :a | a accept: self ].
	aComponentAttribute initialization ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitComponentLocation: aComponentLocation [
	<generatedByPlatypus>
	aComponentLocation name ifNotNil: [ :a | a accept: self ].
	aComponentLocation at ifNotNil: [ :a | a accept: self ].
	aComponentLocation range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitComponentSubtype: aComponentSubtype [
	<generatedByPlatypus>
	aComponentSubtype definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitCompositeType: aCompositeType [
	<generatedByPlatypus>
	self visitTypeDefinition: aCompositeType
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitCompoundName: aCompoundName [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitCompoundStatement: aCompoundStatement [
	<generatedByPlatypus>
	self visitStatement: aCompoundStatement
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitConditionalEntryCall: aConditionalEntryCall [
	<generatedByPlatypus>
	aConditionalEntryCall statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aConditionalEntryCall elseStatements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitConstantLiteral: aConstantLiteral [
	<generatedByPlatypus>
	self visitLiteral: aConstantLiteral
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitConstraint: aConstraint [
	<generatedByPlatypus>
	self visitEntity: aConstraint
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDecimalFixedType: aDecimalFixedType [
	<generatedByPlatypus>
	aDecimalFixedType digits ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDecimalLiteral: aDecimalLiteral [
	<generatedByPlatypus>
	self visitNumericLiteral: aDecimalLiteral
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDefinedRecordType: aDefinedRecordType [
	<generatedByPlatypus>
	aDefinedRecordType definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitDelayAlternative: aDelayAlternative [
	<generatedByPlatypus>
	aDelayAlternative statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitDelayStatement: aDelayStatement [
	<generatedByPlatypus>
	aDelayStatement delay ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitDelayUntilStatement: aDelayUntilStatement [
	<generatedByPlatypus>
	self visitDelayStatement: aDelayUntilStatement
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitDelimToken: aDelimToken [
	<generatedByPlatypus>
	self visitToken: aDelimToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDeltaAttribute: aDeltaAttribute [
	<generatedByPlatypus>
	self visitQualifier: aDeltaAttribute
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDerivedType: aDerivedType [
	<generatedByPlatypus>
	aDerivedType subtypeIndication ifNotNil: [ :a | a accept: self ].
	aDerivedType withRecord ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDigitsAttribute: aDigitsAttribute [
	<generatedByPlatypus>
	self visitQualifier: aDigitsAttribute
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDigitsConstraint: aDigitsConstraint [
	<generatedByPlatypus>
	aDigitsConstraint expression ifNotNil: [ :a | a accept: self ].
	aDigitsConstraint rangeConstraint ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDiscreteRange: aDiscreteRange [
	<generatedByPlatypus>
	aDiscreteRange identifier ifNotNil: [ :a | a accept: self ].
	aDiscreteRange rangeConstraint ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDiscreteType: aDiscreteType [
	<generatedByPlatypus>
	self visitScalarType: aDiscreteType
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDiscriminantAttribute: aDiscriminantAttribute [
	<generatedByPlatypus>
	aDiscriminantAttribute domainName ifNotNil: [ :a | a accept: self ].
	aDiscriminantAttribute initialization ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDiscriminantPart: aDiscriminantPart [
	<generatedByPlatypus>
	self visitEntity: aDiscriminantPart
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitDiscriminantSpecification: aDiscriminantSpecification [
	<generatedByPlatypus>
	aDiscriminantSpecification elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitDivExpression: aDivExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aDivExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitElementRenamingDeclaration: anElementRenamingDeclaration [
	<generatedByPlatypus>
	anElementRenamingDeclaration newDeclaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitElementaryType: anElementaryType [
	<generatedByPlatypus>
	self visitTypeDefinition: anElementaryType
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitEntity: anEntity [
	<generatedByPlatypus>
	anEntity context ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitEntryBody: anEntryBody [
	<generatedByPlatypus>
	anEntryBody iteration ifNotNil: [ :a | a accept: self ].
	anEntryBody parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anEntryBody whenCondition ifNotNil: [ :a | a accept: self ].
	anEntryBody body ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitEntryBodyPart: anEntryBodyPart [
	<generatedByPlatypus>
	anEntryBodyPart locals ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anEntryBodyPart blockBody ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitEntryCall: anEntryCall [
	<generatedByPlatypus>
	anEntryCall name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitEntryDeclaration: anEntryDeclaration [
	<generatedByPlatypus>
	anEntryDeclaration range ifNotNil: [ :a | a accept: self ].
	anEntryDeclaration parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitEntryIteration: anEntryIteration [
	<generatedByPlatypus>
	anEntryIteration range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitEntryNameArgument: anEntryNameArgument [
	<generatedByPlatypus>
	anEntryNameArgument argument ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitEnumerationId: anEnumerationId [
	<generatedByPlatypus>
	self visitEntity: anEnumerationId
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitEnumerationType: anEnumerationType [
	<generatedByPlatypus>
	anEnumerationType elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitEofToken: anEofToken [
	<generatedByPlatypus>
	self visitToken: anEofToken
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitEolToken: anEolToken [
	<generatedByPlatypus>
	self visitBlankToken: anEolToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitEqualExpression: anEqualExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: anEqualExpression
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitExceptionChoice: anExceptionChoice [
	<generatedByPlatypus>
	self visitEntity: anExceptionChoice
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitExceptionDeclaration: anExceptionDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitExceptionHandler: anExceptionHandler [
	<generatedByPlatypus>
	anExceptionHandler choices ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anExceptionHandler statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitExceptionRenamingDeclaration: anExceptionRenamingDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitExitStatement: anExitStatement [
	<generatedByPlatypus>
	anExitStatement name ifNotNil: [ :a | a accept: self ].
	anExitStatement when ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitExplicitRange: anExplicitRange [
	<generatedByPlatypus>
	anExplicitRange start ifNotNil: [ :a | a accept: self ].
	anExplicitRange stop ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitExpoExpression: anExpoExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: anExpoExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitExpression: anExpression [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitExpressionChoice: anExpressionChoice [
	<generatedByPlatypus>
	anExpressionChoice expression ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitFalseConstant: aFalseConstant [
	<generatedByPlatypus>
	self visitLogicalLiteral: aFalseConstant
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitFixedType: aFixedType [
	<generatedByPlatypus>
	self visitRealType: aFixedType
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitFloatingType: aFloatingType [
	<generatedByPlatypus>
	aFloatingType digits ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitFormalParameter: aFormalParameter [
	<generatedByPlatypus>
	aFormalParameter domainName ifNotNil: [ :a | a accept: self ].
	aFormalParameter initialization ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitFullTypeDeclaration: aFullTypeDeclaration [
	<generatedByPlatypus>
	aFullTypeDeclaration typeDefinition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitFunctionDeclaration: aFunctionDeclaration [
	<generatedByPlatypus>
	aFunctionDeclaration name ifNotNil: [ :a | a accept: self ].
	aFunctionDeclaration returnType ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericDeclaration: aGenericDeclaration [
	<generatedByPlatypus>
	aGenericDeclaration formalPart ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aGenericDeclaration declaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericDiscriminant: aGenericDiscriminant [
	<generatedByPlatypus>
	self visitDiscriminantPart: aGenericDiscriminant
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalElement: aGenericFormalElement [
	<generatedByPlatypus>
	self visitEntity: aGenericFormalElement
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalFunction: aGenericFormalFunction [
	<generatedByPlatypus>
	
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalPackage: aGenericFormalPackage [
	<generatedByPlatypus>
	aGenericFormalPackage isNewName ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalParameter: aGenericFormalParameter [
	<generatedByPlatypus>
	aGenericFormalParameter base ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalProcedure: aGenericFormalProcedure [
	<generatedByPlatypus>
	
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalSubprogram: aGenericFormalSubprogram [
	<generatedByPlatypus>
	aGenericFormalSubprogram base ifNotNil: [ :a | a accept: self ].
	aGenericFormalSubprogram subpDefault ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalType: aGenericFormalType [
	<generatedByPlatypus>
	aGenericFormalType base ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericFormalUseClause: aGenericFormalUseClause [
	<generatedByPlatypus>
	aGenericFormalUseClause base ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericInstanciation: aGenericInstanciation [
	<generatedByPlatypus>
	aGenericInstanciation name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericPackageDeclaration: aGenericPackageDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericPackageInstanciation: aGenericPackageInstanciation [
	<generatedByPlatypus>
	aGenericPackageInstanciation packageDeclaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericSubprogramDeclaration: aGenericSubprogramDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericSubprogramDefault: aGenericSubprogramDefault [
	<generatedByPlatypus>
	aGenericSubprogramDefault default ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitGenericSubprogramInstanciation: aGenericSubprogramInstanciation [
	<generatedByPlatypus>
	aGenericSubprogramInstanciation subprogramDeclaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitGotoStatement: aGotoStatement [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitGreaterEqualExpression: aGreaterEqualExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: aGreaterEqualExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitGreaterThanExpression: aGreaterThanExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: aGreaterThanExpression
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitIdentifierToken: anIdentifierToken [
	<generatedByPlatypus>
	self visitToken: anIdentifierToken
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitIfClause: anIfClause [
	<generatedByPlatypus>
	anIfClause condition ifNotNil: [ :a | a accept: self ].
	anIfClause statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitIfStatement: anIfStatement [
	<generatedByPlatypus>
	anIfStatement ifClauses ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anIfStatement elseClause ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitImportClause: anImportClause [
	<generatedByPlatypus>
	anImportClause names ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitIncompleteTypeDeclaration: anIncompleteTypeDeclaration [
	<generatedByPlatypus>
	self visitTypeDeclaration: anIncompleteTypeDeclaration
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitIndex: anIndex [
	<generatedByPlatypus>
	anIndex typeMark ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitIndexedAggregate: anIndexedAggregate [
	<generatedByPlatypus>
	anIndexedAggregate base ifNotNil: [ :a | a accept: self ].
	anIndexedAggregate indexes ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitIntegerType: anIntegerType [
	<generatedByPlatypus>
	self visitSimpleType: anIntegerType
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitIterationPolicy: anIterationPolicy [
	<generatedByPlatypus>
	self visitEntity: anIterationPolicy
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitKeywordToken: aKeywordToken [
	<generatedByPlatypus>
	self visitToken: aKeywordToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitLessEqualExpression: aLessEqualExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: aLessEqualExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitLessThanExpression: aLessThanExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: aLessThanExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitLiteral: aLiteral [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitLogicalExpression: aLogicalExpression [
	<generatedByPlatypus>
	self visitBinaryExpression: aLogicalExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitLogicalLiteral: aLogicalLiteral [
	<generatedByPlatypus>
	self visitConstantLiteral: aLogicalLiteral
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitLoopStatement: aLoopStatement [
	<generatedByPlatypus>
	aLoopStatement policy ifNotNil: [ :a | a accept: self ].
	aLoopStatement statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitMembershipExpression: aMembershipExpression [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitMembershipIteration: aMembershipIteration [
	<generatedByPlatypus>
	aMembershipIteration range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitMinusExpression: aMinusExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aMinusExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitModExpression: aModExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aModExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitModIntegerType: aModIntegerType [
	<generatedByPlatypus>
	aModIntegerType modu ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitMultExpression: aMultExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aMultExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNamedAttribute: aNamedAttribute [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitNamedExceptionChoice: aNamedExceptionChoice [
	<generatedByPlatypus>
	aNamedExceptionChoice identifier ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNamedRange: aNamedRange [
	<generatedByPlatypus>
	aNamedRange name ifNotNil: [ :a | a accept: self ].
	aNamedRange argument ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNamedSelector: aNamedSelector [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNegativeExpression: aNegativeExpression [
	<generatedByPlatypus>
	self visitSimpleUnaryExpression: aNegativeExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNotEqualExpression: aNotEqualExpression [
	<generatedByPlatypus>
	self visitRelationalExpression: aNotEqualExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNotExpression: aNotExpression [
	<generatedByPlatypus>
	self visitSimpleUnaryExpression: aNotExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNullLiteral: aNullLiteral [
	<generatedByPlatypus>
	self visitConstantLiteral: aNullLiteral
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitNullRecordType: aNullRecordType [
	<generatedByPlatypus>
	self visitRecordType: aNullRecordType
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitNullStatement: aNullStatement [
	<generatedByPlatypus>
	self visitSimpleStatement: aNullStatement
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitNumberDeclaration: aNumberDeclaration [
	<generatedByPlatypus>
	aNumberDeclaration initialization ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitNumberValueToken: aNumberValueToken [
	<generatedByPlatypus>
	self visitValueToken: aNumberValueToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitNumericLiteral: aNumericLiteral [
	<generatedByPlatypus>
	self visitValueLiteral: aNumericLiteral
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitObjectDeclaration: anObjectDeclaration [
	<generatedByPlatypus>
	anObjectDeclaration definition ifNotNil: [ :a | a accept: self ].
	anObjectDeclaration initialization ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitObjectRenamingDeclaration: anObjectRenamingDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitOperatorOverloadDeclaration: anOperatorOverloadDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitOperatorToken: anOperatorToken [
	<generatedByPlatypus>
	self visitKeywordToken: anOperatorToken
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitOrElseExpression: anOrElseExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: anOrElseExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitOrExpression: anOrExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: anOrExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitOrdinaryFixedType: anOrdinaryFixedType [
	<generatedByPlatypus>
	anOrdinaryFixedType delta ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitOtherChoice: anOtherChoice [
	<generatedByPlatypus>
	self visitChoice: anOtherChoice
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitOthersExceptionChoice: anOthersExceptionChoice [
	<generatedByPlatypus>
	self visitExceptionChoice: anOthersExceptionChoice
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitPackageBody: aPackageBody [
	<generatedByPlatypus>
	aPackageBody name ifNotNil: [ :a | a accept: self ].
	aPackageBody blockBody ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPackageBodyStubDeclaration: aPackageBodyStubDeclaration [
	<generatedByPlatypus>
	aPackageBodyStubDeclaration name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPackageDeclaration: aPackageDeclaration [
	<generatedByPlatypus>
	aPackageDeclaration name ifNotNil: [ :a | a accept: self ].
	aPackageDeclaration definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPackageDefinition: aPackageDefinition [
	<generatedByPlatypus>
	aPackageDefinition publicPart ifNotNil: [ :a | a accept: self ].
	aPackageDefinition privatePart ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPackagePart: aPackagePart [
	<generatedByPlatypus>
	aPackagePart elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPackageRenamingDeclaration: aPackageRenamingDeclaration [
	<generatedByPlatypus>
	aPackageRenamingDeclaration newName ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitParsingResult: aParsingResult [
	<generatedByPlatypus>
	aParsingResult entities ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aParsingResult tokenList ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitPlusExpression: aPlusExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aPlusExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitPositiveExpression: aPositiveExpression [
	<generatedByPlatypus>
	self visitSimpleUnaryExpression: aPositiveExpression
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitPragma: aPragma [
	<generatedByPlatypus>
	aPragma arguments ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitPragmaArgument: aPragmaArgument [
	<generatedByPlatypus>
	aPragmaArgument argumentValue ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitPragmaToken: aPragmaToken [
	<generatedByPlatypus>
	aPragmaToken pragma ifNotNil: [ :a | a accept: self ].
	aPragmaToken tokens ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitPrimaryQualifier: aPrimaryQualifier [
	<generatedByPlatypus>
	aPrimaryQualifier primary ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPrivateRecordType: aPrivateRecordType [
	<generatedByPlatypus>
	self visitRecordType: aPrivateRecordType
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPrivateTypeDeclaration: aPrivateTypeDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitPrivateTypeDefinition: aPrivateTypeDefinition [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitProcedureCall: aProcedureCall [
	<generatedByPlatypus>
	aProcedureCall name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProcedureDeclaration: aProcedureDeclaration [
	<generatedByPlatypus>
	aProcedureDeclaration name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitBody: aProtectedUnitBody [
	<generatedByPlatypus>
	aProtectedUnitBody elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitBodyStubDeclaration: aProtectedUnitBodyStubDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitDeclaration: aProtectedUnitDeclaration [
	<generatedByPlatypus>
	aProtectedUnitDeclaration definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitDefinition: aProtectedUnitDefinition [
	<generatedByPlatypus>
	aProtectedUnitDefinition publicPart ifNotNil: [ :a | a accept: self ].
	aProtectedUnitDefinition privatePart ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitPart: aProtectedUnitPart [
	<generatedByPlatypus>
	self visitEntity: aProtectedUnitPart
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitPrivatePart: aProtectedUnitPrivatePart [
	<generatedByPlatypus>
	aProtectedUnitPrivatePart entries ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitPublicPart: aProtectedUnitPublicPart [
	<generatedByPlatypus>
	aProtectedUnitPublicPart entries ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitProtectedUnitTypeDeclaration: aProtectedUnitTypeDeclaration [
	<generatedByPlatypus>
	aProtectedUnitTypeDeclaration discriminant ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitQualifiedIdentifier: aQualifiedIdentifier [
	<generatedByPlatypus>
	aQualifiedIdentifier qualifiers ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitQualifier: aQualifier [
	<generatedByPlatypus>
	self visitEntity: aQualifier
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitRaiseStatement: aRaiseStatement [
	<generatedByPlatypus>
	aRaiseStatement name ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitRange: aRange [
	<generatedByPlatypus>
	self visitUnaryExpression: aRange
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitRangeChoice: aRangeChoice [
	<generatedByPlatypus>
	aRangeChoice range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitRangeConstraint: aRangeConstraint [
	<generatedByPlatypus>
	aRangeConstraint range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRangeIntegerType: aRangeIntegerType [
	<generatedByPlatypus>
	aRangeIntegerType range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRealType: aRealType [
	<generatedByPlatypus>
	aRealType range ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRecordDefinition: aRecordDefinition [
	<generatedByPlatypus>
	aRecordDefinition elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aRecordDefinition variantPart ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRecordType: aRecordType [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRecordTypeRepresentation: aRecordTypeRepresentation [
	<generatedByPlatypus>
	aRecordTypeRepresentation name ifNotNil: [ :a | a accept: self ].
	aRecordTypeRepresentation align ifNotNil: [ :a | a accept: self ].
	aRecordTypeRepresentation locations ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitRelationalExpression: aRelationalExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: aRelationalExpression
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitRemExpression: aRemExpression [
	<generatedByPlatypus>
	self visitArithmeticExpression: aRemExpression
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRenamingDeclaration: aRenamingDeclaration [
	<generatedByPlatypus>
	aRenamingDeclaration renamedEntityName ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitRepresentation: aRepresentation [
	<generatedByPlatypus>
	self visitEntity: aRepresentation
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitRequeueStatement: aRequeueStatement [
	<generatedByPlatypus>
	aRequeueStatement taskName ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitReturnStatement: aReturnStatement [
	<generatedByPlatypus>
	aReturnStatement result ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitScalarType: aScalarType [
	<generatedByPlatypus>
	self visitElementaryType: aScalarType
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitSelectStatement: aSelectStatement [
	<generatedByPlatypus>
	self visitCompoundStatement: aSelectStatement
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitSelectiveWaitAlternative: aSelectiveWaitAlternative [
	<generatedByPlatypus>
	aSelectiveWaitAlternative when ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitSelectiveWaitStatement: aSelectiveWaitStatement [
	<generatedByPlatypus>
	aSelectiveWaitStatement alternatives ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aSelectiveWaitStatement elseAlternative ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitSemicolonToken: aSemicolonToken [
	<generatedByPlatypus>
	self visitDelimToken: aSemicolonToken
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitSeparateBody: aSeparateBody [
	<generatedByPlatypus>
	aSeparateBody name ifNotNil: [ :a | a accept: self ].
	aSeparateBody subunitBody ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitSimpleIdentifier: aSimpleIdentifier [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitSimpleStatement: aSimpleStatement [
	<generatedByPlatypus>
	self visitStatement: aSimpleStatement
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSimpleType: aSimpleType [
	<generatedByPlatypus>
	self visitDiscreteType: aSimpleType
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitSimpleUnaryExpression: aSimpleUnaryExpression [
	<generatedByPlatypus>
	aSimpleUnaryExpression right ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitSpaceToken: aSpaceToken [
	<generatedByPlatypus>
	self visitBlankToken: aSpaceToken
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitStatement: aStatement [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitStringDesignator: aStringDesignator [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitStringEnumerationId: aStringEnumerationId [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitStringLiteral: aStringLiteral [
	<generatedByPlatypus>
	self visitValueLiteral: aStringLiteral
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitStringSelector: aStringSelector [
	<generatedByPlatypus>
	
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitStringValueToken: aStringValueToken [
	<generatedByPlatypus>
	self visitValueToken: aStringValueToken
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitSubprogramBody: aSubprogramBody [
	<generatedByPlatypus>
	aSubprogramBody declaration ifNotNil: [ :a | a accept: self ].
	aSubprogramBody blockBody ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSubprogramBodyStubDeclaration: aSubprogramBodyStubDeclaration [
	<generatedByPlatypus>
	aSubprogramBodyStubDeclaration declaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSubprogramDeclaration: aSubprogramDeclaration [
	<generatedByPlatypus>
	aSubprogramDeclaration parameters ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSubprogramRenamingDeclaration: aSubprogramRenamingDeclaration [
	<generatedByPlatypus>
	aSubprogramRenamingDeclaration newDeclaration ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSubtypeDeclaration: aSubtypeDeclaration [
	<generatedByPlatypus>
	aSubtypeDeclaration subtypeIndication ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitSubtypeIndication: aSubtypeIndication [
	<generatedByPlatypus>
	aSubtypeIndication name ifNotNil: [ :a | a accept: self ].
	aSubtypeIndication constraint ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitTabulationToken: aTabulationToken [
	<generatedByPlatypus>
	self visitBlankToken: aTabulationToken
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LewisAbstractVisitor >> visitTaskBody: aTaskBody [
	<generatedByPlatypus>
	aTaskBody blockBody ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTaskBodyStubDeclaration: aTaskBodyStubDeclaration [
	<generatedByPlatypus>
	
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTaskDeclaration: aTaskDeclaration [
	<generatedByPlatypus>
	aTaskDeclaration definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTaskDefinition: aTaskDefinition [
	<generatedByPlatypus>
	aTaskDefinition publicPart ifNotNil: [ :a | a accept: self ].
	aTaskDefinition privatePart ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTaskPart: aTaskPart [
	<generatedByPlatypus>
	aTaskPart entries ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aTaskPart representations ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTaskTypeDeclaration: aTaskTypeDeclaration [
	<generatedByPlatypus>
	aTaskTypeDeclaration discriminant ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitTerminateAlternative: aTerminateAlternative [
	<generatedByPlatypus>
	self visitSelectiveWaitAlternative: aTerminateAlternative
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitTimedEntryCall: aTimedEntryCall [
	<generatedByPlatypus>
	aTimedEntryCall statements ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aTimedEntryCall orStatements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitToken: aToken [
	<generatedByPlatypus>
	aToken blanks ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitTokenList: aTokenList [
	<generatedByPlatypus>
	aTokenList tokens ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitTrueConstant: aTrueConstant [
	<generatedByPlatypus>
	self visitLogicalLiteral: aTrueConstant
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTypeDeclaration: aTypeDeclaration [
	<generatedByPlatypus>
	aTypeDeclaration discriminant ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitTypeDefinition: aTypeDefinition [
	<generatedByPlatypus>
	self visitEntity: aTypeDefinition
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitUnaryExpression: anUnaryExpression [
	<generatedByPlatypus>
	self visitExpression: anUnaryExpression
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitUnit: anUnit [
	<generatedByPlatypus>
	anUnit interfaces ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	anUnit element ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitUnitElementToken: anUnitElementToken [
	<generatedByPlatypus>
	self visitKeywordToken: anUnitElementToken
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitUnitInterface: anUnitInterface [
	<generatedByPlatypus>
	anUnitInterface withClause ifNotNil: [ :a | a accept: self ].
	anUnitInterface useClauses ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitUnitRenamingDeclaration: anUnitRenamingDeclaration [
	<generatedByPlatypus>
	self visitRenamingDeclaration: anUnitRenamingDeclaration
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitUseClause: anUseClause [
	<generatedByPlatypus>
	
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitUseTypeClause: anUseTypeClause [
	<generatedByPlatypus>
	self visitUseClause: anUseTypeClause
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitValueLiteral: aValueLiteral [
	<generatedByPlatypus>
	self visitLiteral: aValueLiteral
]

{ #category : #'LwsParsingResultSchema visiting' }
LewisAbstractVisitor >> visitValueToken: aValueToken [
	<generatedByPlatypus>
	self visitToken: aValueToken
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitVariantComponentAttribute: aVariantComponentAttribute [
	<generatedByPlatypus>
	aVariantComponentAttribute choices ifNotNil: [ :a | a do: [ :e | e accept: self ] ].
	aVariantComponentAttribute record ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LewisAbstractVisitor >> visitVariantRecordPart: aVariantRecordPart [
	<generatedByPlatypus>
	aVariantRecordPart caseIdentifier ifNotNil: [ :a | a accept: self ].
	aVariantRecordPart elements ifNotNil: [ :a | a do: [ :e | e accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LewisAbstractVisitor >> visitWhileIteration: aWhileIteration [
	<generatedByPlatypus>
	aWhileIteration condition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStructureSchema visiting' }
LewisAbstractVisitor >> visitWithClause: aWithClause [
	<generatedByPlatypus>
	
]

{ #category : #'LwsExpressionSchema visiting' }
LewisAbstractVisitor >> visitXorExpression: aXorExpression [
	<generatedByPlatypus>
	self visitLogicalExpression: aXorExpression
]
