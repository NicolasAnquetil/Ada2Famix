"
<express_specification>
ENTITY LwsProtectedUnitTypeDeclaration SUBTYPE OF (LwsProtectedUnitDeclaration);
	discriminant : OPTIONAL LwsDiscriminantPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitTypeDeclaration,
	#superclass : #LwsProtectedUnitDeclaration,
	#instVars : [
		'discriminant'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitTypeDeclaration class >> annotation [
	<MSEClass: #LwsProtectedUnitTypeDeclaration super: #LwsProtectedUnitDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitTypeDeclaration: self
]

{ #category : #'explicit attributes' }
LwsProtectedUnitTypeDeclaration >> discriminant [
	<MSEProperty: #discriminant type: #LwsDiscriminantPart>
	<generatedByPlatypus>
	^ discriminant
]

{ #category : #'explicit attributes' }
LwsProtectedUnitTypeDeclaration >> discriminant: aDiscriminantPartOrNil [
	<generatedByPlatypus>
	discriminant := aDiscriminantPartOrNil
]

{ #category : #'initialize-release' }
LwsProtectedUnitTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	discriminant := nil
]
