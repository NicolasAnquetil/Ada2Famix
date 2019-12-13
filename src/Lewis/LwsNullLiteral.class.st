"
<express_specification>
ENTITY LwsNullLiteral SUBTYPE OF (LwsConstantLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNullLiteral,
	#superclass : #LwsConstantLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNullLiteral class >> annotation [
	<MSEClass: #LwsNullLiteral super: #LwsConstantLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNullLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNullLiteral: self
]

{ #category : #'initialize-release' }
LwsNullLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
