"
<express_specification>
ENTITY LwsNumericLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsValueLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNumericLiteral,
	#superclass : #LwsValueLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNumericLiteral class >> annotation [
	<MSEClass: #LwsNumericLiteral super: #LwsValueLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsNumericLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNumericLiteral: self
]

{ #category : #'initialize-release' }
LwsNumericLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
