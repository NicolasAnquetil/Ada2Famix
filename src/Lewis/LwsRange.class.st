"
<express_specification>
ENTITY LwsRange ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRange,
	#superclass : #LwsUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsRange class >> annotation [
	<MSEClass: #LwsRange super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsRange >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRange: self
]

{ #category : #'initialize-release' }
LwsRange >> initialize [
	<generatedByPlatypus>
	super initialize
]
