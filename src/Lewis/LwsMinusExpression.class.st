"
<express_specification>
ENTITY LwsMinusExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '-';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsMinusExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsMinusExpression class >> annotation [
	<MSEClass: #LwsMinusExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsMinusExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitMinusExpression: self
]

{ #category : #'initialize-release' }
LwsMinusExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsMinusExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '-'
]
