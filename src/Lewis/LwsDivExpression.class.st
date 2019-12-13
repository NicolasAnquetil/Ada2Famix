"
<express_specification>
ENTITY LwsDivExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '/';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDivExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDivExpression class >> annotation [
	<MSEClass: #LwsDivExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDivExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDivExpression: self
]

{ #category : #'initialize-release' }
LwsDivExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsDivExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '/'
]
