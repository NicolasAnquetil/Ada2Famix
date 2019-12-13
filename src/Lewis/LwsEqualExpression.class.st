"
<express_specification>
ENTITY LwsEqualExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '=';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEqualExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsEqualExpression class >> annotation [
	<MSEClass: #LwsEqualExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEqualExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEqualExpression: self
]

{ #category : #'initialize-release' }
LwsEqualExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsEqualExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '='
]
