"
<express_specification>
ENTITY LwsExpoExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '**';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExpoExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsExpoExpression class >> annotation [
	<MSEClass: #LwsExpoExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExpoExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExpoExpression: self
]

{ #category : #'initialize-release' }
LwsExpoExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsExpoExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '**'
]
