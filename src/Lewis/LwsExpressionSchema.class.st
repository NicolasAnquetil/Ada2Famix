"
<express_specification>
SCHEMA LwsExpressionSchema;

	TYPE LwsAggregateElement = SELECT ( LwsComponentAssociation, LwsExpression );
	END_TYPE;
	
	ENTITY LwsExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
		parenthesis : BOOLEAN := false;
	END_ENTITY;
	
	ENTITY LwsBinaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsExpression);
		left : LwsExpression;
		right : LwsExpression;
	DERIVE
		opString : STRING := ?;
	END_ENTITY;
	
	ENTITY LwsLogicalExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsBinaryExpression);
	END_ENTITY;
	
	ENTITY LwsAndExpression SUBTYPE OF (LwsLogicalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'and';
	END_ENTITY;
	
	ENTITY LwsAndThenExpression SUBTYPE OF (LwsLogicalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'and then';
	END_ENTITY;
	
	ENTITY LwsOrExpression SUBTYPE OF (LwsLogicalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'or';
	END_ENTITY;
	
	ENTITY LwsOrElseExpression SUBTYPE OF (LwsLogicalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'or else';
	END_ENTITY;
	
	ENTITY LwsXorExpression SUBTYPE OF (LwsLogicalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'xor';
	END_ENTITY;
	
	ENTITY LwsMembershipExpression SUBTYPE OF (LwsLogicalExpression);
		included : Boolean := true;
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING ::= 
				self included
					ifTrue: [ 'in' ]
					ifFalse: [ 'not in' ];
	END_ENTITY;
	
	ENTITY LwsRelationalExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsLogicalExpression);
	END_ENTITY;
	
	ENTITY LwsLessThanExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '<';
	END_ENTITY;
	
	ENTITY LwsGreaterThanExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '>';
	END_ENTITY;
	
	ENTITY LwsEqualExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '=';
	END_ENTITY;
	
	ENTITY LwsLessEqualExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '<=';
	END_ENTITY;
	
	ENTITY LwsGreaterEqualExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '>=';
	END_ENTITY;
	
	ENTITY LwsNotEqualExpression SUBTYPE OF (LwsRelationalExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '/=';
	END_ENTITY;
	
	ENTITY LwsArithmeticExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsBinaryExpression);
	END_ENTITY;
	
	ENTITY LwsExpoExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '**';
	END_ENTITY;
	
	ENTITY LwsMultExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '*';
	END_ENTITY;
	
	ENTITY LwsDivExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '/';
	END_ENTITY;
	
	ENTITY LwsModExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'mod';
	END_ENTITY;
	
	ENTITY LwsRemExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := 'rem';
	END_ENTITY;
	
	ENTITY LwsPlusExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '+';
	END_ENTITY;
	
	ENTITY LwsCatenationExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '&';
	END_ENTITY;
	
	ENTITY LwsMinusExpression SUBTYPE OF (LwsArithmeticExpression);
	DERIVE
		SELF\LwsBinaryExpression.opString : STRING := '-';
	END_ENTITY;
	
	ENTITY LwsUnaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsExpression);
	END_ENTITY;
	
	ENTITY LwsAnyExpression SUBTYPE OF (LwsExpression);
	END_ENTITY;
	
	ENTITY LwsSimpleUnaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
		right : LwsExpression;
	DERIVE
		opString : STRING := ?;
	END_ENTITY;
	
	ENTITY LwsAllocator SUBTYPE OF (LwsSimpleUnaryExpression);
		SELF\LwsSimpleUnaryExpression.right : LwsQualifiedIdentifier;
	DERIVE
		SELF\LwsSimpleUnaryExpression.opString : STRING := 'new';
	END_ENTITY;
	
	ENTITY LwsAbsExpression SUBTYPE OF (LwsSimpleUnaryExpression);
	DERIVE
		SELF\LwsSimpleUnaryExpression.opString : STRING := 'abs';
	END_ENTITY;
	
	ENTITY LwsNotExpression SUBTYPE OF (LwsSimpleUnaryExpression);
	DERIVE
		SELF\LwsSimpleUnaryExpression.opString : STRING := 'not';
	END_ENTITY;
	
	ENTITY LwsPositiveExpression SUBTYPE OF (LwsSimpleUnaryExpression);
	DERIVE
		SELF\LwsSimpleUnaryExpression.opString : STRING := '+';
	END_ENTITY;
	
	ENTITY LwsNegativeExpression SUBTYPE OF (LwsSimpleUnaryExpression);
	DERIVE
		SELF\LwsSimpleUnaryExpression.opString : STRING := '-';
	END_ENTITY;
	
	ENTITY LwsSimpleIdentifier SUBTYPE OF (LwsUnaryExpression);
		name : String;
	END_ENTITY;
	
	ENTITY LwsQualifiedIdentifier SUBTYPE OF (LwsUnaryExpression);
		name : STRING;
		qualifiers : List OF LwsQualifier ::= OrderedCollection new;
	END_ENTITY;
	
	ENTITY LwsQualifier ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsAllSelector SUBTYPE OF (LwsQualifier);
	END_ENTITY;
	
	ENTITY LwsPrimaryQualifier SUBTYPE OF (LwsQualifier);
		primary : LwsUnaryExpression;
	END_ENTITY;
	
	ENTITY LwsDigitsAttribute SUBTYPE OF (LwsQualifier);
	END_ENTITY;
	
	ENTITY LwsDeltaAttribute SUBTYPE OF (LwsQualifier);
	END_ENTITY;
	
	ENTITY LwsAccessAttribute SUBTYPE OF (LwsQualifier);
	END_ENTITY;
	
	ENTITY LwsStringSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;
	
	ENTITY LwsCharacterSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;
	
	ENTITY LwsNamedAttribute SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;
	
	ENTITY LwsEntryNameArgument SUBTYPE OF (LwsQualifier);
		argument : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsNamedSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;
	
	ENTITY LwsArgumentsSelector SUBTYPE OF (LwsQualifier);
		arguments : LwsAggregate;
	END_ENTITY;
	
	ENTITY LwsLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
		parsedString : String;
	END_ENTITY;
	
	ENTITY LwsValueLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsLiteral);
	END_ENTITY;
	
	ENTITY LwsNumericLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsValueLiteral);
	END_ENTITY;
	
	ENTITY LwsConstantLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsLiteral);
	END_ENTITY;
	
	ENTITY LwsNullLiteral SUBTYPE OF (LwsConstantLiteral);
	END_ENTITY;
	
	ENTITY LwsLogicalLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsConstantLiteral);
	END_ENTITY;
	
	ENTITY LwsTrueConstant SUBTYPE OF (LwsLogicalLiteral);
	END_ENTITY;
	
	ENTITY LwsFalseConstant SUBTYPE OF (LwsLogicalLiteral);
	END_ENTITY;
	
	ENTITY LwsDecimalLiteral SUBTYPE OF (LwsNumericLiteral);
	END_ENTITY;
	
	ENTITY LwsBasedLiteral SUBTYPE OF (LwsNumericLiteral);
	END_ENTITY;
	
	ENTITY LwsCharacterLiteral SUBTYPE OF (LwsValueLiteral);
	END_ENTITY;
	
	ENTITY LwsStringLiteral SUBTYPE OF (LwsValueLiteral);
	END_ENTITY;
	
	ENTITY LwsAbstractAggregate ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
	END_ENTITY;
	
	ENTITY LwsAggregate SUBTYPE OF (LwsAbstractAggregate);
		elements : list OF LwsAggregateElement ::= OrderedCollection new;
	END_ENTITY;
	
	ENTITY LwsIndexedAggregate SUBTYPE OF (LwsAbstractAggregate);
		base : OPTIONAL LwsExpression;
		indexes : list OF LwsAggregateElement ::= OrderedCollection new;
	END_ENTITY;
	
	ENTITY LwsComponentAssociation SUBTYPE OF (LwsEntity);
		expression : LwsExpression;
		choices : list OF LwsChoice;
	END_ENTITY;
	
	ENTITY LwsChoice ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsOtherChoice SUBTYPE OF (LwsChoice);
	END_ENTITY;
	
	ENTITY LwsRangeChoice SUBTYPE OF (LwsChoice);
		range : LwsRange;
	END_ENTITY;
	
	ENTITY LwsExpressionChoice SUBTYPE OF (LwsChoice);
		expression : LwsExpression;
	END_ENTITY;
	
	ENTITY LwsConstraint ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	END_ENTITY;
	
	ENTITY LwsRangeConstraint SUBTYPE OF (LwsConstraint);
		range : LwsRange;
	END_ENTITY;
	
	ENTITY LwsDigitsConstraint SUBTYPE OF (LwsConstraint);
		expression : LwsExpression;
		rangeConstraint : OPTIONAL LwsRangeConstraint;
	END_ENTITY;
	
	ENTITY LwsRange ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
	END_ENTITY;
	
	ENTITY LwsNamedRange SUBTYPE OF (LwsRange);
		name : LwsQualifiedIdentifier;
		argument : OPTIONAL LwsExpression;
	END_ENTITY;
	
	ENTITY LwsDiscreteRange SUBTYPE OF (LwsRange);
		identifier : OPTIONAL LwsQualifiedIdentifier;
		rangeConstraint : OPTIONAL LwsRangeConstraint;
	WHERE
		wr1 :: self identifier notNil or: [ self range notNil ];
	END_ENTITY;
	
	ENTITY LwsExplicitRange SUBTYPE OF (LwsRange);
		start : LwsExpression;
		stop : LwsExpression;
	END_ENTITY;
	
END_SCHEMA;

</express_specification>

"
Class {
	#name : #LwsExpressionSchema,
	#superclass : #PtsSchemaDefinitionHolder,
	#category : #'Lewis-Namespace'
}

{ #category : #'MSE annotation' }
LwsExpressionSchema class >> annotation [
	<MSEClass: #LwsExpressionSchema super: #PtsSchemaDefinitionHolder>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsExpressionSchema class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #platypus }
LwsExpressionSchema class >> platypusMetaData [
	<generatedByPlatypus>
	^ self namespace platypusMetaData schemaDefinitionNamed: self platypusIdent
]
