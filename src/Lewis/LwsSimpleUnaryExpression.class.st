"
<express_specification>
ENTITY LwsSimpleUnaryExpression ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
	right : LwsExpression;
DERIVE
	opString : STRING := ?;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSimpleUnaryExpression,
	#superclass : #LwsUnaryExpression,
	#instVars : [
		'right'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsSimpleUnaryExpression class >> annotation [
	<MSEClass: #LwsSimpleUnaryExpression super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsSimpleUnaryExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSimpleUnaryExpression: self
]

{ #category : #'initialize-release' }
LwsSimpleUnaryExpression >> initialize [
	<generatedByPlatypus>
	super initialize.
	right := nil
]

{ #category : #'derived attributes' }
LwsSimpleUnaryExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ nil
]

{ #category : #'explicit attributes' }
LwsSimpleUnaryExpression >> right [
	<MSEProperty: #right type: #LwsExpression>
	<generatedByPlatypus>
	^ right
]

{ #category : #'explicit attributes' }
LwsSimpleUnaryExpression >> right: anExpression [
	<generatedByPlatypus>
	right := anExpression
]
