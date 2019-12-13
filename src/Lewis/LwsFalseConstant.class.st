"
<express_specification>
ENTITY LwsFalseConstant SUBTYPE OF (LwsLogicalLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFalseConstant,
	#superclass : #LwsLogicalLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsFalseConstant class >> annotation [
	<MSEClass: #LwsFalseConstant super: #LwsLogicalLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFalseConstant >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFalseConstant: self
]

{ #category : #'initialize-release' }
LwsFalseConstant >> initialize [
	<generatedByPlatypus>
	super initialize
]
