"
<express_specification>
ENTITY LwsProtectedUnitBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
	name : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitBodyStubDeclaration,
	#superclass : #LwsBodyStubDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitBodyStubDeclaration class >> annotation [
	<MSEClass: #LwsProtectedUnitBodyStubDeclaration super: #LwsBodyStubDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitBodyStubDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitBodyStubDeclaration: self
]

{ #category : #'initialize-release' }
LwsProtectedUnitBodyStubDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBodyStubDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBodyStubDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]
