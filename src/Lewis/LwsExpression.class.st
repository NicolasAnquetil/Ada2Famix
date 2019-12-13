"
<express_specification>
ENTITY LwsExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	parenthesis : BOOLEAN := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExpression,
	#superclass : #LwsEntity,
	#instVars : [
		'parenthesis'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsExpression class >> annotation [
	<MSEClass: #LwsExpression super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExpression: self
]

{ #category : #'initialize-release' }
LwsExpression >> initialize [
	<generatedByPlatypus>
	super initialize.
	parenthesis := nil
]

{ #category : #'explicit attributes' }
LwsExpression >> parenthesis [
	<MSEProperty: #parenthesis type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ parenthesis ifNil: [ parenthesis := self parenthesisDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsExpression >> parenthesis: aBoolean [
	<generatedByPlatypus>
	parenthesis := aBoolean
]

{ #category : #'explicit attributes' }
LwsExpression >> parenthesisDefaultValue [
	<MSEProperty: #parenthesis type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
