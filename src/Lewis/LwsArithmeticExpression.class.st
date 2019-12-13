"
<express_specification>
ENTITY LwsArithmeticExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsBinaryExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsArithmeticExpression,
	#superclass : #LwsBinaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsArithmeticExpression class >> annotation [
	<MSEClass: #LwsArithmeticExpression super: #LwsBinaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsArithmeticExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitArithmeticExpression: self
]

{ #category : #'initialize-release' }
LwsArithmeticExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]
