"
<express_specification>
SCHEMA LwsStatementSchema;

	ENTITY LwsStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
		labels : List OF String;
	END_ENTITY;
	
	ENTITY LwsSimpleStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsStatement);
	END_ENTITY;
	
	ENTITY LwsNullStatement SUBTYPE OF (LwsSimpleStatement);
	END_ENTITY;
	
	ENTITY LwsAssignment SUBTYPE OF (LwsSimpleStatement);
		variableName : LwsQualifiedIdentifier;
		expression : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsProcedureCall SUBTYPE OF (LwsSimpleStatement);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsEntryCall SUBTYPE OF (LwsSimpleStatement);
		name : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsRaiseStatement SUBTYPE OF (LwsSimpleStatement);
		name : OPTIONAL LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsDelayStatement SUBTYPE OF (LwsSimpleStatement);
		delay : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsDelayUntilStatement SUBTYPE OF (LwsDelayStatement);
	END_ENTITY;
	
	ENTITY LwsExitStatement SUBTYPE OF (LwsSimpleStatement);
		name : OPTIONAL LwsQualifiedIdentifier;
		when : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsAbortStatement SUBTYPE OF (LwsSimpleStatement);
		taskNames : OPTIONAL List OF LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsReturnStatement SUBTYPE OF (LwsSimpleStatement);
		result : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsCodeStatement SUBTYPE OF (LwsSimpleStatement);
		code : LwsPrimaryQualifier;
	END_ENTITY;
	
	ENTITY LwsGotoStatement SUBTYPE OF (LwsSimpleStatement);
		targetLabel : String;
	END_ENTITY;
	
	ENTITY LwsRequeueStatement SUBTYPE OF (LwsSimpleStatement);
		taskName : LwsQualifiedIdentifier;
		withAbort : Boolean := false;
	END_ENTITY;
	
	ENTITY LwsCompoundStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsStatement);
	END_ENTITY;
	
	ENTITY LwsIfStatement SUBTYPE OF (LwsCompoundStatement);
		ifClauses : List OF LwsIfClause;
		elseClause : OPTIONAL List OF LwsStatement;
	END_ENTITY;
	
	ENTITY LwsIfClause SUBTYPE OF (LwsEntity);
		condition : LwsExpression;
		statements : list OF LwsStatement;
	END_ENTITY;
	
	ENTITY LwsCaseStatement SUBTYPE OF (LwsCompoundStatement);
		selector : LwsExpression;
		alternatives : List OF LwsCaseAlternative;
	END_ENTITY;
	
	ENTITY LwsCaseAlternative SUBTYPE OF (LwsEntity);
		choices : list OF LwsChoice;
		statements : List OF LwsStatement;
	END_ENTITY;
	
	ENTITY LwsLoopStatement SUBTYPE OF (LwsCompoundStatement);
		stamp : OPTIONAL String;
		policy : OPTIONAL LwsIterationPolicy;
		statements : list OF LwsStatement;
	END_ENTITY;
	
	ENTITY LwsIterationPolicy ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsWhileIteration SUBTYPE OF (LwsIterationPolicy);
		condition : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsMembershipIteration SUBTYPE OF (LwsIterationPolicy);
		identifier : String;
		reverse : boolean := false;
		range : LwsRange;
	END_ENTITY;
	
	ENTITY LwsBlockStatement SUBTYPE OF (LwsCompoundStatement);
		stamp : OPTIONAL String;
		locals : list OF LwsEntity;
		body : LwsBlockBody;
	END_ENTITY;
	
	ENTITY LwsExceptionHandler SUBTYPE OF (LwsEntity);
		name : OPTIONAL String;
		choices : List OF LwsExceptionChoice;
		statements : List OF LwsStatement;
	END_ENTITY;
	
	ENTITY LwsExceptionChoice ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsOthersExceptionChoice SUBTYPE OF (LwsExceptionChoice);
	END_ENTITY;
	
	ENTITY LwsNamedExceptionChoice SUBTYPE OF (LwsExceptionChoice);
		identifier : LwsQualifiedIdentifier;
	END_ENTITY;
	
	ENTITY LwsAcceptStatement SUBTYPE OF (LwsCompoundStatement);
		entryName : LwsQualifiedIdentifier;
		parameters : List OF LwsFormalParameter;
		statements : List OF LwsStatement;
		handlers : List OF LwsExceptionHandler;
	END_ENTITY;
	
	ENTITY LwsSelectStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsCompoundStatement);
	END_ENTITY;
	
	ENTITY LwsSelectiveWaitStatement SUBTYPE OF (LwsSelectStatement);
		alternatives : List OF LwsSelectiveWaitAlternative;
		elseAlternative : List OF LwsStatement;
	WHERE
		haveAtLeastOneAlternative :: self alternatives size >= 1;
	END_ENTITY;
	
	ENTITY LwsSelectiveWaitAlternative ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
		when : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsAcceptAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
		statements : List OF LwsStatement;
	WHERE
		haveAtLeastOneStatement :: self statements size >= 1;
		firstStatementIsAccept :: self statements first isKindOf: LwsAcceptStatement;
	END_ENTITY;
	
	ENTITY LwsDelayAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
		statements : List OF LwsStatement;
	WHERE
		haveAtLeastOneStatement :: self statements size >= 1;
		firstStatementIsDelay :: self statements first isKindOf: LwsDelayStatement;
	END_ENTITY;
	
	ENTITY LwsTerminateAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
	END_ENTITY;
	
	ENTITY LwsConditionalEntryCall SUBTYPE OF (LwsSelectStatement);
		statements : List OF LwsStatement;
		elseStatements : List OF LwsStatement;
	WHERE
		haveAtLeastOneStatement :: self statements size >= 1;
		firstStatementIsEntryCall :: self statements first isKindOf: LwsEntryCall;
	END_ENTITY;
	
	ENTITY LwsTimedEntryCall SUBTYPE OF (LwsSelectStatement);
		statements : List OF LwsStatement;
		orStatements : List OF LwsStatement;
	WHERE
		haveAtLeastOneStatement :: self statements size >= 1;
		haveAtLeastOneOrStatement :: self orStatements size >= 1;
		firstStatementIsEntryCall :: self statements first isKindOf: LwsEntryCall;
		firstOrStatementIsDelay :: self orStatements first isKindOf: LwsDelayStatement;
	END_ENTITY;
	
	ENTITY LwsAsynchronousSelect SUBTYPE OF (LwsSelectStatement);
		statements : List OF LwsStatement;
		abortStatements : List OF LwsStatement;
	WHERE
		haveAtLeastOneStatement :: self statements size >= 1;
		haveAtLeastOneAbordStatement :: self abortStatements size >= 1;
		firstStatementIsEntryCall :: (self statements first isKindOf: LwsEntryCall) or: [ self statements first isKindOf: LwsDelayStatement ];
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsStatementSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsStatementSchema class >> annotation [
	<MSEClass: #LwsStatementSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsStatementSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsStatementSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
