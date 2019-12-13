"
<express_specification>
ENTITY LwsConstantLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsConstantLiteral,
	#superclass : #LwsLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsConstantLiteral class >> annotation [
	<MSEClass: #LwsConstantLiteral super: #LwsLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsConstantLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitConstantLiteral: self
]

{ #category : #'initialize-release' }
LwsConstantLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
