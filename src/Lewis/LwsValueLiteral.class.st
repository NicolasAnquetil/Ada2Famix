"
<express_specification>
ENTITY LwsValueLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsValueLiteral,
	#superclass : #LwsLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsValueLiteral class >> annotation [
	<MSEClass: #LwsValueLiteral super: #LwsLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsValueLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitValueLiteral: self
]

{ #category : #'initialize-release' }
LwsValueLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
