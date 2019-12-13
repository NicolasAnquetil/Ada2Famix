"
<express_specification>
ENTITY LwsNegativeExpression SUBTYPE OF (LwsSimpleUnaryExpression);
DERIVE
	SELF\LwsSimpleUnaryExpression.opString : STRING := '-';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNegativeExpression,
	#superclass : #LwsSimpleUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNegativeExpression class >> annotation [
	<MSEClass: #LwsNegativeExpression super: #LwsSimpleUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNegativeExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNegativeExpression: self
]

{ #category : #'initialize-release' }
LwsNegativeExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsNegativeExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '-'
]
