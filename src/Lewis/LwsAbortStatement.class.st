"
<express_specification>
ENTITY LwsAbortStatement SUBTYPE OF (LwsSimpleStatement);
	taskNames : OPTIONAL List OF LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAbortStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'taskNames'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsAbortStatement class >> annotation [
	<MSEClass: #LwsAbortStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAbortStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAbortStatement: self
]

{ #category : #'initialize-release' }
LwsAbortStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'explicit attributes' }
LwsAbortStatement >> taskNames [
	<MSEProperty: #taskNames type: #LwsQualifiedIdentifier>
	<multivalued>
	<generatedByPlatypus>
	^ taskNames
]

{ #category : #'explicit attributes' }
LwsAbortStatement >> taskNames: aListOfQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	taskNames := aListOfQualifiedIdentifierOrNil
]
