"
<express_specification>
ENTITY LwsSubprogramRenamingDeclaration SUBTYPE OF (LwsUnitRenamingDeclaration);
	newDeclaration : LwsSubprogramDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubprogramRenamingDeclaration,
	#superclass : #LwsUnitRenamingDeclaration,
	#instVars : [
		'newDeclaration'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSubprogramRenamingDeclaration class >> annotation [
	<MSEClass: #LwsSubprogramRenamingDeclaration super: #LwsUnitRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSubprogramRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubprogramRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsSubprogramRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	newDeclaration := nil
]

{ #category : #'explicit attributes' }
LwsSubprogramRenamingDeclaration >> newDeclaration [
	<MSEProperty: #newDeclaration type: #LwsSubprogramDeclaration>
	<generatedByPlatypus>
	^ newDeclaration
]

{ #category : #'explicit attributes' }
LwsSubprogramRenamingDeclaration >> newDeclaration: aSubprogramDeclaration [
	<generatedByPlatypus>
	newDeclaration := aSubprogramDeclaration
]
