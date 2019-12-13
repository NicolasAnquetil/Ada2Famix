"
<express_specification>
ENTITY LwsGreaterEqualExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '>=';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGreaterEqualExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsGreaterEqualExpression class >> annotation [
	<MSEClass: #LwsGreaterEqualExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGreaterEqualExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGreaterEqualExpression: self
]

{ #category : #'initialize-release' }
LwsGreaterEqualExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsGreaterEqualExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '>='
]
