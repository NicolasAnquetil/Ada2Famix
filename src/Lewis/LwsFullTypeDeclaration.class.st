"
<express_specification>
ENTITY LwsFullTypeDeclaration SUBTYPE OF (LwsTypeDeclaration);
	typeDefinition : LwsTypeDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFullTypeDeclaration,
	#superclass : #LwsTypeDeclaration,
	#instVars : [
		'typeDefinition'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsFullTypeDeclaration class >> annotation [
	<MSEClass: #LwsFullTypeDeclaration super: #LwsTypeDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFullTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFullTypeDeclaration: self
]

{ #category : #'initialize-release' }
LwsFullTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	typeDefinition := nil
]

{ #category : #'explicit attributes' }
LwsFullTypeDeclaration >> typeDefinition [
	<MSEProperty: #typeDefinition type: #LwsTypeDefinition>
	<generatedByPlatypus>
	^ typeDefinition
]

{ #category : #'explicit attributes' }
LwsFullTypeDeclaration >> typeDefinition: aTypeDefinition [
	<generatedByPlatypus>
	typeDefinition := aTypeDefinition
]
