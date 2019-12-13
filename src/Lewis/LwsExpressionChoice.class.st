"
<express_specification>
ENTITY LwsExpressionChoice SUBTYPE OF (LwsChoice);
	expression : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExpressionChoice,
	#superclass : #LwsChoice,
	#instVars : [
		'expression'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsExpressionChoice class >> annotation [
	<MSEClass: #LwsExpressionChoice super: #LwsChoice>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExpressionChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExpressionChoice: self
]

{ #category : #'explicit attributes' }
LwsExpressionChoice >> expression [
	<MSEProperty: #expression type: #LwsExpression>
	<generatedByPlatypus>
	^ expression
]

{ #category : #'explicit attributes' }
LwsExpressionChoice >> expression: anExpression [
	<generatedByPlatypus>
	expression := anExpression
]

{ #category : #'initialize-release' }
LwsExpressionChoice >> initialize [
	<generatedByPlatypus>
	super initialize.
	expression := nil
]
