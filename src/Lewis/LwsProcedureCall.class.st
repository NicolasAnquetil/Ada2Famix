"
<express_specification>
ENTITY LwsProcedureCall SUBTYPE OF (LwsSimpleStatement);
	name : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProcedureCall,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsProcedureCall class >> annotation [
	<MSEClass: #LwsProcedureCall super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProcedureCall >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProcedureCall: self
]

{ #category : #'initialize-release' }
LwsProcedureCall >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsProcedureCall >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsProcedureCall >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
