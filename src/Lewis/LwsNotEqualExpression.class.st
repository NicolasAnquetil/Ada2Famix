"
<express_specification>
ENTITY LwsNotEqualExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '/=';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNotEqualExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNotEqualExpression class >> annotation [
	<MSEClass: #LwsNotEqualExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNotEqualExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNotEqualExpression: self
]

{ #category : #'initialize-release' }
LwsNotEqualExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsNotEqualExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '/='
]
