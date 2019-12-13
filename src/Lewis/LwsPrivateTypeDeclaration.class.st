"
<express_specification>
ENTITY LwsPrivateTypeDeclaration SUBTYPE OF (LwsFullTypeDeclaration);
	SELF\LwsFullTypeDeclaration.typeDefinition : LwsPrivateTypeDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPrivateTypeDeclaration,
	#superclass : #LwsFullTypeDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPrivateTypeDeclaration class >> annotation [
	<MSEClass: #LwsPrivateTypeDeclaration super: #LwsFullTypeDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPrivateTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPrivateTypeDeclaration: self
]

{ #category : #'initialize-release' }
LwsPrivateTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
