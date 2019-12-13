"
<express_specification>
ENTITY LwsElementRenamingDeclaration SUBTYPE OF (LwsRenamingDeclaration);
	newDeclaration : LwsBasicDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsElementRenamingDeclaration,
	#superclass : #LwsRenamingDeclaration,
	#instVars : [
		'newDeclaration'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsElementRenamingDeclaration class >> annotation [
	<MSEClass: #LwsElementRenamingDeclaration super: #LwsRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsElementRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitElementRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsElementRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	newDeclaration := nil
]

{ #category : #'explicit attributes' }
LwsElementRenamingDeclaration >> newDeclaration [
	<MSEProperty: #newDeclaration type: #LwsBasicDeclaration>
	<generatedByPlatypus>
	^ newDeclaration
]

{ #category : #'explicit attributes' }
LwsElementRenamingDeclaration >> newDeclaration: aBasicDeclaration [
	<generatedByPlatypus>
	newDeclaration := aBasicDeclaration
]
