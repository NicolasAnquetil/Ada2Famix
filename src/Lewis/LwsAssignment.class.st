"
<express_specification>
ENTITY LwsAssignment SUBTYPE OF (LwsSimpleStatement);
	variableName : LwsQualifiedIdentifier;
	expression : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAssignment,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'variableName',
		'expression'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsAssignment class >> annotation [
	<MSEClass: #LwsAssignment super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAssignment >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAssignment: self
]

{ #category : #'explicit attributes' }
LwsAssignment >> expression [
	<MSEProperty: #expression type: #LwsExpression>
	<generatedByPlatypus>
	^ expression
]

{ #category : #'explicit attributes' }
LwsAssignment >> expression: anExpression [
	<generatedByPlatypus>
	expression := anExpression
]

{ #category : #'initialize-release' }
LwsAssignment >> initialize [
	<generatedByPlatypus>
	super initialize.
	variableName := nil.
	expression := nil
]

{ #category : #'explicit attributes' }
LwsAssignment >> variableName [
	<MSEProperty: #variableName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ variableName
]

{ #category : #'explicit attributes' }
LwsAssignment >> variableName: aQualifiedIdentifier [
	<generatedByPlatypus>
	variableName := aQualifiedIdentifier
]
