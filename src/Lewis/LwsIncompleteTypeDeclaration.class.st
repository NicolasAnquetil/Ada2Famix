"
<express_specification>
ENTITY LwsIncompleteTypeDeclaration SUBTYPE OF (LwsTypeDeclaration);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIncompleteTypeDeclaration,
	#superclass : #LwsTypeDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsIncompleteTypeDeclaration class >> annotation [
	<MSEClass: #LwsIncompleteTypeDeclaration super: #LwsTypeDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIncompleteTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIncompleteTypeDeclaration: self
]

{ #category : #'initialize-release' }
LwsIncompleteTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
