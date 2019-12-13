"
<express_specification>
ENTITY LwsTrueConstant SUBTYPE OF (LwsLogicalLiteral);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTrueConstant,
	#superclass : #LwsLogicalLiteral,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsTrueConstant class >> annotation [
	<MSEClass: #LwsTrueConstant super: #LwsLogicalLiteral>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTrueConstant >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTrueConstant: self
]

{ #category : #'initialize-release' }
LwsTrueConstant >> initialize [
	<generatedByPlatypus>
	super initialize
]
