"
<express_specification>
ENTITY LwsEntryCall SUBTYPE OF (LwsSimpleStatement);
	name : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryCall,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsEntryCall class >> annotation [
	<MSEClass: #LwsEntryCall super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryCall >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryCall: self
]

{ #category : #'initialize-release' }
LwsEntryCall >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsEntryCall >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsEntryCall >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
