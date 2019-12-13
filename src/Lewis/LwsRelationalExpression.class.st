"
<express_specification>
ENTITY LwsRelationalExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsLogicalExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRelationalExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsRelationalExpression class >> annotation [
	<MSEClass: #LwsRelationalExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsRelationalExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRelationalExpression: self
]

{ #category : #'initialize-release' }
LwsRelationalExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]
