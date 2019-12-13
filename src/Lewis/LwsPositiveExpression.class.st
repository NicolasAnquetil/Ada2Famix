"
<express_specification>
ENTITY LwsPositiveExpression SUBTYPE OF (LwsSimpleUnaryExpression);
DERIVE
	SELF\LwsSimpleUnaryExpression.opString : STRING := '+';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPositiveExpression,
	#superclass : #LwsSimpleUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsPositiveExpression class >> annotation [
	<MSEClass: #LwsPositiveExpression super: #LwsSimpleUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPositiveExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPositiveExpression: self
]

{ #category : #'initialize-release' }
LwsPositiveExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsPositiveExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '+'
]
