"
<express_specification>
ENTITY LwsUnitRenamingDeclaration SUBTYPE OF (LwsRenamingDeclaration);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUnitRenamingDeclaration,
	#superclass : #LwsRenamingDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsUnitRenamingDeclaration class >> annotation [
	<MSEClass: #LwsUnitRenamingDeclaration super: #LwsRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUnitRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUnitRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsUnitRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
