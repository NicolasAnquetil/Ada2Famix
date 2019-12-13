"
<express_specification>
ENTITY LwsPlusExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '+';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPlusExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsPlusExpression class >> annotation [
	<MSEClass: #LwsPlusExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPlusExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPlusExpression: self
]

{ #category : #'initialize-release' }
LwsPlusExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsPlusExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '+'
]
