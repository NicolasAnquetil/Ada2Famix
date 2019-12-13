"
<express_specification>
ENTITY LwsRemExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'rem';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRemExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsRemExpression class >> annotation [
	<MSEClass: #LwsRemExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRemExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRemExpression: self
]

{ #category : #'initialize-release' }
LwsRemExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsRemExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'rem'
]
