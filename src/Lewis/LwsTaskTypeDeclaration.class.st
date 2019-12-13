"
<express_specification>
ENTITY LwsTaskTypeDeclaration SUBTYPE OF (LwsTaskDeclaration);
	discriminant : OPTIONAL LwsDiscriminantPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskTypeDeclaration,
	#superclass : #LwsTaskDeclaration,
	#instVars : [
		'discriminant'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTaskTypeDeclaration class >> annotation [
	<MSEClass: #LwsTaskTypeDeclaration super: #LwsTaskDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskTypeDeclaration: self
]

{ #category : #'explicit attributes' }
LwsTaskTypeDeclaration >> discriminant [
	<MSEProperty: #discriminant type: #LwsDiscriminantPart>
	<generatedByPlatypus>
	^ discriminant
]

{ #category : #'explicit attributes' }
LwsTaskTypeDeclaration >> discriminant: aDiscriminantPartOrNil [
	<generatedByPlatypus>
	discriminant := aDiscriminantPartOrNil
]

{ #category : #'initialize-release' }
LwsTaskTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	discriminant := nil
]
