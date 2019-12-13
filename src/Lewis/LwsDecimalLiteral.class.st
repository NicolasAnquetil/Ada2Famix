"
<express_specification>
ENTITY LwsDecimalLiteral SUBTYPE OF (LwsNumericLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDecimalLiteral,
	#superclass : #LwsNumericLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDecimalLiteral class >> annotation [
	<MSEClass: #LwsDecimalLiteral super: #LwsNumericLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDecimalLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDecimalLiteral: self
]

{ #category : #'initialize-release' }
LwsDecimalLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
