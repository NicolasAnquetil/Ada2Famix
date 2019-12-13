"
<express_specification>
ENTITY LwsModExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'mod';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsModExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsModExpression class >> annotation [
	<MSEClass: #LwsModExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsModExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitModExpression: self
]

{ #category : #'initialize-release' }
LwsModExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsModExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'mod'
]
