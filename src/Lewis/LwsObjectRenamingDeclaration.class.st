"
<express_specification>
ENTITY LwsObjectRenamingDeclaration SUBTYPE OF (LwsElementRenamingDeclaration);
	SELF\LwsElementRenamingDeclaration.newDeclaration : LwsObjectDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsObjectRenamingDeclaration,
	#superclass : #LwsElementRenamingDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsObjectRenamingDeclaration class >> annotation [
	<MSEClass: #LwsObjectRenamingDeclaration super: #LwsElementRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsObjectRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitObjectRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsObjectRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
