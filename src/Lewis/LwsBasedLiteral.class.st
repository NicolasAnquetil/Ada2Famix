"
<express_specification>
ENTITY LwsBasedLiteral SUBTYPE OF (LwsNumericLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBasedLiteral,
	#superclass : #LwsNumericLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsBasedLiteral class >> annotation [
	<MSEClass: #LwsBasedLiteral super: #LwsNumericLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBasedLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBasedLiteral: self
]

{ #category : #'initialize-release' }
LwsBasedLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
