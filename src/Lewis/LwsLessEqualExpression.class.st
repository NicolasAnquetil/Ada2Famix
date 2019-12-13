"
<express_specification>
ENTITY LwsLessEqualExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '<=';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLessEqualExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsLessEqualExpression class >> annotation [
	<MSEClass: #LwsLessEqualExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsLessEqualExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLessEqualExpression: self
]

{ #category : #'initialize-release' }
LwsLessEqualExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsLessEqualExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '<='
]
