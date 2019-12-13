"
<express_specification>
ENTITY LwsUnaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUnaryExpression,
	#superclass : #LwsExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsUnaryExpression class >> annotation [
	<MSEClass: #LwsUnaryExpression super: #LwsExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsUnaryExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUnaryExpression: self
]

{ #category : #'initialize-release' }
LwsUnaryExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]
