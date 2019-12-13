"
<express_specification>
ENTITY LwsStringLiteral SUBTYPE OF (LwsValueLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStringLiteral,
	#superclass : #LwsValueLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsStringLiteral class >> annotation [
	<MSEClass: #LwsStringLiteral super: #LwsValueLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsStringLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStringLiteral: self
]

{ #category : #'initialize-release' }
LwsStringLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
