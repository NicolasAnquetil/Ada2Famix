"
<express_specification>
ENTITY LwsBinaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsExpression);
	left : LwsExpression;
	right : LwsExpression;
DERIVE
	opString : STRING := ?;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBinaryExpression,
	#superclass : #LwsExpression,
	#instVars : [
		'right',
		'left'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsBinaryExpression class >> annotation [
	<MSEClass: #LwsBinaryExpression super: #LwsExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsBinaryExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBinaryExpression: self
]

{ #category : #'initialize-release' }
LwsBinaryExpression >> initialize [
	<generatedByPlatypus>
	super initialize.
	left := nil.
	right := nil
]

{ #category : #'explicit attributes' }
LwsBinaryExpression >> left [
	<MSEProperty: #left type: #LwsExpression>
	<generatedByPlatypus>
	^ left
]

{ #category : #'explicit attributes' }
LwsBinaryExpression >> left: anExpression [
	<generatedByPlatypus>
	left := anExpression
]

{ #category : #'derived attributes' }
LwsBinaryExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ nil
]

{ #category : #'explicit attributes' }
LwsBinaryExpression >> right [
	<MSEProperty: #right type: #LwsExpression>
	<generatedByPlatypus>
	^ right
]

{ #category : #'explicit attributes' }
LwsBinaryExpression >> right: anExpression [
	<generatedByPlatypus>
	right := anExpression
]
