"
<express_specification>
ENTITY LwsMultExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '*';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsMultExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsMultExpression class >> annotation [
	<MSEClass: #LwsMultExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsMultExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitMultExpression: self
]

{ #category : #'initialize-release' }
LwsMultExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsMultExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '*'
]
