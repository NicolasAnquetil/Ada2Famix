"
<express_specification>
ENTITY LwsCharacterLiteral SUBTYPE OF (LwsValueLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCharacterLiteral,
	#superclass : #LwsValueLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsCharacterLiteral class >> annotation [
	<MSEClass: #LwsCharacterLiteral super: #LwsValueLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCharacterLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCharacterLiteral: self
]

{ #category : #'initialize-release' }
LwsCharacterLiteral >> initialize [
	<generatedByPlatypus>
	super initialize
]
