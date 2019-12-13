"
<express_specification>
ENTITY LwsLogicalLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsConstantLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLogicalLiteral,
	#superclass : #LwsConstantLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsLogicalLiteral class >> annotation [
	<MSEClass: #LwsLogicalLiteral super: #LwsConstantLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsLogicalLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLogicalLiteral: self
]

{ #category : #'initialize-release' }
LwsLogicalLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
