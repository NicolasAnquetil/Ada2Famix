"
<express_specification>
ENTITY LwsRenamingDeclaration SUBTYPE OF (LwsBasicDeclaration);
	renamedEntityName : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRenamingDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'renamedEntityName'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRenamingDeclaration class >> annotation [
	<MSEClass: #LwsRenamingDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	renamedEntityName := nil
]

{ #category : #'explicit attributes' }
LwsRenamingDeclaration >> renamedEntityName [
	<MSEProperty: #renamedEntityName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ renamedEntityName
]

{ #category : #'explicit attributes' }
LwsRenamingDeclaration >> renamedEntityName: aQualifiedIdentifier [
	<generatedByPlatypus>
	renamedEntityName := aQualifiedIdentifier
]
