"
<express_specification>
ENTITY LwsLogicalExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsBinaryExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLogicalExpression,
	#superclass : #LwsBinaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsLogicalExpression class >> annotation [
	<MSEClass: #LwsLogicalExpression super: #LwsBinaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsLogicalExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLogicalExpression: self
]

{ #category : #'initialize-release' }
LwsLogicalExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]
