"
<express_specification>
ENTITY LwsRaiseStatement SUBTYPE OF (LwsSimpleStatement);
	name : OPTIONAL LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRaiseStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsRaiseStatement class >> annotation [
	<MSEClass: #LwsRaiseStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRaiseStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRaiseStatement: self
]

{ #category : #'initialize-release' }
LwsRaiseStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsRaiseStatement >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsRaiseStatement >> name: aQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	name := aQualifiedIdentifierOrNil
]
