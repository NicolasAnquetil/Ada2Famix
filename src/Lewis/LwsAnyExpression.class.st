"
<express_specification>
ENTITY LwsAnyExpression SUBTYPE OF (LwsExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAnyExpression,
	#superclass : #LwsExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAnyExpression class >> annotation [
	<MSEClass: #LwsAnyExpression super: #LwsExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAnyExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAnyExpression: self
]

{ #category : #'initialize-release' }
LwsAnyExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]
