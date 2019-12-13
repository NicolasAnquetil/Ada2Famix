"
<express_specification>
ENTITY LwsTypeDeclaration ABSTRACT SUPERTYPE SUBTYPE OF (LwsBasicDeclaration);
	name : String;
	discriminant : OPTIONAL LwsDiscriminantPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTypeDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'name',
		'discriminant'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTypeDeclaration class >> annotation [
	<MSEClass: #LwsTypeDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsTypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTypeDeclaration: self
]

{ #category : #'explicit attributes' }
LwsTypeDeclaration >> discriminant [
	<MSEProperty: #discriminant type: #LwsDiscriminantPart>
	<generatedByPlatypus>
	^ discriminant
]

{ #category : #'explicit attributes' }
LwsTypeDeclaration >> discriminant: aDiscriminantPartOrNil [
	<generatedByPlatypus>
	discriminant := aDiscriminantPartOrNil
]

{ #category : #'initialize-release' }
LwsTypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	discriminant := nil
]

{ #category : #'explicit attributes' }
LwsTypeDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsTypeDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]
