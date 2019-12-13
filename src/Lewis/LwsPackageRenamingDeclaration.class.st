"
<express_specification>
ENTITY LwsPackageRenamingDeclaration SUBTYPE OF (LwsUnitRenamingDeclaration);
	newName : LwsCompoundName;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackageRenamingDeclaration,
	#superclass : #LwsUnitRenamingDeclaration,
	#instVars : [
		'newName'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPackageRenamingDeclaration class >> annotation [
	<MSEClass: #LwsPackageRenamingDeclaration super: #LwsUnitRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackageRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackageRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsPackageRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	newName := nil
]

{ #category : #'explicit attributes' }
LwsPackageRenamingDeclaration >> newName [
	<MSEProperty: #newName type: #LwsCompoundName>
	<generatedByPlatypus>
	^ newName
]

{ #category : #'explicit attributes' }
LwsPackageRenamingDeclaration >> newName: aCompoundName [
	<generatedByPlatypus>
	newName := aCompoundName
]
