"
<express_specification>
ENTITY LwsCatenationExpression SUBTYPE OF (LwsArithmeticExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '&';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCatenationExpression,
	#superclass : #LwsArithmeticExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsCatenationExpression class >> annotation [
	<MSEClass: #LwsCatenationExpression super: #LwsArithmeticExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCatenationExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCatenationExpression: self
]

{ #category : #'initialize-release' }
LwsCatenationExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsCatenationExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '&'
]
