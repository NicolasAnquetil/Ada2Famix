"
<express_specification>
ENTITY LwsExitStatement SUBTYPE OF (LwsSimpleStatement);
	name : OPTIONAL LwsQualifiedIdentifier;
	when : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExitStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'when',
		'name'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsExitStatement class >> annotation [
	<MSEClass: #LwsExitStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExitStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExitStatement: self
]

{ #category : #'initialize-release' }
LwsExitStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	when := nil
]

{ #category : #'explicit attributes' }
LwsExitStatement >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsExitStatement >> name: aQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	name := aQualifiedIdentifierOrNil
]

{ #category : #'explicit attributes' }
LwsExitStatement >> when [
	<MSEProperty: #when type: #LwsExpression>
	<generatedByPlatypus>
	^ when
]

{ #category : #'explicit attributes' }
LwsExitStatement >> when: anExpressionOrNil [
	<generatedByPlatypus>
	when := anExpressionOrNil
]
